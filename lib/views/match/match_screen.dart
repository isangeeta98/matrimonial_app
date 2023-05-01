import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../elements/column_builder.dart';
import 'match_result_screen.dart';
import 'matches_sort_screen.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({Key? key}) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Matches',
          style: black20BoldTextStyle,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MatchesSortScreen()),
              );
            },
            child: Image.asset(
              'assets/images/icons/filter.png',
              height: 20,
              width: 20,
            ),
          ),
          widthSpace,
          widthSpace,
          widthSpace,
          widthSpace,
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: fixPadding * 2.0,
              top: fixPadding * 2.0,
            ),
            child: Text(
              '5 Matches based on your preferences',
              style: grey13RegularTextStyle,
            ),
          ),
          matches(),
        ],
      ),
    );
  }
  matches() {
    return FutureBuilder(
      builder: (context, snapshot) {
          return ColumnBuilder(
            itemCount: 7,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  fixPadding,
                  fixPadding * 2.0,
                  0,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: Get.height * 0.16,
                            width: double.infinity,
                            child: Image.asset(
                                  "assets/images/users/user3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(fixPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ram Kumar   23',
                                      style: black17BoldTextStyle,
                                    ),
                                  ],
                                ),
                                Text(
                                  "Professional Data",
                                  style: grey13RegularTextStyle,
                                ),
                                heightSpace,
                                Text(
                                  "980764537347",
                                  style: grey13RegularTextStyle,
                                ),
                                heightSpace,
                                Text(
                                  '27 Yrs, 5-4',
                                  style: black13SemiBoldTextStyle,
                                ),
                                Text(
                                  'Caste Name, 1329998 - India',
                                  style: black13SemiBoldTextStyle,
                                ),
                                heightSpace,
                                heightSpace,
                                Row(
                                  children: [
                                    Container(
                                      width: 120,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: fixPadding / 2),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: primaryColor,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Send Interest',
                                        style: primaryColor15BoldTextStyle,
                                      ),
                                    ),
                                    widthSpace,
                                    widthSpace,
                                    InkWell(
                                      onTap: () async {
                                        // launch('tel://$number');
                                      },
                                      child: Container(
                                        width: 120,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: fixPadding / 2),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: primaryColor,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'Call Now',
                                          style: primaryColor15BoldTextStyle,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                heightSpace,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MatchResultScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'View Matching Results',
                                        style: primaryColor11BlackTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
      },
    );
  }

}
