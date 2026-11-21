import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_ui/material_ui.dart';

export '../../../constants/app_assets.dart';

/// A reusable and responsive widget for displaying SVG icons from assets.
///
/// {@tool snippet}
/// ```dart
/// SvgIcon(
///   'assets/icons/user.svg',
///   size: 24,
///   color: Colors.red,
/// )
/// ```
/// {@end-tool}
class AppSvgIcon extends StatelessWidget {
  /// Creates an SvgIcon widget.
  const AppSvgIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.height,
    this.width,
    this.fit,
    this.flipRTL = false,
  });

  /// The full asset path to the SVG file (e.g., 'assets/icons/home.svg').
  final String icon;
  final bool flipRTL;

  /// The target size (width and height) of the icon in logical pixels.
  ///
  /// This value is made responsive using `flutter_screenutil`.
  final double? size;
  final double? height;
  final double? width;
  final BoxFit? fit;

  /// An optional color to tint the SVG icon.
  ///
  /// If null, the SVG's original colors will be used.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w ?? size?.r,
      height: height?.h ?? size?.r,
      child: Transform.flip(
        flipX: flipRTL
            ? Directionality.of(context) == TextDirection.rtl
            : false,
        child: SvgPicture.asset(
          icon,
          fit: fit ?? BoxFit.contain,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcIn)
              : null,
        ),
      ),
    );
  }
}
