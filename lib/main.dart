import 'package:flutter/material.dart';
import 'package:foodoos/application/main_config/main_config.dart' as config;
import 'package:foodoos/presentation/utilis/scroll_behavior.dart';

import 'application/core/routes/route_generator.dart';
import 'application/core/routes/route_path.dart';
import 'mixin/base_mixin.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await config.initMainServiceLocator();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>  with BaseMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(fontFamily: 'Epilogue'),
      debugShowCheckedModeBanner: false,

      builder: (context, child) => ScrollConfiguration(
        behavior: CustomScrollBehavior(),
        child: child!,
      ),
      initialRoute: RoutePath.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: routeNavigator.key(),
    );
  }
}

