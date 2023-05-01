import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final notificationList = [
    {
      'title': 'Subscription alert!',
      'description':
      'Your premium plan expired soon. Purchase new premium plan....',
      'time': '1h 20min ago',
    },
    {
      'title': '3 Profile views',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipielit, sed do eiusmod tempor',
      'time': '2 days ago',
    },
    {
      'title': 'Premium plan offer',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipielit, sed do eiusmod tempor',
      'time': '2 days ago',
    },
    {
      'title': 'Subscription alert!',
      'description':
      'Your premium plan expired soon. Purchase new premium plan....',
      'time': '2 month ago',
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
          'Notifications',
          style: black20BoldTextStyle,
        ),
      ),
      body: notifications(),
    );
  }
  notifications() {
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
                  child: const Icon(
                    Icons.notifications_active,
                    color: whiteColor,
                  ),
                ),
                widthSpace,
                widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: black14RegularTextStyle,
                      ),
                      Text(
                        item['description']!,
                        overflow: TextOverflow.fade,
                        style: grey13RegularTextStyle,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          item['time']!,
                          textAlign: TextAlign.end,
                          style: grey11SemiBoldTextStyle,
                        ),
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
