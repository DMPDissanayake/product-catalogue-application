import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_catalogue_application/core/theme/app_colors.dart';
import 'package:product_catalogue_application/utils/app_dimensions.dart';
import 'package:product_catalogue_application/utils/app_images.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final Duration debounceDuration;
  final String? hintText;

  const SearchTextField({
    Key? key,
    required this.controller,
    required this.onSearch,
    required this.hintText,
    this.debounceDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(widget.debounceDuration, () {
      widget.onSearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: AppColors.initColors().searchColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        maxLength: 50,
        controller: widget.controller,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: AppDimensions.kFontSize14,
          height: 1.2,
          letterSpacing: -0.4,
          color: AppColors.initColors().blackTextColor,
        ),
        onChanged: _onSearchChanged,
        onSubmitted: (text) {
          _debounceTimer?.cancel();
          widget.onSearch(text);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          isDense: true,
          counterText: "",
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: widget.hintText ?? 'Search',
          suffixIconConstraints: BoxConstraints(maxHeight: 30.h),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: SvgPicture.asset(
              AppImages.svgSearch,
              height: 22.h,
              colorFilter: ColorFilter.mode(
                AppColors.initColors().primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: AppDimensions.kFontSize14,
            height: 1.0,
            letterSpacing: -0.2,
            color: AppColors.initColors().blackTextColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
