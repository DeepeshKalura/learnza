import 'dart:developer' as developer;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import '../../../utils/resource_util.dart';

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String defaultImage;
  final double width;
  final double height;
  final ShapeType shape;
  final BoxFit fit;
  final Color backgroundColor;
  final BorderRadius? customBorderRadius;
  final bool showLoading;

  const CustomImageWidget({
    super.key,
    this.imageUrl,
    this.defaultImage = ResourceUtil.defaultProfileImage,
    this.width = 60,
    this.height = 60,
    this.shape = ShapeType.circle,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.transparent,
    this.customBorderRadius,
    this.showLoading = true,
  });

  @override
  Widget build(BuildContext context) {
    // If imageUrl is null, return default image
    if (imageUrl == null) {
      return _buildContainer(
        child: Image.network(
          defaultImage,
          fit: fit,
        ),
      );
    }

    // Check if it's an SVG
    if (imageUrl!.toLowerCase().contains('svg')) {
      return _buildSvgImage(context);
    } else {
      // Regular image
      return _buildRegularImage();
    }
  }

  Widget _buildSvgImage(BuildContext context) {
    return _buildContainer(
      child: FutureBuilder<String>(
        future: _loadSvgData(imageUrl!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingWidget();
          } else if (snapshot.hasError) {
            return _buildErrorWidget();
          } else {
            return SvgPicture.string(
              snapshot.data!,
              fit: fit,
            );
          }
        },
      ),
    );
  }

  Widget _buildRegularImage() {
    return _buildContainer(
      child: CachedNetworkImage(
        imageUrl: imageUrl!,
        fit: fit,
        placeholder: (context, url) => _buildLoadingWidget(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      ),
    );
  }

  Widget _buildContainer({required Widget child}) {
    if (shape == ShapeType.circle) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: ClipOval(child: child),
      );
    } else if (shape == ShapeType.rectangle) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: customBorderRadius ?? BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: customBorderRadius ?? BorderRadius.circular(8),
          child: child,
        ),
      );
    } else {
      // Custom shape based on customBorderRadius
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: customBorderRadius,
          color: backgroundColor,
        ),
        child: ClipRRect(
          borderRadius: customBorderRadius ?? BorderRadius.zero,
          child: child,
        ),
      );
    }
  }

  Widget _buildLoadingWidget() {
    return showLoading
        ? Center(
            child: SizedBox(
              width: width / 3,
              height: height / 3,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          )
        : Container(
            color: backgroundColor,
          );
  }

  Widget _buildErrorWidget() {
    return Image.network(
      defaultImage,
      fit: fit,
    );
  }

  Future<String> _loadSvgData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        developer.log('Failed to load SVG');
        throw Exception('Failed to load SVG');
      }
    } catch (e, s) {
      developer.log('load Svg data', error: e, stackTrace: s);
      rethrow;
    }
  }
}

enum ShapeType {
  circle,
  rectangle,
  custom,
}
