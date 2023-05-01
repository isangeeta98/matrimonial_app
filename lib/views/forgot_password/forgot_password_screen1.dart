import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/forgot_password/forgot_password_screen2.dart';
import 'package:meetmeapp/views/sign_up_screen.dart';

import '../../constants/app_constants.dart';
import '../../controller/forgot_password_controller.dart';

class ForgotPasswordScreen1 extends StatefulWidget {
  const ForgotPasswordScreen1({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen1> createState() => _ForgotPasswordScreen1State();
}

class _ForgotPasswordScreen1State extends State<ForgotPasswordScreen1> {
  ForgotPasswordController forgotPasswordController = Get.put(ForgotPasswordController());
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
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Forgot Password',
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
          // validateEmail(value.toString());
          if (!isValid) {
            return 'Please enter correct email';
          }
          return null;
        },
        controller: forgotPasswordController.emailidController,
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

  signinButton(context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          forgotPasswordController.getforgotpassword(refresh: true);
        }
        //Get.to(()=> ForgotPasswordScreen2());
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
