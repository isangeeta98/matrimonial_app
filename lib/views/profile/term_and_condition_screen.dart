import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/term_and_condition_controller.dart';
import 'package:flutter_html/flutter_html.dart';

class TermAndConditionScreen extends StatefulWidget {
  const TermAndConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermAndConditionScreen> createState() => _TermAndConditionScreenState();
}

class _TermAndConditionScreenState extends State<TermAndConditionScreen> {
  TermAndConditionController termController = Get.find<TermAndConditionController>();
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
          'Terms and Conditions',
          style: black20BoldTextStyle,
        ),
      ),
      body: Obx(()=>
        SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.05, top: Get.height*0.01),
            child: Column(
              children: [
                SizedBox(
                  width: Get.width*0.99,
                  child: Html(data: termController.termandconditiondata.value.data?.termsDescription,
                    style: {
                      "p": Style(
                          color: Colors.black,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500
                      ),
                      "data": Style(
                          color: Colors.black,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500
                      ),
                    },),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
