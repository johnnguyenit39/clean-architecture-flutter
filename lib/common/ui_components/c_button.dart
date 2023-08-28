import 'package:getjoke/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final String? title;
  final Color? titleColor;
  final double? titleFontSize;
  final FontWeight? titleFontWeight;
  final double? radius;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final String? fontFamily;
  final FocusNode? focusNode;

  const CButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.title,
    this.radius,
    this.borderColor,
    this.borderWidth,
    this.titleColor,
    this.titleFontSize,
    this.titleFontWeight,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.fontFamily,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: Container(
        height: height,
        width: width,
        margin: margin ?? const EdgeInsets.all(0),
        child: TextButton(
          onPressed: onPressed,
          focusNode: focusNode,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 0.0),
                side: BorderSide(
                    color: borderColor ?? Colors.transparent,
                    width: borderWidth ?? 0)),
          ),
          child: Text(
            title ?? '',
            style: TextStyle(
              fontFamily: fontFamily ?? AppFonts.plusJakartaSansRegular,
              fontSize: titleFontSize ?? 14,
              color: titleColor ?? Colors.black,
              fontWeight: titleFontWeight ?? FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
