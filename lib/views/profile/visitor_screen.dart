import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/get_all_user_controller.dart';
import '../../controller/visitor_user/get_visitors_data_controller.dart';
import '../profile_details_screen.dart';

class VisitorScreen extends StatefulWidget {
  const VisitorScreen({Key? key}) : super(key: key);

  @override
  State<VisitorScreen> createState() => _VisitorScreenState();
}

class _VisitorScreenState extends State<VisitorScreen> {
  GetAllUserController getAllUserController = Get.find<GetAllUserController>();
  GetVisitorsDataController getVisitorsDataController = Get.find<GetVisitorsDataController>();
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
          'Visited Members',
          style: black20BoldTextStyle,
        ),
      ),
      body: Obx((){
        final selectedIds = getVisitorsDataController.visitorslistdata.value.userIds?.map((component) => component.visitorId).toList();
        final filtered = (getAllUserController.alluserdata.value.joindata??[]).where((element) => selectedIds!.contains(element.id)).toList();
        return   ListView.builder(
            itemCount: filtered.length,
            // itemCount: shortListUserController.shortlistuserdata.value.post?.length,
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
                                    // InkWell(
                                    //   onTap: () {
                                    //   },
                                    //   child: Text(
                                    //     'Remove',
                                    //     style:
                                    //     primaryColor12BlackTextStyle,
                                    //   ),
                                    // ),
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
              // for(i=0; i<(getAllUserController.alluserdata.value.joindata??[]).length; i++)
              // var jondata = getAllUserController.alluserdata.value.joindata;
              // for (Joindatum item in getAllUserController.alluserdata.value.joindata??[]){
              // //for (Joindatum item in getAllUserController.alluserdata.value.joindata??[]){
              //   print(item.id);
              //   if(filtered[index].slShortlistUserId == item.id){
              //  // if(getAllUserController.alluserdata.value.joindata?[index].id == item.slShortlistUserId){
              //    // for(var i = 0; i < item.length; i++)
              //       // print(item.id);
              //
              //   }else{
              //     return Container();
              //   }
              // }
              // return SizedBox();
            });
      }
      )
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
