import 'package:danozone/router/routes.dart';
import 'package:danozone/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Setup orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (BuildContext context, Widget child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        initialRoute: SplashScreen.routeName,
        //initialRoute:authStore.onboarded ? SplashScreen.routeName : SplashScreen.routeName,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class DanozoneApp extends StatefulWidget {
  const DanozoneApp({Key key}) : super(key: key);
  //static const routeName = '/splash';

  @override
  State<DanozoneApp> createState() => _DanozoneAppState();
}

class _DanozoneAppState extends State<DanozoneApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}



