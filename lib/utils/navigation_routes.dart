import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_detailes_view.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_fravorite_view.dart';
import 'package:product_catalogue_application/features/products/presentation/view/product_list_view.dart';

class Routes {
  static const String kProductView = "kProductView";
  static const String kProductFravoriteView = "kProductFravoriteView";
  static const String kProductDetailesView = "kProductDetailesView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kProductView:
        return PageTransition(
          settings: settings,
          child: const ProductView(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 250),
        );

      case Routes.kProductFravoriteView:
        return PageTransition(
          settings: settings,
          child: const ProductFravoriteView(),
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 350),
          reverseDuration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );

      case Routes.kProductDetailesView:
        return PageTransition(
          settings: settings,
          child: ProductDetailesView(
            args: settings.arguments as ProductDitailesViewArgs,
          ),
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(milliseconds: 200),
          reverseDuration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Invalid Route"))),
        );
    }
  }
}
