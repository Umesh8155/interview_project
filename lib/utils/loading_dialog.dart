import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showLoader(context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Dialog(
            insetPadding: EdgeInsets.all(0.4.sw),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r)),
            child: Container(
              decoration: BoxDecoration(
                //color: Theme.of(context).hoverColor,
                borderRadius: BorderRadius.circular(7.r),
              ),
              width: 60.w,
              height: 60.w,
              child: SpinKitSpinningLines(
                color: Colors.teal,
                size: 40.h,
              ),
            ),
          ),
        );
      });
}
