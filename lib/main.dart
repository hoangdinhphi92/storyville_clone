import 'package:flutter/material.dart';
import 'package:storyville_clone/ui/app_routes.dart';
import 'package:storyville_clone/utils/utils.dart';

void main() {
  Utils.initSystemUIOverlay();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoute.splash.route,
        routes: kAppRouters,
        onGenerateRoute: (settings) => kOnGenerateRoute(context, settings));
  }
}
