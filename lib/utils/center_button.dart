import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'app_utils.dart';

class CenterButton extends StatelessWidget {
  const CenterButton({
    Key key,
    @required this.ontap,
    @required this.text,
    this.bgColor = primaryColor,
    this.txtColor = Colors.white,
    this.fontWeight,
    this.isExpanded = false,
    this.showArrow = false,
    this.margin = 0,
    this.radius = 25,
    this.isProgress = false,
    this.fontsize = 14,
  }) : super(key: key);

  final Function ontap;
  final String text;
  final Color bgColor;
  final Color txtColor;
  final FontWeight fontWeight;
  final bool isExpanded;
  final bool isProgress;
  final bool showArrow;
  final double margin;
  final double fontsize;
  final double radius;
  // final textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          width: isExpanded ? double.infinity : null,
          margin:
              margin > 0 ? EdgeInsets.symmetric(horizontal: margin.w) : null,
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
          decoration: BoxDecoration(
            color: bgColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.black12,
                  spreadRadius: 2,
                  offset: Offset(0, 2))
            ],
            borderRadius: BorderRadius.circular(radius.r),
          ),
          child: isProgress
              ? SpinKitFadingCircle(
                  color: Colors.white,
                  size: 20.h,
                )
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      text,
                      style: whiteRegular14.copyWith(
                          color: txtColor, fontSize: fontsize.sp,fontWeight: fontWeight),
                    ),
                  showArrow?Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Icon(Icons.east_outlined,color: txtColor),
                  ):Container(height: 0,)
                ],
              ),
        ),
      ),
    );
  }
}
