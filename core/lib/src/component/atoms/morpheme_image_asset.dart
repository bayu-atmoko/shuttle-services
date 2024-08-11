import 'package:core/core.dart';
import 'package:flutter/material.dart';

class MorphemeImageAsset extends StatelessWidget {
  const MorphemeImageAsset(
    this.image, {
    super.key,
    this.package,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.colorFilter,
    this.color,
    this.errorWidget,
    this.semanticLabel,
    this.excludeSemantics,
  });

  final String image;
  final String? package;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Alignment alignment;
  final ColorFilter? colorFilter;
  final Color? color;
  final Widget Function(BuildContext context, String url, Object error)?
      errorWidget;
  final String? semanticLabel;
  final bool? excludeSemantics;

  ImageProvider<Object> imageProvider() =>
      AssetImage(image, bundle: null, package: package);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      container: semanticLabel != null ? true : false,
      excludeSemantics:
          semanticLabel.isNullOrEmpty ? true : (excludeSemantics ?? false),
      child: semanticLabel != null
          // exculde semantics for prevent talkback 'semanticLabel + image'
          ? ExcludeSemantics(
              child: _buildImage(),
            )
          : _buildImage(),
    );
  }

  Widget _buildImage() {
    if (RegExp(r'^(http|https)').hasMatch(image)) {
      return CachedNetworkImage(
        imageUrl: image,
        width: width?.roundToDouble(),
        height: height?.roundToDouble(),
        fit: fit,
        alignment: alignment,
        placeholder: (context, url) => MorphemeShimmer(
          child: Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
        ),
        errorWidget: errorWidget,
      );
    } else if (RegExp(r'\.svg$').hasMatch(image)) {
      return SvgPicture.asset(
        image,
        package: package,
        width: width?.roundToDouble(),
        height: height?.roundToDouble(),
        fit: fit,
        alignment: alignment,
        semanticsLabel: semanticLabel,
        colorFilter: colorFilter,
      );
    }

    return Image.asset(
      image,
      package: package,
      width: width?.roundToDouble(),
      height: height?.roundToDouble(),
      fit: fit,
      alignment: alignment,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}
