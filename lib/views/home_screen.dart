import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import '../controller/all_user_controller/get_matchuser_by_location_controller.dart';
import '../controller/get_all_user_controller.dart';
import '../controller/membership_plan/get_membership_plan_controller.dart';
import '../controller/profile_images/get_profile_image_controller.dart';
import '../controller/profile_images/upload_images_controller.dart';
import '../controller/save_info_controller/save_personal_detail_controller.dart';
import '../controller/user_profile_controller.dart';
import '../controller/visitor_user/store_visitors_data_controller.dart';
import 'profile_details_screen.dart';
import 'see_all_match_location_user_screen.dart';
import 'see_all_screen.dart';
import 'subscription_plan/subscription_plan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late double height = 0.0;
  // late double width = 0.0;

  UserProfileController userProfileController = Get.put(UserProfileController());
  GetAllUserController getAllUserController = Get.put(GetAllUserController());
  GetMembershipPlanController getMembershipPlanController = Get.find<GetMembershipPlanController>();
  UploadImagesController uploadImagesController = Get.put(UploadImagesController());
  SavePersonalDetailController savePersonalDetailController = Get.put(SavePersonalDetailController());
  GetMatchByLocationController getMatchByLocationController = Get.put(GetMatchByLocationController());
  GetProfileImageController getProfileImageController = Get.put(GetProfileImageController());
  StoreVisitorDataController storeVisitorDataController = Get.put(StoreVisitorDataController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfileImageController.getuserprofileimage(refresh: true);
    getMatchByLocationController.getmatchlocationdata(refresh: true);
    userProfileController.getuserprofiledata(refresh: true);
    getAllUserController.getalluserdata(refresh: true);
    getMembershipPlanController.getmembershiplandata(refresh: true);
    getMembershipPlanController.getaddonlandata(refresh: true);
  }
  var sizelen;
   List<String> membername = [
     "Ram Kumar",
     "Prem Kumar",
     "Rohit Kumar"
   ];

   List memberHeight = [
     "3-3",
     "3-3",
     "3-3",
   ];
   List memberimages = [
     "assets/images/users/user1.png",
     "assets/images/users/user2.png",
     "assets/images/users/user3.png"
   ];
   List memberMobile = [
     "9453436256",
     "9453436256",
     "9453436256",
   ];
   List cityName= [
     "Chandigarh",
     "Chandigarh",
     "Chandigarh",
   ];
  File? imageDatas;
  void getGalleryImage({File? imageData}) async {
    final images = await ImagePicker().getImage(source: ImageSource.gallery);
    if (images != null) {
      File? img = File(images.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        imageData = img;
        imageDatas = img;
      });
    } else {
      print('No image selected.');
    }
  }

  Future<File?> _cropImage({required File imageFile}) async{
    CroppedFile? croppedImage =
    await ImageCropper().cropImage(sourcePath: imageFile.path);
    if(croppedImage != null){
      File(croppedImage.path);
      uploadImagesController.uploaduserimages(refresh: true,
          userimage : croppedImage,
          userid: userProfileController.userprofiledata.value.profileData?.id);
    }
    if(croppedImage == null) return null;
    //return File(croppedImage.path);
  }

  var baseurl = "http://65.2.137.114:5000/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding:
        const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
        children: [
          userProfile(),
           newMatches(),
           discoverMatches(),
           completeProfile(),
          membersLookingForYou(),
        ],
      )
    );
  }

  userProfile() {
    return GetX<UserProfileController>(
        init: Get.put(UserProfileController()),
        //global: false,
        builder: (userProfileController){
          return userProfileController.userprofiledata.value.profileData == null
              ? const Center(child: CircularProgressIndicator())
              :Padding(
            padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 85,
                  width: 85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image:  DecorationImage(
                      // image: NetworkImage(userProfileController.userprofiledata.value.profileData.),
                      image: getProfileImageController.getimageprofile.value.record != null?
                      NetworkImage("${baseurl}${getProfileImageController.getimageprofile.value.record?.profileMultiImg}") as ImageProvider:
                      userProfileController.userprofiledata.value.profileData?.gender == "Male"?
                      AssetImage('assets/images/users/boyimages.png'):
                      AssetImage('assets/images/users/girlimage.png'),
                       //as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widthSpace,
                widthSpace,
                widthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userProfileController.userprofiledata.value.profileData?.fristname} ${userProfileController.userprofiledata.value.profileData?.middlename} ${userProfileController.userprofiledata.value.profileData?.lastname}"??"",
                      style: black16BoldTextStyle,
                    ),
                    Text(
                      "${userProfileController.userprofiledata.value.profileData?.mobile}"??"",
                      style: grey14RegularTextStyle,
                    ),
                    heightSpace,
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      width: 160.0,
                      lineHeight: 3.0,
                      percent: 0.7,
                      progressColor: primaryColor,
                      backgroundColor: greyColor,
                    ),
                    heightSpace,
                    Text(
                      '40% Profile Completion',
                      style: grey13RegularTextStyle,
                    ),
                    heightSpace,
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: fixPadding,
                              vertical: 3,
                            ),
                            color: primaryColor,
                            child: Text(
                              'Basic',
                              style: white13RegularTextStyle,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SubscriptionPlanScreen()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding,
                                vertical: 3,
                              ),
                              child: Text(
                                'Upgrade plan',
                                style: primaryColor13RegularTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        }
    );
  }

  newMatches() {
   return GetX<GetAllUserController>(
       init: Get.put(GetAllUserController()),
       builder: (getAllUserController){
         return getAllUserController.alluserdata.value.joindata?.length == null
             ? Padding(
           padding: EdgeInsets.only(
               left:  fixPadding * 2.0, top: fixPadding * 1.0 ),
           child: Text("No new Match",
               style: black16SemiBoldTextStyle),
         )
             :SingleChildScrollView(
           child: Column(
             children: [
               title(GlobalConstants().newMatches, () {
                 Get.to(()=> SeeAllScreen(
                     usersid: userProfileController.userprofiledata.value.profileData?.id
                 ));
               }),
               SizedBox(
                   height: Get.height * 0.24,
                   child:  ListView.builder(
                     physics: const BouncingScrollPhysics(),
                     scrollDirection: Axis.horizontal,
                     shrinkWrap: true,
                     itemCount: getAllUserController.alluserdata.value.joindata?.length,
                     itemBuilder: (context, index) {
                       if(userProfileController.userprofiledata.value.profileData?.id == getAllUserController.alluserdata.value.joindata?[index].id){
                         return Container();
                       }
                       return Padding(
                         padding: EdgeInsets.only(
                             left: index == 0 ? fixPadding * 2.0 : fixPadding),
                         child: InkWell(
                           onTap: () {
                             setState(() {
                               storeVisitorDataController.storevisitordata(refresh: true,
                               myid: userProfileController.userprofiledata.value.profileData?.id,
                               visitorid: getAllUserController.alluserdata.value.joindata?[index].id);
                               savePersonalDetailController.getuserdetaildata(refresh: true,
                                   userid:userProfileController.userprofiledata.value.profileData?.id )
                                   .whenComplete(() => Navigator.push(
                                 context, MaterialPageRoute(builder: (context) => ProfileDetailScreen(
                                   userdetaildata: getAllUserController.alluserdata.value.joindata?[index],
                                   userid: userProfileController.userprofiledata.value.profileData?.id
                               ),),
                               )).whenComplete(() => setState(() {}));
                             });
                           },
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
                                 crossAxisAlignment:
                                 CrossAxisAlignment.start,
                                 children: [
                                   Column(
                                     children: [
                                       SizedBox(
                                         height: Get.height * 0.1316,
                                         width: Get.width * 0.36,
                                         child: Image.asset(
                                           getAllUserController.alluserdata.value.joindata?[index].gender == "male" || getAllUserController.alluserdata.value.joindata?[index].gender == "Male"
                                               ? "assets/images/users/boyimages.png"
                                               : "assets/images/users/girlimage.png",
                                           //memberimages[index % memberimages.length],
                                           fit: BoxFit.cover,
                                         ),
                                       ),
                                       // Hero(
                                       //   tag: "data",
                                       //   child:
                                       // ),
                                     ],
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(
                                         fixPadding / 2),
                                     child: Column(
                                       crossAxisAlignment:
                                       CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           "${getAllUserController.alluserdata.value.joindata?[index].fristname} ${getAllUserController.alluserdata.value.joindata?[index].lastname}",
                                           style: black14SemiBoldTextStyle,
                                         ),
                                         Row(
                                           children: [
                                             Text(
                                               '27 Yrs,',
                                               style: grey12RegularTextStyle,
                                             ),
                                             widthSpace,
                                             // Text(
                                             //   (getAllUserController.alluserdata.value.joindata?[index].userData?.isNotEmpty??false) ?
                                             //   getAllUserController.alluserdata.value.joindata != null?
                                             //   ( getAllUserController.alluserdata.value.joindata??[])[index].userData?.first.pHeight??"" : "":"",
                                             //   style: grey12RegularTextStyle,
                                             // ),
                                           ],
                                         ),
                                         Row(
                                           children: [
                                             Text(
                                               "${getAllUserController.alluserdata.value.joindata?[index].mobile}",
                                               style: grey12RegularTextStyle,
                                             ),
                                             widthSpace,
                                             Text(
                                               (getAllUserController.alluserdata.value.joindata?[index].myAddressDetails?.isNotEmpty??false) ?
                                               getAllUserController.alluserdata.value.joindata != null?
                                               ( getAllUserController.alluserdata.value.joindata??[])[index].myAddressDetails?.first.aCity??"" : "":"",
                                               style: grey12RegularTextStyle,
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
                   )
               ),
             ],
           ),
         );
       });
  }


  discoverMatches() {
    return Obx(()=>
       Padding(
        padding: const EdgeInsets.fromLTRB(
          fixPadding * 2.0,
          fixPadding * 2.0,
          fixPadding * 2.0,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover Matches',
              style: black16BoldTextStyle,
            ),
            heightSpace,
            heightSpace,
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(()=> MatchLocationUserScreen());
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: fixPadding * 2.0),
                      padding:
                      const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.15),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 40,
                            color: greyColor,
                          ),
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Location',
                                style: black14SemiBoldTextStyle,
                              ),
                              Text("${getMatchByLocationController.getlocationmatchdata.value.userIds?.length??0}"
                                //"${locationMatchData?.data?.length.toString()}"
                                    " Matches",
                                style: black13RegularTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Get.to(
                      //     SeeAllScreen(userData: newMemberMatchingData));
                    },
                    child: Container(
                      padding:
                      const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: greyColor.withOpacity(0.15),
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.work_rounded,
                            size: 40,
                            color: greyColor,
                          ),
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          widthSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Profession',
                                style: black14SemiBoldTextStyle,
                              ),
                              Text(
                                '4 matches',
                                style: black13RegularTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  completeProfile() {
    return Container(
      margin: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      padding: const EdgeInsets.all(fixPadding),
      decoration: BoxDecoration(
        color: const Color(0xfff1f8e9),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Complete your profile for\nmore responses',
                style: black14BoldTextStyle,
              ),
              const Icon(
                Icons.timelapse,
                color: primaryColor,
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'The first thing that members\nlook for in a is a photo',
                style: black13RegularTextStyle,
              ),
              InkWell(
                onTap: (){
                  getGalleryImage(imageData: imageDatas);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: fixPadding),
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding * 2.5,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Add Photo',
                    style: white14BoldTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  membersLookingForYou() {
    return Column(
      children: [
        title(
            //'${dailyMatchingofUsers?.data.length ?? GlobalConstants().loading} '
                'Members Looking For You',
                () {
                  Get.to(()=> SeeAllScreen());
            }),
        SizedBox(
          height: Get.height * 0.22,
          child: FutureBuilder(
            //future: upgradeservice.dailyMatchUsers(uid, context),
            builder: (context, snapshot) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {

                  return Padding(
                    padding: EdgeInsets.only(
                        left: index == 0 ? fixPadding * 2.0 : fixPadding),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileDetailScreen(),
                          ),
                        );
                      },
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.1316,
                                    width: Get.width * 0.36,
                                    child: Image.asset(
                                     memberimages[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(fixPadding / 2),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      membername[index],
                                      style: black14SemiBoldTextStyle,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '27 Yrs,',
                                          style: grey12RegularTextStyle,
                                        ),
                                        widthSpace,
                                        Text(
                                          memberHeight[index],
                                          style: grey12RegularTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          memberMobile[index],
                                          style: grey12RegularTextStyle,
                                        ),
                                        widthSpace,
                                        Text(
                                          "Chandigarh",
                                          style: grey12RegularTextStyle,
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
          ),
        ),
      ],
    );
  }

  title(String title, Function()? fn) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: black16BoldTextStyle,
          ),
          InkWell(
            onTap: fn,
            child: Text(
              'See all',
              style: primaryColor12BlackTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
