import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_project/ui/LoginScreen/login_screen.dart';
import 'package:interview_project/utils/app_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
              title: 'Interview Project',
              theme: ThemeData(
                primarySwatch: primaryMaterialColor,
              ),
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return MediaQuery(
                  child: child,
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                );
              },
              home: LoginScreen(),
            ));
  }
}
