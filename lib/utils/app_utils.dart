import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const MaterialColor primaryMaterialColor = const MaterialColor(
  0xFFFF2727,
  const <int, Color>{
    50: const Color(0xFFFF2727),
    100: const Color(0xFFFF2727),
    200: const Color(0xFFFF2727),
    300: const Color(0xFFFF2727),
    400: const Color(0xFFFF2727),
    500: const Color(0xFFFF2727),
    600: const Color(0xFFFF2727),
    700: const Color(0xFFFF2727),
    800: const Color(0xFFFF2727),
    900: const Color(0xFFFF2727),
  },
);

const primaryColor = Color(0xFFFF2727);


var blackRegular14 = TextStyle(
  color: Colors.black,
  fontSize: 14.sp,
);

TextStyle blackBold14 = TextStyle(
    color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w500);

var blackRegular16 = TextStyle(
  color: Colors.black,
  fontSize: 16.sp,
);

var blackRegular18 = TextStyle(
  color: Colors.black,
  fontSize: 18.sp,
);

var blackBold16 = TextStyle(
    color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500);

var blackBold18 = TextStyle(
    color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w500);

var hintTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14.sp,
);

var whiteRegular14 = TextStyle(
  color: Colors.white,
  fontSize: 14.sp,
);

var whiteBold14 = TextStyle(
    color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500);

var whiteRegular16 = TextStyle(
  color: Colors.white,
  fontSize: 16.sp,
);

var whiteBold16 = TextStyle(
    color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500);



Future<bool> check() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text, toastLength: Toast.LENGTH_LONG, fontSize: 16);
}