import 'package:flutter/material.dart';
import 'package:meetmeapp/views/subscription_plan/subscription_plan_screen.dart';

import '../../constants/app_constants.dart';

class UpgradePlanScreen extends StatefulWidget {
  const UpgradePlanScreen({Key? key}) : super(key: key);

  @override
  State<UpgradePlanScreen> createState() => _UpgradePlanScreenState();
}

class _UpgradePlanScreenState extends State<UpgradePlanScreen> {
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
          'Upgrade Plan',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            return datapi(
            );
          }),
    );
  }
}

class datapi extends StatefulWidget {
  const datapi({Key? key,}) : super(key: key);

  @override
  State<datapi> createState() => _datapiState();
}

class _datapiState extends State<datapi> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Container(
          margin: const EdgeInsets.only(left: 12),
          child: Text(
            'Select your plan',
            style: grey14SemiBoldTextStyle,
          ),
        ),
        heightSpace,
        heightSpace,
        planCard(),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        viewButton(context),
      ],
    );
  }

  planCard() {
    return Container(
      padding: const EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "plan type",
                style: white18SemiBoldTextStyle,
              ),
              Text(
                '6 days left',
                style: white18SemiBoldTextStyle,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          planDetail(
              'Direct message to all profile plannochat time'),
          heightSpace,
          heightSpace,
          planDetail('planProfileView profile visits'),
          heightSpace,
          heightSpace,
          planDetail('planDiscountPrice for 30 days'),
          heightSpace,
        ],
      ),
    );
  }

  planDetail(String text) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            color: whiteColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.done,
            color: primaryColor,
            size: 11,
          ),
        ),
        widthSpace,
        widthSpace,
        Text(
          text,
          style: white13RegularTextStyle,
        ),
      ],
    );
  }

  viewButton(context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'View Subscription Plans',
          style: primaryColor16BoldTextStyle,
        ),
      ),
    );
  }
}
