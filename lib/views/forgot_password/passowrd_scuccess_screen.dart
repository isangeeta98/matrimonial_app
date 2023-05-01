import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/login_screen.dart';

import '../../constants/app_constants.dart';

class PasswordChangeSuccessScreen extends StatefulWidget {
  const PasswordChangeSuccessScreen({Key? key}) : super(key: key);

  @override
  State<PasswordChangeSuccessScreen> createState() => _PasswordChangeSuccessScreenState();
}

class _PasswordChangeSuccessScreenState extends State<PasswordChangeSuccessScreen> {
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
        body: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Password Change \nSuccessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.white,
                  fontWeight: FontWeight.w800),),
                  heightSpace,
                  heightSpace,
                  SizedBox(height: Get.height*0.1,),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator())
                            : signinButton(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signinButton(context) {
    return InkWell(
      onTap: () {
        Get.offAll(()=>LoginScreen());
      },
      child: Padding(
        padding:  EdgeInsets.only(left: 50, right: 50),
        child: Container(
          padding: const EdgeInsets.all(fixPadding * 1.5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            //primaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'Login'.toUpperCase(),
            style:TextStyle(color: primaryColor,fontWeight: FontWeight.bold, fontSize: 20)
            //white16BoldTextStyle,
          ),
        ),
      ),
    );
  }
}
