// lib/screen/common/widget/custom_image_widget.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Make sure this import is here

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
    final effectiveUrl = imageUrl?.isNotEmpty == true ? imageUrl : null;

    // --- START OF CHANGE ---
    final bool isSvg = effectiveUrl?.toLowerCase().contains('svg') ?? false;

    if (effectiveUrl == null) {
      // If no URL is provided, show the default raster image.
      return _buildContainer(child: Image.network(defaultImage, fit: fit));
    } else if (isSvg) {
      return _buildContainer(
        child: SvgPicture.network(
          effectiveUrl,
          fit: fit,
          placeholderBuilder: (BuildContext context) => _buildLoadingWidget(),
        ),
      );
    } else {
      // For all other URLs, use CachedNetworkImage
      return _buildContainer(
        child: CachedNetworkImage(
          imageUrl: effectiveUrl,
          fit: fit,
          placeholder: (context, url) => _buildLoadingWidget(),
          errorWidget: (context, url, error) => _buildErrorWidget(),
        ),
      );
    }
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
    } else {
      // Handles both rectangle and custom shapes
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: customBorderRadius ??
              (shape == ShapeType.rectangle ? BorderRadius.circular(8) : null),
          color: backgroundColor,
        ),
        clipBehavior: Clip.antiAlias,
        child: child,
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
    // When a regular image fails, fallback to the default raster image.
    return Image.network(
      defaultImage,
      fit: fit,
    );
  }
}

enum ShapeType {
  circle,
  rectangle,
  custom,
}
