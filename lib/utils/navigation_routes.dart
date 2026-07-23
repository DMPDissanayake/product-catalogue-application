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
          child: ProductView(),
          type: PageTransitionType.fade,
        );
      case Routes.kProductFravoriteView:
        return PageTransition(
          child: const ProductFravoriteView(),
          type: PageTransitionType.fade,
        );
      case Routes.kProductDetailesView:
        return PageTransition(
          child: ProductDetailesView(
            args: settings.arguments as ProductDitailesViewArgs,
          ),
          type: PageTransitionType.fade,
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Invalid Route"))),
        );
    }
  }
}
