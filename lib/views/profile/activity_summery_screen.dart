import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';

class ActivitySummeryScreen extends StatefulWidget {
  const ActivitySummeryScreen({Key? key}) : super(key: key);

  @override
  State<ActivitySummeryScreen> createState() => _ActivitySummeryScreenState();
}

class _ActivitySummeryScreenState extends State<ActivitySummeryScreen> {
  final notificationList = [
    {
      'title': 'No Pending Invitation',
    },
    {
      'title': 'No Accepted Invitations',
    },
    {
      'title': 'Recent Visitors',
    },
    {
      'title': 'Contact Viewed',
    },
  ];
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
          'Activity Summery',
          style: black20BoldTextStyle,
        ),
      ),
      body: activitysummery(),
    );
  }
  activitysummery() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: notificationList.length,
      itemBuilder: (context, index) {
        final item = notificationList[index];
        return Dismissible(
          key: Key('$item'),
          background: Container(
              margin: const EdgeInsets.only(top: fixPadding * 2.0),
              color: primaryColor),
          onDismissed: (direction) {
            setState(() {
              notificationList.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${item['title']} dismissed")));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              fixPadding * 2.0,
              fixPadding * 2.0,
              fixPadding * 2.0,
              0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(fixPadding * 1.5),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: whiteColor, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: greyColor.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Text("3",
                  style: TextStyle(color: whiteColor,fontSize: 17, fontWeight: FontWeight.w700),)
                ),
                widthSpace,
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height*0.024,),
                      Text(
                        item['title']!,
                        style: black15BoldTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
