/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_hi.svg
  SvgGenImage get icHi => const SvgGenImage('assets/icons/ic_hi.svg');

  /// File path: assets/icons/ic_looking.svg
  SvgGenImage get icLooking => const SvgGenImage('assets/icons/ic_looking.svg');

  /// File path: assets/icons/ic_no_book_found.svg
  SvgGenImage get icNoBookFound =>
      const SvgGenImage('assets/icons/ic_no_book_found.svg');

  /// File path: assets/icons/ic_sleepy.svg
  SvgGenImage get icSleepy => const SvgGenImage('assets/icons/ic_sleepy.svg');

  /// File path: assets/icons/ic_somthing_went_wrong.svg
  SvgGenImage get icSomthingWentWrong =>
      const SvgGenImage('assets/icons/ic_somthing_went_wrong.svg');

  /// File path: assets/icons/ic_under_development.svg
  SvgGenImage get icUnderDevelopment =>
      const SvgGenImage('assets/icons/ic_under_development.svg');

  /// File path: assets/icons/ic_welcome.svg
  SvgGenImage get icWelcome => const SvgGenImage('assets/icons/ic_welcome.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icHi,
        icLooking,
        icNoBookFound,
        icSleepy,
        icSomthingWentWrong,
        icUnderDevelopment,
        icWelcome
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ig_campus_image.png
  AssetGenImage get igCampusImage =>
      const AssetGenImage('assets/images/ig_campus_image.png');

  /// File path: assets/images/ig_nagendra_basnet.png
  AssetGenImage get igNagendraBasnet =>
      const AssetGenImage('assets/images/ig_nagendra_basnet.png');

  /// File path: assets/images/ig_notebook_image.png
  AssetGenImage get igNotebookImage =>
      const AssetGenImage('assets/images/ig_notebook_image.png');

  /// File path: assets/images/ig_shadanda.png
  AssetGenImage get igShadanda =>
      const AssetGenImage('assets/images/ig_shadanda.png');

  /// File path: assets/images/ig_student_council.png
  AssetGenImage get igStudentCouncil =>
      const AssetGenImage('assets/images/ig_student_council.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        igCampusImage,
        igNagendraBasnet,
        igNotebookImage,
        igShadanda,
        igStudentCouncil
      ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// Directory path: assets/logo/adaptive_icon
  $AssetsLogoAdaptiveIconGen get adaptiveIcon =>
      const $AssetsLogoAdaptiveIconGen();

  /// File path: assets/logo/appstore.png
  AssetGenImage get appstore => const AssetGenImage('assets/logo/appstore.png');

  /// File path: assets/logo/playstore.png
  AssetGenImage get playstore =>
      const AssetGenImage('assets/logo/playstore.png');

  /// List of all assets
  List<AssetGenImage> get values => [appstore, playstore];
}

class $AssetsLogoAdaptiveIconGen {
  const $AssetsLogoAdaptiveIconGen();

  /// Directory path: assets/logo/adaptive_icon/Shadanda
  $AssetsLogoAdaptiveIconShadandaGen get shadanda =>
      const $AssetsLogoAdaptiveIconShadandaGen();
}

class $AssetsLogoAdaptiveIconShadandaGen {
  const $AssetsLogoAdaptiveIconShadandaGen();

  /// File path: assets/logo/adaptive_icon/Shadanda/ic_launcher_background.png
  AssetGenImage get icLauncherBackground => const AssetGenImage(
      'assets/logo/adaptive_icon/Shadanda/ic_launcher_background.png');

  /// File path: assets/logo/adaptive_icon/Shadanda/ic_launcher_foreground.png
  AssetGenImage get icLauncherForeground => const AssetGenImage(
      'assets/logo/adaptive_icon/Shadanda/ic_launcher_foreground.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [icLauncherBackground, icLauncherForeground];
}

class Assets {
  Assets._();

  static const String aEnv = '.env';
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
