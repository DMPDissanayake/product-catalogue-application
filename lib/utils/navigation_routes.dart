import 'package:flutter/material.dart';

class Routes {
  static const String kMaintenanceView = "kMaintenanceView";
  //static const String kUpdateView = "kUpdateView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.kSplashView:
      //   return PageTransition(
      //       child: SplashView(), type: PageTransitionType.fade);

      // case Routes.kMaintenanceView:
      //   return PageTransition(
      //       child: MaintenanceView(), type: PageTransitionType.fade);

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Invalid Route"))),
        );
    }
  }
}
