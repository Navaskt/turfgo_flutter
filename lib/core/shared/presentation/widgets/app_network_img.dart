import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';


class AppNetworkImg extends StatelessWidget {
  final String imageUrl;
  final BoxShape shape;
  final double? borderRadius;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Color? bg;
  final Color? borderColor;
  final double? borderWidth;
  final Widget? placeholder;
  final Widget? errorWidget;
  final EdgeInsetsGeometry? padding;

  const AppNetworkImg({
    super.key,
    required this.imageUrl,
    this.shape = BoxShape.circle,
    this.borderRadius = 4,
    this.fit = BoxFit.contain,
    this.width = 24,
    this.height = 24,
    this.bg,
    this.borderColor,
    this.borderWidth,
    this.placeholder,
    this.errorWidget,
    this.padding,
  }) : assert(
         shape == BoxShape.circle ||
             (shape == BoxShape.rectangle && borderRadius != null),
         'If shape is rectangle, borderRadius must be provided',
       ),
       assert(
         (borderColor == null && borderWidth == null) ||
             (borderColor != null && borderWidth != null),
         'borderColor and borderWidth must both be provided or both be null',
       );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width?.r,
      height: height?.r,
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle && borderRadius != null
            ? BorderRadius.circular(borderRadius!)
            : null,
        border: borderColor != null && borderWidth != null
            ? Border.all(color: borderColor!, width: borderWidth!)
            : null,
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
      ),
    );
  }
}
