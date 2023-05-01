import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/profile_details_screen.dart';

import '../constants/app_constants.dart';
import '../controller/get_all_user_controller.dart';

class SeeAllScreen extends StatefulWidget {
  String? usersid;
  SeeAllScreen({Key? key, this.usersid}) : super(key: key);

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  GetAllUserController getAllUserController = Get.put(GetAllUserController());
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
          "New Matches",
          style: black20BoldTextStyle,
        ),
      ),
      body: profileViewsList(),
    );
  }
  profileViewsList() {
    return GetBuilder<GetAllUserController>(
        init: Get.put(GetAllUserController()),
        //global: false,
        builder: (getallUserCon){
          return getallUserCon.alluserdata.value.joindata == null
              ? const Center(child: CircularProgressIndicator())
              :  ListView.builder(
               physics: const BouncingScrollPhysics(),
               itemCount: getallUserCon.alluserdata.value.joindata?.length,
               itemBuilder: (context, index) {
                 if(widget.usersid == getallUserCon.alluserdata.value.joindata?[index].id){
                   return Container();
                 }
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  fixPadding * 2.0,
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding * 2.0,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileDetailScreen(
                            userdetaildata: getallUserCon.alluserdata.value.joindata?[index]
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: getallUserCon.alluserdata.value.joindata?[index].gender == "male" || getallUserCon.alluserdata.value.joindata?[index].gender == "Male"
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${getallUserCon.alluserdata.value.joindata?[index].fristname} ${getallUserCon.alluserdata.value.joindata?[index].middlename} ${getallUserCon.alluserdata.value.joindata?[index].lastname}",
                                  style: black14SemiBoldTextStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '28 yrs,',
                                      style: grey12RegularTextStyle,
                                    ),
                                    Text(
                                      (getAllUserController.alluserdata.value.joindata?[index].userData?.isNotEmpty??false) ?
                                    getAllUserController.alluserdata.value.joindata != null?
                                    ( getAllUserController.alluserdata.value.joindata??[])[index].userData?.first.pHeight??"" : "":"",
                                      style: grey12RegularTextStyle,)
                                  ],
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      (getAllUserController.alluserdata.value.joindata?[index].myAddressDetails?.isNotEmpty??false) ?
                                      getAllUserController.alluserdata.value.joindata != null?
                                      ( getAllUserController.alluserdata.value.joindata??[])[index].myAddressDetails?.first.aCity??"" : "":"",
                                      style: grey12RegularTextStyle,
                                    ),
                                    SizedBox(width: Get.width*0.01,),
                                    Text("-",style: grey12RegularTextStyle,),
                                    SizedBox(width: Get.width*0.01,),
                                    Text(
                                      (getAllUserController.alluserdata.value.joindata?[index].myAddressDetails?.isNotEmpty??false) ?
                                      getAllUserController.alluserdata.value.joindata != null?
                                      ( getAllUserController.alluserdata.value.joindata??[])[index].myAddressDetails?.first.aCity??"" : "":"",
                                      style: grey12RegularTextStyle,
                                    ),

                                    ///Favourite Section
                                    // InkWell(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       item['star'] = !(item['star'] as bool);
                                    //     });
                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                    //       SnackBar(
                                    //         content: item['star']! == true
                                    //             ? const Text('Add to shortlist')
                                    //             : const Text('Remove from shortlist'),
                                    //       ),
                                    //     );
                                    //   },
                                    //   child: Icon(
                                    //     item['star']! == true
                                    //         ? Icons.star_rounded
                                    //         : Icons.star_border_rounded,
                                    //     color: primaryColor,
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
            },
          );
        }
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
