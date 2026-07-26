import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';

class ProductAppButton extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final double? height;
  final Widget? prefixIcon;
  final Widget? suffixIcons;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;

  ProductAppButton({
    super.key,
    required this.buttonText,
    required this.onTapButton,
    this.width = 0,
    this.height,
    this.prefixIcon,
    this.suffixIcons,
    this.buttonColor,
    this.textColor,
    this.borderColor,
    this.fontSize,
  });

  @override
  State<ProductAppButton> createState() => _ProductAppButtonState();
}

class _ProductAppButtonState extends State<ProductAppButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        widget.onTapButton();
      },
      child: MiddleContainer(widget: widget),
    );
  }
}

class MiddleContainer extends StatelessWidget {
  const MiddleContainer({super.key, required this.widget});

  final ProductAppButton widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 52.h,
      width: widget.width == 0 ? double.infinity : widget.width,
      decoration: BoxDecoration(
        border: widget.borderColor != null
            ? Border.all(color: widget.borderColor!)
            : null,
        color: widget.buttonColor ?? AppColors.initColors().primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.prefixIcon ?? const SizedBox.shrink(),
            if (widget.prefixIcon != null) const SizedBox(width: 10),
            Flexible(
              child: Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: widget.fontSize,
                  height: 1.5,
                  letterSpacing: -0.4,
                  color:
                      widget.textColor ?? AppColors.initColors().nonChangeWhite,
                ),
              ),
            ),
            if (widget.suffixIcons != null) const SizedBox(width: 5),
            widget.suffixIcons ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
