import 'package:flutter/material.dart';
import 'package:route_social_app/Features/home/presentation/pages/home_screen.dart';
import 'package:route_social_app/core/resources/strings_manager.dart';
import '../../Features/details/presentation/pages/details_screen.dart';
import '../../Features/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detailsRoute:
        return MaterialPageRoute(
            builder: (_) => const DetailsScreen(), settings: settings);
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
