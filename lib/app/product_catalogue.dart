import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_catalogue_application/core/di/injection_container.dart';
import 'package:product_catalogue_application/features/products/presentation/bloc/product_bloc.dart';
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_cubit.dart';
import 'package:product_catalogue_application/utils/app_colors.dart';
import 'package:product_catalogue_application/utils/app_constants.dart';
import 'package:product_catalogue_application/utils/navigation_routes.dart';

class ProductCatalogue extends StatelessWidget {
  const ProductCatalogue({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FavoriteCubit>(
          create: (context) => sl<FavoriteCubit>()..loadFavorites(),
        ),
        BlocProvider<ProductBloc>(create: (context) => sl<ProductBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          initialRoute: Routes.kProductView,
          onGenerateRoute: Routes.generateRoute,
          theme: ThemeData(
            fontFamily: 'AvenirArabic',
            primaryColor: AppColors.initColors().primaryColor,
            scaffoldBackgroundColor: AppColors.initColors().primaryColor,
          ),
        ),
      ),
    );
  }
}
