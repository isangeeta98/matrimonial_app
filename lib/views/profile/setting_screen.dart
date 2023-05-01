import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/profile/privacy_policy_screen.dart';

import '../../constants/app_constants.dart';
import '../../controller/term_and_condition_controller.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TermAndConditionController termAndConditionController = Get.find<TermAndConditionController>();
  bool notification = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        title: Text(
          'Settings',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(fixPadding * 2.0),
        children: [
          notifications(),
          heightSpace,
          heightSpace,
          Text(
            'Clear Cache',
            style: black15SemiBoldTextStyle,
          ),
          // heightSpace,
          // heightSpace,
          // heightSpace,
          // Text(
          //   'Link Accounts',
          //   style: black15SemiBoldTextStyle,
          // ),
          // Text(
          //   'Facebook , Google , Instagram',
          //   style: grey14RegularTextStyle,
          // ),
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
              );
            },
            child: Text(
              'Privacy Policy',
              style: black15SemiBoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }
  notifications() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Notifications',
          style: black15SemiBoldTextStyle,
        ),
        Transform.scale(
          scale: 0.5,
          child: CupertinoSwitch(
            activeColor: primaryColor,
            value: notification,
            onChanged: (bool value) {
              setState(() {
                notification = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
