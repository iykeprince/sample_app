import 'package:flutter/material.dart';

import '../constants.dart';

enum ButtonType { fill, outline, text }

class SampleButton extends StatelessWidget {
  final double borderRadius;
  final double fontSize;
  final String title;
  final bool busy;
  final Border? border;
  // final bool fullwidth;
  Function() onPressed;
  final Color buttonBgColor;
  final Color? buttonTextColor;
  final Color? leadingIconColor;
  final Color? trailingIconColor;
  final FontWeight fontWeight;
  final ButtonType? buttonType;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double trailingIconSpace;
  final double leadingIconSpace;
  SampleButton({
    Key? key,
    this.borderRadius = 8.0,
    this.border,
    this.fontSize = 16.0,
    this.trailingIconSpace = 4.0,
    this.leadingIconSpace = 4.0,
    this.fontWeight = FontWeight.w500,
    required this.onPressed,
    this.buttonBgColor = kPrimaryColor,
    this.buttonTextColor = Colors.white,
    required this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.leadingIconColor = kPrimaryColor,
    this.trailingIconColor = kPrimaryColor,
    this.busy = false,
    this.buttonType = ButtonType.fill,
  });

  Color getBackgroundColor() {
    if (buttonType == ButtonType.outline) {
      return buttonTextColor != null ? buttonTextColor! : kWhiteColor;
    } else if (buttonType == ButtonType.fill) {
      return buttonBgColor;
    } else {
      return Colors.transparent;
    }
  }

  Color getColor() {
    if (buttonType == ButtonType.fill) {
      return buttonTextColor != null ? buttonTextColor! : kWhiteColor;
    } else if (buttonType == ButtonType.outline) {
      return buttonBgColor;
    } else {
      return buttonTextColor != null ? buttonTextColor! : buttonBgColor;
    }
  }

  Border constructBorder() {
    if (border != null) {
      return border!;
    }
    if (buttonType == ButtonType.outline) {
      return Border.all(
        color: getColor(),
        width: 1,
      );
    } else {
      return Border.all(
        color: Colors.transparent,
        width: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final _color = getColor();
    final _bgColor = getBackgroundColor();
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 19.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: _bgColor,
          border: constructBorder(),
        ),
        child:
            // busy
            //     ? const SizedBox(
            //         width: AppSize.s16,
            //         height: AppSize.s16,
            //         child: PosCircularProgress(),
            //       )
            // :
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leadingIcon != null)
              Icon(
                leadingIcon,
                color: leadingIconColor,
              ),
            if (leadingIcon != null) SizedBox(width: leadingIconSpace),
            Text(
              title,
              style: TextStyle(
                  color: _color, fontSize: fontSize, fontWeight: fontWeight),
            ),
            if (trailingIcon != null) SizedBox(width: trailingIconSpace),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                color: trailingIconColor,
              ),
            if (busy != null && busy)
              const SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  color: kWhiteColor,
                  strokeWidth: 2,
                ),
              )
          ],
        ),
      ),
    );
  }
}
