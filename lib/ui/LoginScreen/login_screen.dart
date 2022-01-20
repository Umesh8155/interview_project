import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_project/ApiService/api_service.dart';
import 'package:interview_project/ui/HomeScreen/home_screen.dart';
import 'package:interview_project/ui/SignUpScreen/sign_up_screen.dart';
import 'package:interview_project/utils/app_utils.dart';
import 'package:interview_project/utils/center_button.dart';
import 'package:interview_project/utils/common_textfield.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:interview_project/utils/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyView(),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyView() {
    return Column(
      children: [
        Stack(
          children: [
            Image.asset(
              loginTopImg,
              width: double.infinity,
              height: 320.h,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 120.h,
                left: 50.w,
                right: 50.w,
                child: Image.asset(
                  logo,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ))
          ],
        ),
        Expanded(
          child: Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.all(15.sp),
                child: ListView(
                  children: [
                    CommonTextfield(
                      controller: userNameController,
                      hintText: "Username / Email",
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    CommonTextfield(
                        controller: passwordController,
                        isSecure: true,
                        maxLine: 1,
                        emptyValidation: false,
                        hintText: "Password",
                        validation: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Required';
                          } else if (value.toString().length < 5) {
                            return 'minimum 5 characters';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot Password?",
                          style: blackRegular14.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    CenterButton(
                      ontap: () {
                        if (formKey.currentState.validate()) {
                          callLogin();
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                        }
                      },
                      text: "Login",
                      fontsize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          endIndent: 10,
                        )),
                        Text(
                          "OR",
                          style: blackRegular14.copyWith(color: Colors.grey),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.grey,
                          thickness: 0.5,
                          indent: 10,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            border: Border.all(color: Colors.black, width: 1)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              googleIcon,
                              height: 30.sp,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Sign In with Google",
                              style: blackRegular16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }

  callLogin() async {
    showLoader(context);

    Map<String, dynamic> loginRequest = {
      "email": userNameController.text,
      "password": passwordController.text
    };

    await check().then((internet) async {
      if (internet != null && internet) {
        await ApiService.postApiCallArgs(
                url: URLS.login_URL, apiRequest: loginRequest)
            .then((value) {
          Navigator.pop(context);
          if (value == null) {
            // showToast("Something went wrong");
          } else {
            if (value["data"] != null) {
              showToast(value["message"]);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            } else {
              showToast(value["message"]);
            }
          }
        });
        // Navigator.pop(context);
      } else {
        Navigator.pop(context);
        showToast("please check your internet connection");
      }
    });
  }
}
