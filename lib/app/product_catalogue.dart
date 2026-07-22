import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_constants.dart';
import 'package:product_catalogue_application/utils/navigation_routes.dart';

class ProductCatalogue extends StatelessWidget {
  const ProductCatalogue({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.appName,
        initialRoute: Routes.kDashboardView,
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          fontFamily: 'AvenirArabic',
          primaryColor: AppColors.initColors().primaryColor,
          scaffoldBackgroundColor: AppColors.initColors().primaryColor,
        ),
      ),
    );
  }
}
