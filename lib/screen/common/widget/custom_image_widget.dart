// lib/screen/common/widget/custom_image_widget.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/logger.dart';

enum ShapeType {
  circle,
  rectangle,
}

class CustomImageWidget extends StatelessWidget {
  final String? imageUrl;
  final String defaultImageAsset;
  final double width;
  final double height;
  final ShapeType shape;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CustomImageWidget({
    super.key,
    required this.imageUrl,
    required this.defaultImageAsset,
    this.width = 60,
    this.height = 60,
    this.shape = ShapeType.circle,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = shape == ShapeType.circle
        ? BorderRadius.circular(width / 2)
        : borderRadius ?? BorderRadius.circular(8);

    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: effectiveBorderRadius,
      ),
      child: _buildImage(),
    );
  }

  Widget _buildImage() {
    final effectiveUrl = imageUrl;

    if (effectiveUrl == null || effectiveUrl.isEmpty) {
      return _buildErrorWidget(reason: "URL is null or empty");
    }

    final bool isNetwork = effectiveUrl.startsWith('http');
    final bool isSvg = effectiveUrl.toLowerCase().endsWith('.svg') ||
        effectiveUrl.toLowerCase().contains('api.dicebear.com');

    if (isSvg) {
      if (isNetwork) {
        return SvgPicture.network(
          effectiveUrl,
          fit: fit,
          placeholderBuilder: (context) => _buildLoadingWidget(),
        );
      }
      // SVGs from assets are also possible, though less common in this setup
      return SvgPicture.asset(
        effectiveUrl,
        fit: fit,
        placeholderBuilder: (context) => _buildLoadingWidget(),
      );
    }
    // Handle Raster Images (JPG, PNG, etc.)
    else {
      if (isNetwork) {
        return CachedNetworkImage(
          imageUrl: effectiveUrl,
          fit: fit,
          placeholder: (context, url) => _buildLoadingWidget(),
          errorWidget: (context, url, error) {
            log.e("Failed to load network image: $url", error: error);
            return _buildErrorWidget(reason: "Failed to load network image");
          },
        );
      } else {
        // Assume it's a local asset path
        return Image.asset(
          effectiveUrl,
          fit: fit,
          errorBuilder: (context, error, stackTrace) {
            log.e("Failed to load local asset: $effectiveUrl", error: error);
            return _buildErrorWidget(reason: "Failed to load local asset");
          },
        );
      }
    }
  }

  Widget _buildLoadingWidget() {
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  Widget _buildErrorWidget({required String reason}) {
    log.w("Displaying fallback image. Reason: $reason");
    return Image.asset(
      defaultImageAsset,
      fit: fit,
    );
  }
}
