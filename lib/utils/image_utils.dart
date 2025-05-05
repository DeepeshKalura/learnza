import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageUtils {
  /// Returns a Widget that displays [urlOrAsset], automatically handling:
  /// • SVG vs. raster
  /// • network vs. asset
  /// • placeholders and error widgets
  /// • caching for network rasters
  ///
  /// [urlOrAsset] may be a full HTTP(S) URL or an asset path.
  /// If it's null or empty, [defaultAsset] will be used.
  /// Set [forceSvg]=true to treat any URL as SVG.
  static Widget load({
    required String? urlOrAsset,
    String defaultAsset = 'assets/images/default_profile.png',
    bool forceSvg = false,
    BoxFit fit = BoxFit.cover,
    double? width,
    double? height,
    BorderRadius? borderRadius,
    Color? backgroundColor,
    Widget? placeholder,
    Widget? errorWidget,
  }) {
    // 1) Determine actual source
    final src = (urlOrAsset?.isNotEmpty == true) ? urlOrAsset! : defaultAsset;

    // 2) Determine if it's SVG
    final isNetwork = src.startsWith('http');
    final lc = src.toLowerCase();
    final isSvg = forceSvg ||
        lc.endsWith('.svg') ||
        // catch your avatars-from-dicebear etc
        lc.contains('dicebear') ||
        lc.contains('avatars') ||
        lc.contains('api.multiavatar');

    // 3) Default placeholders
    final placeholder0 = placeholder ??
        Container(
          width: width,
          height: height,
          color: Colors.grey.shade200,
          child: const Center(child: CircularProgressIndicator()),
        );
    final error = errorWidget ??
        Container(
          width: width,
          height: height,
          color: Colors.grey.shade300,
          child: Icon(Icons.broken_image, color: Colors.grey.shade600),
        );

    Widget img;
    if (isSvg) {
      if (isNetwork) {
        img = SvgPicture.network(
          src,
          width: width,
          height: height,
          fit: fit,
          placeholderBuilder: (_) => placeholder0,
        );
      } else {
        img = SvgPicture.asset(
          src,
          width: width,
          height: height,
          fit: fit,
        );
      }
    } else {
      if (isNetwork) {
        img = CachedNetworkImage(
          imageUrl: src,
          width: width,
          height: height,
          fit: fit,
          placeholder: (_, __) => placeholder0,
          errorWidget: (_, __, ___) => error,
        );
      } else {
        img = Image.asset(
          src,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (_, __, ___) => error,
        );
      }
    }

    // 4) Wrap with clipping if needed
    if (borderRadius != null || backgroundColor != null) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
        ),
        clipBehavior: Clip.antiAlias,
        child: img,
      );
    }
    return img;
  }
}
