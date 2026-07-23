import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';

class ProductTabBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;
  final List<String> tabs;
  final int orderCount;
  final int savedOrderCount;

  ProductTabBarWidget({
    Key? key,
    this.orderCount = 0,
    this.savedOrderCount = 0,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.tabs,
  }) : super(key: key);

  @override
  State<ProductTabBarWidget> createState() => _ProductTabBarWidgetState();
}

class _ProductTabBarWidgetState extends State<ProductTabBarWidget>
    with TickerProviderStateMixin {
  // Tab bar selection animation
  late AnimationController _tabController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _tabController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.9,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _tabController, curve: Curves.easeInOut));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _tabController, curve: Curves.easeInOut));

    _tabController.forward();
  }

  @override
  void didUpdateWidget(covariant ProductTabBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _tabController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildMobile();
  }

  Widget _buildMobile() {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColors.initColors().primaryColor,
                borderRadius: BorderRadius.circular(360.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(widget.tabs.length, (index) {
                  final isSelected = widget.selectedIndex == index;

                  return GestureDetector(
                    onTap: () => widget.onTabSelected(index),
                    child: AnimatedBuilder(
                      animation: _tabController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: isSelected ? _scaleAnimation.value : 1.0,
                          child: Container(
                            constraints: BoxConstraints(minWidth: 58.w),
                            padding: EdgeInsets.symmetric(
                              horizontal: isSelected ? 11.5.w : 8.w,
                              vertical: 7.h,
                            ),
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? AppColors.initColors().tabBarColor
                                  : null,
                              color: isSelected
                                  ? null
                                  : AppColors.initColors().primaryColor,
                              borderRadius: BorderRadius.circular(360.r),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                          0.08 * _opacityAnimation.value,
                                        ),
                                        blurRadius: 12,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Center(
                              child: Text(
                                widget.tabs[index],
                                style: TextStyle(
                                  fontSize: AppDimensions.kFontSize13,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w800,
                                  color: isSelected
                                      ? AppColors.initColors().primaryColor
                                      : AppColors.initColors().nonChangeWhite,
                                  letterSpacing: AppDimensions.kLetterSpacing14(
                                    -2.5,
                                  ),
                                  height: AppDimensions.kLineHeight14(22),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
