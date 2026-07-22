import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/features/dashbord/widgets/bottom_bar_item.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_fravorite_view.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_list_view.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_search_view.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_images.dart';

class DashboardView extends StatefulWidget {
  final int? initTab;

  const DashboardView({super.key, this.initTab});
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedTab = 0;
  dynamic tabData;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedTab == 0) {
          return true;
        } else {
          changeTab(0);
          return false;
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.initColors().nonChangeWhite,
        body: SafeArea(
          child: Stack(
            children: [
              _getBody(),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  margin: EdgeInsets.symmetric(
                    horizontal: 42.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.initColors().nonChangeWhite,
                    borderRadius: BorderRadius.circular(100.r),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(4, 0),
                        blurRadius: 24,
                        spreadRadius: 0,
                        color: Color(0x3D000000),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomBarItem(
                        selectedIcon: AppImages.svgPrductList,
                        unSelectedIcon: AppImages.svgPrductList,
                        onTap: () {
                          changeTab(0);
                        },
                        isSelected: selectedTab == 0,
                      ),
                      BottomBarItem(
                        selectedIcon: AppImages.svgSearch,
                        unSelectedIcon: AppImages.svgSearch,
                        onTap: () {
                          changeTab(1);
                        },
                        isSelected: selectedTab == 1,
                      ),
                      BottomBarItem(
                        selectedIcon: AppImages.svgFavorite,
                        unSelectedIcon: AppImages.svgFavorite,
                        onTap: () async {
                          changeTab(2);
                        },
                        isSelected: selectedTab == 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeTab(int value, {dynamic data}) {
    setState(() {
      if (selectedTab != value) {
        selectedTab = value;

        tabData = data;
      }
    });
  }

  _getBody() {
    switch (selectedTab) {
      case 0:
        return ProductView(onChangeTab: changeTab, data: tabData);
      case 1:
        return ProductSearchView(onChangeTab: changeTab, data: tabData);
      case 2:
        return ProductFravoriteView(onChangeTab: changeTab, data: tabData);
      default:
        return ProductView(onChangeTab: changeTab, data: tabData);
    }
  }
}
