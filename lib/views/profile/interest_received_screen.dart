import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../profile_details_screen.dart';

class InterestReceivedScreen extends StatefulWidget {
  const InterestReceivedScreen({Key? key}) : super(key: key);

  @override
  State<InterestReceivedScreen> createState() => _InterestReceivedScreenState();
}

class _InterestReceivedScreenState extends State<InterestReceivedScreen> {
  bool dataReceived = false;
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
          'Interest Received',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(
                fixPadding * 2.0,
                0,
                fixPadding * 2.0,
                0,
              ),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProfileDetailScreen(),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage("assets/images/users/user9.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "memeber name",
                                style:
                                black14SemiBoldTextStyle,
                              ),
                              Text(
                                'workinglocation   27 yrs, 5-4',
                                style:
                                grey12RegularTextStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Text(
                                    'religion name, cityid - countryid',
                                    style:
                                    grey12RegularTextStyle,
                                  ),

                                ],
                              ),

                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                          },
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 18,
                                child: CircleAvatar(
                                  radius: 17,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.check,color: Colors.green,),
                                ),
                              ),
                              Text(
                                'Accept',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  divider(),
                ],
              ),
            );
          }),
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
