import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../utils/app_colors.dart';

class BottomBarItem extends StatefulWidget {
  final String selectedIcon;
  final String unSelectedIcon;
  final VoidCallback onTap;
  final bool isSelected;
  const BottomBarItem({
    super.key,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<BottomBarItem> createState() => _BottomBarItemState();
}

class _BottomBarItemState extends State<BottomBarItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          widget.onTap();
          _controller.forward().then((_) {
            _controller.reverse();
          });
        },
        // Using focusColor/highlightColor transparent to clean up the tap effect
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            alignment: Alignment.center,
            height: 60.h,
            width: 50.h,
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? AppColors.initColors().primaryColor
                  : AppColors.initColors().nonChangeWhite,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: SvgPicture.asset(
              widget.isSelected ? widget.selectedIcon : widget.unSelectedIcon,
              height: 24.h,
              color: widget.isSelected
                  ? AppColors.initColors().nonChangeWhite
                  : AppColors.initColors().primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
