import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/profile_details_screen.dart';

import '../constants/app_constants.dart';
import '../controller/all_user_controller/get_matchuser_by_location_controller.dart';
import '../controller/get_all_user_controller.dart';

class MatchLocationUserScreen extends StatefulWidget {
  String? usersid;
  MatchLocationUserScreen({Key? key,this.usersid}) : super(key: key);

  @override
  State<MatchLocationUserScreen> createState() => _MatchLocationUserScreenState();
}

class _MatchLocationUserScreenState extends State<MatchLocationUserScreen> {
  GetAllUserController getAllUserController = Get.find<GetAllUserController>();
  GetMatchByLocationController getMatchByLocationController = Get.find<GetMatchByLocationController>();
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
          "Matches By Location",
          style: black20BoldTextStyle,
        ),
      ),
      body: GetBuilder<GetAllUserController>(
          init: Get.put(GetAllUserController()),
          //global: false,
          builder: (getallUserCon){
            final selectedIds = getMatchByLocationController.getlocationmatchdata.value.userIds?.map((component) => component.id).toList();
            final filtered = (getAllUserController.alluserdata.value.joindata??[]).where((element) => selectedIds!.contains(element.id)).toList();
            return ListView.builder(
                itemCount: filtered.length,
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
                                  ProfileDetailScreen(
                                    userdetaildata: filtered[index],
                                    userid: filtered[index].id,
                                  ),
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
                                    image: filtered[index].gender == "male"
                                        ?AssetImage("assets/images/users/boyimages.png")
                                        : AssetImage("assets/images/users/girlimage.png"),
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
                                      "${filtered[index].fristname}",
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
                            ],
                          ),
                        ),
                        divider(),
                      ],
                    ),
                  );
                });
          }
      ),
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
