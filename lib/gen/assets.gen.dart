/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsDataGen {
  const $AssetsDataGen();

  /// File path: assets/data/stories.json
  String get stories => 'assets/data/stories.json';

  /// List of all assets
  List<String> get values => [stories];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/cover_placeholder.jpeg
  AssetGenImage get coverPlaceholder =>
      const AssetGenImage('assets/images/cover_placeholder.jpeg');

  /// File path: assets/images/logo_text_light.png
  AssetGenImage get logoTextLight =>
      const AssetGenImage('assets/images/logo_text_light.png');

  /// File path: assets/images/splash_icon_1.png
  AssetGenImage get splashIcon1 =>
      const AssetGenImage('assets/images/splash_icon_1.png');

  /// File path: assets/images/splash_icon_2.png
  AssetGenImage get splashIcon2 =>
      const AssetGenImage('assets/images/splash_icon_2.png');

  /// File path: assets/images/splash_icon_3.png
  AssetGenImage get splashIcon3 =>
      const AssetGenImage('assets/images/splash_icon_3.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [coverPlaceholder, logoTextLight, splashIcon1, splashIcon2, splashIcon3];
}

class Assets {
  Assets._();

  static const $AssetsDataGen data = $AssetsDataGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
    bool gaplessPlayback = false,
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
