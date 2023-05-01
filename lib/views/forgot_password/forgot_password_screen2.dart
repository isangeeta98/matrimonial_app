import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/reset_password_controller.dart';
import 'passowrd_scuccess_screen.dart';

class ForgotPasswordScreen2 extends StatefulWidget {
  const ForgotPasswordScreen2({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen2> createState() => _ForgotPasswordScreen2State();
}

class _ForgotPasswordScreen2State extends State<ForgotPasswordScreen2> {
  ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Change Password',
            style: white20BoldTextStyle,
          ),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 2.0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding * 2.0,
                      vertical: fixPadding * 3.5,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          emailTextField(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          passwordTextField(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          confirmpasswordTextField(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          verifyemailtokenTextField(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          isLoading
                              ? const Center(
                              child: CircularProgressIndicator())
                              : signinButton(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  emailTextField() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 1.2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          final bool isValid = EmailValidator.validate(value!);
           //validateEmail(value.toString());
          if (!isValid) {
            return 'Please enter correct email';
          }
          return null;
        },
        controller: resetPasswordController.emailidController,
        cursorColor: primaryColor,
        style: black15SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Email ',
          hintStyle: grey15RegularTextStyle,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }


  passwordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 5) {
                return 'Password should be at least 6 characters.';
              }
              return null;
            },
            controller: resetPasswordController.newpasswordCon,
            obscureText: true,
            cursorColor: primaryColor,
            style: black15SemiBoldTextStyle,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: 'Password',
              hintStyle: grey15RegularTextStyle,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
      ],
    );
  }


  confirmpasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              } else if (value.length < 5) {
                return 'Password should be at least 6 characters.';
              }
              return null;
            },
            controller: resetPasswordController.confirmpasswordCon,
            obscureText: true,
            cursorColor: primaryColor,
            style: black15SemiBoldTextStyle,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: 'Confirm Password',
              hintStyle: grey15RegularTextStyle,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
      ],
    );
  }


  verifyemailtokenTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(fixPadding * 1.2),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: greyColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: TextFormField(
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return 'Please enter password';
            //   } else if (value.length < 4) {
            //     return 'Password should be at least 6 characters.';
            //   }
            //   return null;
            // },
            controller: resetPasswordController.tokenController,
            cursorColor: primaryColor,
            style: black15SemiBoldTextStyle,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              hintText: 'Email token',
              hintStyle: grey15RegularTextStyle,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
      ],
    );
  }

  signinButton(context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          resetPasswordController.getresetpassword(refresh: true);
        }
        //Get.to(()=> PasswordChangeSuccessScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Submit'.toUpperCase(),
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
