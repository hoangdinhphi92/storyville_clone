import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyville_clone/repository/story.dart';
import 'package:storyville_clone/ui/detail/detail_screen.dart';
import 'package:storyville_clone/ui/home/home_screen.dart';
import 'package:storyville_clone/ui/splash/splash_screen.dart';

enum AppRoute {
  splash("/"),
  login("/login"),
  home("/home"),
  detail("/detail");

  final String route;

  const AppRoute(this.route);
}

typedef AppRouteFactory = Route<dynamic>? Function(
    BuildContext context, RouteSettings settings);

final Map<String, WidgetBuilder> kAppRouters = {
  AppRoute.splash.route: (context) => const SplashScreen(),
  AppRoute.home.route: (context) => const HomeScreen(),
};

AppRouteFactory kOnGenerateRoute = (context, settings) {
  if (settings.name == AppRoute.detail.route) {
    final story = settings.arguments as Story;
    return MaterialPageRoute(
      builder: (context) => DetailScreen(story: story),
    );
  }

  return null;
};

extension NavigationContext on BuildContext {
  Future<T?> pushTo<T extends Object?>(
    AppRoute route, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(this, route.route, arguments: arguments);
  }

  Future<T?> goTo<T extends Object?>(
    AppRoute route, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      route.route,
      arguments: arguments,
      (route) => false,
    );
  }

  pop<T extends Object?>([T? result]) {
    return Navigator.pop(this, result);
  }
}
