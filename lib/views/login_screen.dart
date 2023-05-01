import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/sign_up_screen.dart';

import '../constants/app_constants.dart';
import '../controller/auth_controller.dart';
import '../controller/user_profile_controller.dart';
import 'forgot_password/forgot_password_screen1.dart';
import 'home_tabbar_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  DateTime? currentBackPressTime;
  bool passwordVisible = false;

  final _formKey = GlobalKey<FormState>();
  AuthController con = Get.put(AuthController());
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
            'Sign In',
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
                          nameTextField(),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          passwordTextField(),
                          heightSpace,
                          heightSpace,
                          // heightSpace,
                          // heightSpace,
                          otherOptions(context),
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
  nameTextField() {
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
        controller: con.emailidController,
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
          padding: const EdgeInsets.all(fixPadding * 0.2),
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
            controller: con.passwordController,
            obscureText: !passwordVisible,

            cursorColor: primaryColor,
            style: black15SemiBoldTextStyle,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: IconButton(
                icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible
                      ?Icons.visibility_off
                      : Icons.visibility,
                  color: primaryColor,
                ),
                onPressed: () {
                  // Update the state i.e. toogle the state of passwordVisible variable
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              contentPadding:  EdgeInsets.only(left: Get.width*0.01,top: Get.height*0.01, bottom: Get.height*0.01),
              //contentPadding: EdgeInsets.zero,
              hintText: 'Password',
              hintStyle: grey15RegularTextStyle,
              border: const UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        InkWell(
          onTap: (){
            Get.to(()=> ForgotPasswordScreen1());
          },
          child: Text(
            'Forget password?',
            style: grey12RegularTextStyle,
          ),
        ),
      ],
    );
  }

  otherOptions(context) {
    return Column(
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have account? ',
              style: grey14SemiBoldTextStyle,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: Text(
                'Sign Up',
                style: primaryColor14SemiBoldTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  signinButton(context) {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          con.loginUser();
        }
        //Get.to(()=> HomeTabsScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding * 1.5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Sign In'.toUpperCase(),
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
