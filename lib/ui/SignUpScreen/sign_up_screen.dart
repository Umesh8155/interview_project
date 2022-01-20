import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:interview_project/ApiService/api_service.dart';
import 'package:interview_project/ui/LoginScreen/login_screen.dart';
import 'package:interview_project/utils/app_utils.dart';
import 'package:interview_project/utils/center_button.dart';
import 'package:interview_project/utils/common_textfield.dart';
import 'package:interview_project/utils/constants.dart';
import 'package:interview_project/utils/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  GlobalKey<FormState> formKey = new GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypeNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyView(),
    );
  }

  Widget bodyView(){
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 70.h),
              child: Image.asset(
                loginTopImg,
                width: double.infinity,
                height: 220.h,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                left: 50.w,
                right: 50.w,
                bottom: 0,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey.withOpacity(0.9),
                          child: Icon(Icons.person,color: Colors.white,size: 60.sp,),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.edit_outlined,color: Colors.white,size: 20.sp,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    Text("Upload Image",style: blackBold18.copyWith(fontWeight: FontWeight.bold),),
                  ],
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
                      controller: nameController,
                      hintText: "Name",),
                    SizedBox(height: 20.h,),
                    CommonTextfield(
                      controller: surnameController,
                      hintText: "Surname",),
                    SizedBox(height: 20.h,),
                    CommonTextfield(
                      controller: userNameController,
                      hintText: "Username",),
                    SizedBox(height: 20.h,),

                    CommonTextfield(
                      controller: emailController,
                      hintText: "Email Address",
                        emptyValidation: false,
                        validation : (value) {

                          Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = RegExp(pattern);

                          if (value == null || value.isEmpty) {
                            return 'Email Address Required';
                          }else if (!regex.hasMatch(value)){
                            return 'Enter a valid email address';
                          }
                          return null;
                        }),

                    SizedBox(height: 20.h,),

                    CommonTextfield(
                      controller: mobileController,
                      isDigitsOnly: true,
                      maxLine: 1,
                      hintText: "Mobile",),
                    SizedBox(height: 20.h,),

                    CommonTextfield(
                        controller: passwordController,
                        isSecure: true,
                        maxLine: 1,
                        emptyValidation: false,
                        hintText: "Password",
                        validation : (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Required';
                          }else if (value.toString().length<6){
                            return 'minimum 6 characters';
                          }
                          return null;
                        }),
                    SizedBox(height: 20.h,),

                    CommonTextfield(
                        controller: retypeNewPasswordController,
                        isSecure: true,
                        maxLine: 1,
                        hintText: "Retype New Password",
                        emptyValidation: false,
                        validation : (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password Required';
                          }else if (value.toString().length<6){
                            return 'minimum 6 characters';
                          }
                          return null;
                        }),

                    SizedBox(height: 30.h,),
                    CenterButton(ontap: (){
                      if(formKey.currentState.validate()){
                        callSignUp();
                      }
                    }, text: "Proceed",fontsize: 16.sp,fontWeight: FontWeight.w500,),

                  ],
                ),
              )),
        )
      ],
    );
  }

  callSignUp() async {
    showLoader(context);

    Map<String, dynamic> signUpRequest = {
      "name": userNameController.text,
      "email": emailController.text,
      "password": passwordController.text
    };

    await check().then((internet) async {
      if (internet != null && internet) {
        await ApiService.postApiCallArgs(
            url: URLS.registration_URL, apiRequest: signUpRequest)
            .then((value) {
          Navigator.pop(context);
          if (value == null) {
            // showToast("Something went wrong");
          } else {
            if (value["data"] != null) {
              showToast(value["message"]);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
