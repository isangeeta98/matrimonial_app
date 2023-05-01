import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/membership_plan/get_membership_plan_controller.dart';
import '../../elements/column_builder.dart';

class SubscriptionPlanScreen extends StatefulWidget {
  const SubscriptionPlanScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlanScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<SubscriptionPlanScreen> with SingleTickerProviderStateMixin{
  double premiumPlanPrice = 999;
  double basicPlanPrice = 299;
  double economyPlanPrice = 599;
  int isSelected = 0;
  double planPrice = num.parse(999.toString()) * 100;

  final planList = [
    {
      'name': 'Premium Plan',
      'price': '₹999.00',
      'detail1': 'Direct message to all profile',
      'detail2': 'Unlimited profile visits',
      'detail3': 'Access for 30 days',
    },
    {
      'name': 'Basic Plan',
      'price': '₹299.00',
      'detail1': 'No direct message',
      'detail2': '50 profile visits everyday',
      'detail3': 'Access for 10 days',
    },
    {
      'name': 'Economy Plan',
      'price': '₹599.00',
      'detail1': 'Direct message to 3 profile every day',
      'detail2': '250 profile visits everyday',
      'detail3': 'Access for 28 days',
    },
  ];

  GetMembershipPlanController getMembershipPlanController = Get.find<GetMembershipPlanController>();
  TabController? _tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    getMembershipPlanController.getmembershiplandata(refresh: true);
    getMembershipPlanController.getaddonlandata(refresh: true);
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
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
          'Subscription Plans',
          style: black20BoldTextStyle,
        ),
      ),
      body: Obx(()=>
         Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TabBar(
                indicatorColor: primaryColor,
                unselectedLabelColor: Colors.black,
                labelColor: primaryColor,
                labelStyle: TextStyle(
                  color: primaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
                tabs: [
                  Tab(
                    text: 'MemberShip Plan',
                  ),
                  Tab(
                    text: 'AddOn Plan',
                  )
                ],
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                      children: [
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        Text(
                          'Select your plan',
                          style: grey14SemiBoldTextStyle,
                        ),
                        heightSpace,
                        heightSpace,
                        ColumnBuilder(
                          itemCount: getMembershipPlanController.membershipplandata.value.data!.length,
                          itemBuilder: (context, index) {
                            final item = getMembershipPlanController.membershipplandata.value.data?[index];
                            var totalprice = item?.mpPrice;
                            var discount = item?.mpDisPrice;
                            var diff = totalprice! - discount!;
                            print(diff);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelected = index;
                                    if (index == 0) {
                                      setState(() {
                                        planPrice = num.parse(999.toString()) * 100;
                                        print("This is plan price value $planPrice");
                                      });
                                    }
                                    if (index == 1) {
                                      setState(() {
                                        planPrice = num.parse(299.toString()) * 100;
                                        print("This is plan price value $planPrice");
                                      });
                                    } else if (index == 2) {
                                      setState(() {
                                        planPrice = num.parse(599.toString()) * 100;
                                        print("This is plan price value $planPrice");
                                      });
                                    }
                                    print("isSelected $index");
                                  });
                                },
                                child: Container(
                                  padding:  EdgeInsets.all(fixPadding),
                                  decoration: BoxDecoration(
                                    color: isSelected == index ? primaryColor : whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: isSelected == index
                                            ? primaryColor.withOpacity(0.2)
                                            : greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item?.mpName??"",
                                            style: TextStyle(
                                              color: isSelected == index ? whiteColor : blackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                          "₹ ${item?.mpPrice.toString()??""}",
                                            style: TextStyle(
                                              decoration: (item?.mpDisPrice != null || item?.mpDisPrice != "" || item?.mpDisPrice != 0)
                                                  ?TextDecoration.lineThrough:TextDecoration.none,
                                              decorationThickness: 2.85,
                                              color: isSelected == index ? whiteColor : blackColor,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // discount
                                      // if(item?.mpDisPrice == null || item?.mpDisPrice == "" || item?.mpDisPrice == 0)...{
                                      //    Container()
                                      // }else...{
                                      //   SizedBox(height: 4,),
                                      //   Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Text(
                                      //         " % Discount",
                                      //         style: TextStyle(
                                      //           color: isSelected == index ? whiteColor : blackColor,
                                      //           fontSize: 16,
                                      //           fontWeight: FontWeight.w600,
                                      //         ),
                                      //       ),
                                      //       Text(
                                      //         "₹ ${item?.mpDisPrice.toString()}",
                                      //         style: TextStyle(
                                      //           color: isSelected == index ? whiteColor : blackColor,
                                      //           fontSize: 18,
                                      //           fontWeight: FontWeight.w600,
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),},


                                      //discount price

                                      if(item?.mpDisPrice != null || item?.mpDisPrice != "" || item?.mpDisPrice != 0)...{
                                        SizedBox(height: 4,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "",
                                              style: TextStyle(
                                                color: isSelected == index ? whiteColor : blackColor,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "₹ ${diff}",
                                              style: TextStyle(
                                                color: isSelected == index ? whiteColor : blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      }else...{
                                       Container()
                                      },

                                      // heightSpace,
                                      // heightSpace,
                                      // heightSpace,
                                      // planDetail(item['detail1']!, index),
                                      // heightSpace,
                                      // heightSpace,
                                      // planDetail(item['detail2']!, index),
                                      heightSpace,
                                      heightSpace,
                                      planDetail(item?.mpDuration??"", index),
                                      heightSpace,
                                      heightSpace,
                                      Text(
                                        "Access ${item?.mpDirContactCount.toString()} verified mobile number",
                                        style: TextStyle(
                                          color: isSelected == index ? whiteColor : blackColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      heightSpace,
                                      heightSpace,
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        heightSpace,
                        continueButton(),
                      ],
                    ),
                    Container(
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                        children: [
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          Text(
                            'Select your plan',
                            style: grey14SemiBoldTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          ColumnBuilder(
                            itemCount: getMembershipPlanController.addonplandata.value.data!.length,
                            itemBuilder: (context, itemindex) {
                              final items = getMembershipPlanController.addonplandata.value.data?[itemindex];
                              var totalprice = items?.adpPrice;
                              var discount = items?.adpDisPrice;
                              var difference = totalprice! - discount!;
                              print(difference);
                              return Padding(
                                padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      isSelected = itemindex;
                                      if (itemindex == 0) {
                                        setState(() {
                                          planPrice = num.parse(999.toString()) * 100;
                                          print("This is plan price value $planPrice");
                                        });
                                      }
                                      if (itemindex == 1) {
                                        setState(() {
                                          planPrice = num.parse(299.toString()) * 100;
                                          print("This is plan price value $planPrice");
                                        });
                                      } else if (itemindex == 2) {
                                        setState(() {
                                          planPrice = num.parse(599.toString()) * 100;
                                          print("This is plan price value $planPrice");
                                        });
                                      }
                                      print("isSelected $itemindex");
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(fixPadding),
                                    decoration: BoxDecoration(
                                      color: isSelected == itemindex ? primaryColor : whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: isSelected == itemindex
                                              ? primaryColor.withOpacity(0.2)
                                              : greyColor.withOpacity(0.2),
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
                                              items?.adpName??"",
                                              style: TextStyle(
                                                color: isSelected == itemindex ? whiteColor : blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "₹ ${items?.adpPrice.toString()}",
                                              style: TextStyle(
                                                decoration: (items?.adpDisPrice != null || items?.adpDisPrice != "" || items?.adpDisPrice != 0)
                                                    ?TextDecoration.lineThrough:TextDecoration.none,
                                                decorationThickness: 2.85,
                                                color: isSelected == itemindex ? whiteColor : blackColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),

                                        // discount
                                        // if(items?.adpDisPrice == null || items?.adpDisPrice == "" || items?.adpDisPrice == 0)...{
                                        //   Container()
                                        // }else...{
                                        //   SizedBox(height: 4,),
                                        //   Row(
                                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //     children: [
                                        //       Text(
                                        //         " % Discount",
                                        //         style: TextStyle(
                                        //           color: isSelected == itemindex ? whiteColor : blackColor,
                                        //           fontSize: 16,
                                        //           fontWeight: FontWeight.w600,
                                        //         ),
                                        //       ),
                                        //       Text(
                                        //         "₹ ${items?.adpDisPrice.toString()}",
                                        //         style: TextStyle(
                                        //           color: isSelected == itemindex ? whiteColor : blackColor,
                                        //           fontSize: 18,
                                        //           fontWeight: FontWeight.w600,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),},


                                        //discount price

                                        if(items?.adpDisPrice != null || items?.adpDisPrice != "" || items?.adpDisPrice != 0)...{
                                          SizedBox(height: 4,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "",
                                                style: TextStyle(
                                                  color: isSelected == itemindex ? whiteColor : blackColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                "₹ ${difference}",
                                                style: TextStyle(
                                                  color: isSelected == itemindex ? whiteColor : blackColor,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        }else...{
                                          Container()
                                        },

                                        heightSpace,
                                        heightSpace,
                                        planDetail(items?.adpDuration??"", itemindex),
                                        heightSpace,
                                        heightSpace,
                                        Text(
                                          "Access for  view and match ${items?.adpKundaliMatchCount} kundali",
                                          style: TextStyle(
                                            color: isSelected == itemindex ? whiteColor : blackColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        heightSpace,
                                        heightSpace,
                                        heightSpace,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          continueButton(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  planCards() {
    return ColumnBuilder(
      itemCount: planList.length,
      itemBuilder: (context, index) {
        final item = planList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = index;
                if (index == 0) {
                  setState(() {
                    planPrice = num.parse(999.toString()) * 100;
                    print("This is plan price value $planPrice");
                  });
                }
                if (index == 1) {
                  setState(() {
                    planPrice = num.parse(299.toString()) * 100;
                    print("This is plan price value $planPrice");
                  });
                } else if (index == 2) {
                  setState(() {
                    planPrice = num.parse(599.toString()) * 100;
                    print("This is plan price value $planPrice");
                  });
                }
                print("isSelected $index");
              });
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding),
              decoration: BoxDecoration(
                color: isSelected == index ? primaryColor : whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: isSelected == index
                        ? primaryColor.withOpacity(0.2)
                        : greyColor.withOpacity(0.2),
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
                        item['name']!,
                        style: TextStyle(
                          color: isSelected == index ? whiteColor : blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item['price']!,
                        style: TextStyle(
                          color: isSelected == index ? whiteColor : blackColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  planDetail(item['detail1']!, index),
                  heightSpace,
                  heightSpace,
                  planDetail(item['detail2']!, index),
                  heightSpace,
                  heightSpace,
                  planDetail(item['detail3']!, index),
                  heightSpace,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  planDetail(String detail, int index) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color:
            isSelected == index ? whiteColor : greyColor.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.done,
            color: isSelected == index ? primaryColor : greyColor,
            size: 11,
          ),
        ),
        widthSpace,
        widthSpace,
        Text(
          detail,
          style: isSelected == index
              ? white13RegularTextStyle
              : grey13RegularTextStyle,
        ),
      ],
    );
  }

  continueButton() {
    return InkWell(
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.all(fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Continue',
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
