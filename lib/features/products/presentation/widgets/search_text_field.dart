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
    this.hintText,
    this.debounceDuration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? _debounceTimer;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    _debounceTimer?.cancel();
    _focusNode.dispose();
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

  void _clearSearch() {
    _debounceTimer?.cancel();
    widget.controller.clear();
    widget.onSearch('');
  }

  @override
  Widget build(BuildContext context) {
    final hasText = widget.controller.text.isNotEmpty;

    return Container(
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.initColors().searchColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        maxLength: 50,
        autocorrect: false,
        enableSuggestions: false,
        controller: widget.controller,
        focusNode: _focusNode,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppDimensions.kFontSize14,
          height: 1.2,
          letterSpacing: 0.5,
          color: AppColors.initColors().blackTextColor,
          decoration: TextDecoration.none,
        ),
        onTapOutside: (_) => _focusNode.unfocus(),
        onChanged: _onSearchChanged,
        onSubmitted: (text) {
          _debounceTimer?.cancel();
          _focusNode.unfocus();
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
            child: hasText
                ? GestureDetector(
                    onTap: _clearSearch,
                    child: Icon(
                      Icons.close,
                      size: 20.h,
                      color: AppColors.initColors().primaryColor,
                    ),
                  )
                : SvgPicture.asset(
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
            letterSpacing: 0.2,
            color: AppColors.initColors().blackTextColor.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
