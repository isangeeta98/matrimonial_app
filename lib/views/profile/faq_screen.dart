import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/faq_controller.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  FaqController faqController = Get.find<FaqController>();
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
          'FAQ',
          style: black20BoldTextStyle,
        ),
      ),
      body: Obx(()=>
        Padding(
          padding:  EdgeInsets.only(left: Get.width*0.05, right: Get.width*0.06, top: Get.height*0.025),
          child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: Get.height*0.02,),
              itemCount: faqController.faqdata.value.post!.length,
              itemBuilder: (BuildContext context, int index) {
                return  Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                      width: Get.width*0.99,
                      padding: EdgeInsets.only(left: Get.width*0.05,top: Get.height*0.023, ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 7.0,
                            spreadRadius: 1,
                            offset: Offset(
                              7,
                              8,
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(right: Get.width*0.05),
                            child: Text("${faqController.faqdata.value.post?[index].question} : ",
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                          ),
                          Divider(
                            color: primaryColor,
                            thickness: 1,
                            endIndent: 16,
                          ),
                          SizedBox(height: Get.height*0.01,),
                          Padding(
                            padding:  EdgeInsets.only(right: Get.width*0.05),
                            child: Text("${faqController.faqdata.value.post?[index].answer}",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                          ),
                          SizedBox(height: Get.height*0.02,),
                        ],
                      )
                  ),
                );
              }),
        ),
      )
    );
  }
}
