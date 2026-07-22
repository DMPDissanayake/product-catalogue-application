import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:product_catalogue_application/features/dashbord/bottom_bar_view.dart';

class Routes {
  static const String kDashboardView = "kDashboardView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kDashboardView:
        return PageTransition(
          child: DashboardView(),
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
