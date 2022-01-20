import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_project/utils/app_utils.dart';
import 'package:interview_project/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              homeImg,
              width: double.infinity,
              height: 200.h,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 45.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    "Meal Plan",
                    style: whiteBold16.copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.all(15.sp), child: bodyView())),
            ],
          )
        ],
      ),
      backgroundColor: Color(0xFFF7F7F7),
    );
  }

  Widget bodyView() {
    return ListView(
      padding: EdgeInsets.all(0),
      children: [
        dateView(),
        SizedBox(
          height: 25.h,
        ),
        totalView(),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Breakfast",
            time: "07:00 AM",
            cal: "350 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Morning Snack",
            time: "10:00 AM",
            cal: "150 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Lunch",
            time: "12:00 PM",
            cal: "480 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Afternoon Snack",
            time: "04:00 PM",
            cal: "150 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Dinner",
            time: "07:00 PM",
            cal: "280 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),

        SizedBox(
          height: 20.h,
        ),
        expandedView(
            title: "Night Snack",
            time: "10:00 PM",
            cal: "574 Cal",
            itemList: ["Pizza", "Carrots", "iced Tea"]),
      ],
    );
  }

  Widget dateView() {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(color: Color(0xFFE2E2E2), width: 1)),
      child: Row(
        children: [
          Icon(
            Icons.navigate_before_outlined,
            size: 30.sp,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "Monday",
                  style: blackBold18,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "28/02/2020",
                  style: blackRegular14,
                ),
              ],
            ),
          ),
          Icon(
            Icons.navigate_next_outlined,
            size: 30.sp,
          ),
        ],
      ),
    );
  }

  Widget totalView() {
    return Row(
      children: [
        Expanded(child: totalItem(title: "Daily Total Calories", total: 2639)),
        SizedBox(
          width: 10.w,
        ),
        Expanded(child: totalItem(title: "Daily Total Calories", total: 800)),
        SizedBox(
          width: 10.w,
        ),
        Expanded(child: totalItem(title: "Daily Total Calories", total: 1839)),
      ],
    );
  }

  Widget totalItem({var title, var total}) {
    return Container(
      padding: EdgeInsets.all(15.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(color: Color(0xFFE2E2E2), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackBold16.copyWith(color: Colors.grey),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$total",
            style: blackBold16.copyWith(
                fontSize: 25.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget expandedView({var title, var time, var cal, var itemList}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: Border.all(color: Color(0xFFE2E2E2), width: 1)),
      child: Theme(
        data: ThemeData(
          unselectedWidgetColor: Colors.blue,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          title: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: blackBold16.copyWith(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "($time)",
                          style: blackRegular16.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "($cal)",
                      style: blackRegular16.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              /*Container(
                height: 35.sp,
                width: 35.sp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: Colors.blue
                ),
                child: Icon(isExpand?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,color: Colors.white,),
              )*/
            ],
          ),
          children: [
            ...List.generate(itemList.length, (index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      itemList[index],
                      style: blackBold16.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
