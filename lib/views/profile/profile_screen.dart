import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/helper/app_manager.dart';
import 'package:meetmeapp/views/profile/faq_screen.dart';
import 'package:meetmeapp/views/profile/short_list_screen.dart';
import 'package:meetmeapp/views/profile/term_and_condition_screen.dart';
import 'package:meetmeapp/views/profile/user_profile_detail_screen.dart';
import 'package:meetmeapp/views/profile/view_all_photo_screen.dart';
import 'package:meetmeapp/views/profile/view_contact_user_screen.dart';
import 'package:meetmeapp/views/profile/visitor_screen.dart';
import '../../controller/all_user_controller/favorshortlist_user_controller.dart';
import '../../controller/express_interest/get_interest_send_controller.dart';
import '../../controller/faq_controller.dart';
import '../../controller/get_all_user_controller.dart';
import '../../controller/profile_images/get_all_images_controller.dart';
import '../../controller/profile_images/get_profile_image_controller.dart';
import '../../controller/save_info_controller/save_personal_detail_controller.dart';
import '../../controller/term_and_condition_controller.dart';

import '../../constants/app_constants.dart';
import '../../constants/string_constants.dart';
import '../../controller/auth_controller.dart';
import '../../controller/user_profile_controller.dart';
import '../../controller/view_contact_user/get_view_contact_user_list_controller.dart';
import '../../controller/visitor_user/get_visitors_data_controller.dart';
import '../home_tabbar_screen.dart';
import '../login_screen.dart';
import '../subscription_plan/subscription_plan_screen.dart';
import 'package:meetmeapp/views/home_tabbar_screen.dart';

import 'abusive_user_screen.dart';
import 'activity_summery_screen.dart';
import 'block_users_screen.dart';
import 'interest_received_screen.dart';
import 'interest_send_screen.dart';
import 'notification_screen.dart';
import 'profile_view_screen.dart';
import 'setting_screen.dart';
import 'upgrade_plan_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FaqController faqController = Get.put(FaqController());
  TermAndConditionController termAndConditionController = Get.put(TermAndConditionController());
  UserProfileController userProfileController = Get.put(UserProfileController());
  SavePersonalDetailController savePersonalDetailController = Get.put(SavePersonalDetailController());
  ShortListUserController shortListUserController = Get.find<ShortListUserController>();
  GetAllUserController getAllUserController = Get.find<GetAllUserController>();
  GetAllImagesController getAllImagesController = Get.put(GetAllImagesController());
  GetProfileImageController getProfileImageController = Get.put(GetProfileImageController());
  GetInterestSendController interestSendController = Get.put(GetInterestSendController());
  GetVisitorsDataController getVisitorsDataController = Get.put(GetVisitorsDataController());
  GetViewContactUserListController getViewContactUserListController = Get.put(GetViewContactUserListController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userProfileController.getuserprofiledata(refresh: true);
    getProfileImageController.getuserprofileimage(refresh: true);
    getViewContactUserListController.getviewcontactlistdata(refresh: true);
  }
  var baseurl = "http://65.2.137.114:5000/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Profile',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          userProfile(context),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          profileDetail(context),
        ],
      ),
    );
  }
  userProfile(context) {
    return Obx(()=>
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        child: InkWell(
          onTap: () {
            savePersonalDetailController.getuserdetaildata(refresh: true,
                userid: userProfileController.userprofiledata.value.profileData?.id)
                .whenComplete(() => Get.to(()=>UserProfileDetailScreen(
                firstname: userProfileController.userprofiledata.value.profileData?.fristname??"",
                middlename: userProfileController.userprofiledata.value.profileData?.middlename??"",
                lastname: userProfileController.userprofiledata.value.profileData?.lastname??"",
                profilefor:userProfileController.userprofiledata.value.profileData?.profileCreateFor??"",
                //dateobirth : userProfileController.userprofiledata.value.profileData?.dob??"",
                usersid: userProfileController.userprofiledata.value.profileData?.id,
                genderdaat:userProfileController.userprofiledata.value.profileData?.gender
            )));

          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    // image: AssetImage('assets/users/user1.png'),
                    image: getProfileImageController.getimageprofile.value.record != null?
                    NetworkImage("${baseurl}${getProfileImageController.getimageprofile.value.record?.profileMultiImg}") as ImageProvider:
                    userProfileController.userprofiledata.value.profileData?.gender == "Male"?
                    AssetImage('assets/images/users/boyimages.png')
                        :AssetImage('assets/images/users/girlimage.png'),
                    // NetworkImage(LoggedUID
                    //     .completeUserData?.data?.memberImage
                    //     .toString() ??
                    //     GlobalConstants().blankProfilePic),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              widthSpace,
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
                  Text(
                    'You\'re a subscribed user',
                    style: grey12RegularTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UpgradePlanScreen()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding * 2.0,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        border: Border.all(color: primaryColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Upgrade plan',
                        style: white14SemiBoldTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
                color: greyColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  profileDetail(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        detail(
          ontap: () {
            Get.find<AuthController>().currentIndex.value = 1;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeTabsScreen()),
            );
          },
          title: 'Matches',
          image: 'assets/images/icons/matches.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getAllUserController.getalluserdata(refresh: true)
                .whenComplete(() => shortListUserController.getshortlistdata(refresh: true)
                .whenComplete(() =>  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShortListScreen()),
            )))
            ;
          },
          title: 'Favourites',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getAllUserController.getalluserdata(refresh: true)
                .whenComplete(() => shortListUserController.getblockuserlistdata(refresh: true))
                .whenComplete(() =>  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  BlockUserScreen(
                  genderdaat:userProfileController.userprofiledata.value.profileData?.gender
              )),
            ));
          },
          title: 'Block Users',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getAllUserController.getalluserdata(refresh: true)
                .whenComplete(() => shortListUserController.getabuseuserlistdata(refresh: true))
                .whenComplete(() => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AbusiveUserScreen()),
            ));
          },
          title: 'Abusive Users',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InterestReceivedScreen()),
            );
          },
          title: 'Interest Received',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            interestSendController.getinterestsenddata(refresh: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InterestSendScreen()),
            );
          },
          title: 'Interest Send',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getVisitorsDataController.getvisitorlistdata(refresh: true,
                myid: userProfileController.userprofiledata.value.profileData?.id);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  VisitorScreen()),
            );
          },
          title: 'Visited Member',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getViewContactUserListController.getviewcontactlistdata(refresh: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  ViewContactUserListScreen()),
            );
          },
          title: 'View Contact',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ActivitySummeryScreen()),
            );
          },
          title: 'Activities Summery',
          image: 'assets/images/icons/star.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getVisitorsDataController.getvisitorlistdata(refresh: true,
                myid: userProfileController.userprofiledata.value.profileData?.id);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileViewScreen()),
            );
          },
          title: 'Profile Views',
          image: 'assets/images/icons/view.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            getAllImagesController.getallimagesdata(refresh: true)
                .whenComplete(() =>  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ViewAllPhotoScreen()),
            ));
          },
          title: 'View All Photos',
          image: 'assets/images/icons/view.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationScreen()),
            );
          },
          title: 'Notifications',
          image: 'assets/images/icons/notification.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SubscriptionPlanScreen()),
            );
          },
          title: 'Subscription Plans',
          image: 'assets/images/icons/subscribe.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            termAndConditionController.getprivacypolicydata(refresh: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingScreen()),
            );
          },
          title: 'Settings',
          image: 'assets/images/icons/setting.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            termAndConditionController.gettermandconditiondata(refresh: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TermAndConditionScreen()),
            );
          },
          title: 'Terms & Conditions',
          image: 'assets/images/icons/condition.png',
          color: blackColor,
        ),
        detail(
          ontap: () {
            faqController.getfaqdata(refresh: true);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FaqScreen()),
            );
          },
          title: 'FAQ',
          image: 'assets/images/icons/condition.png',
          color: blackColor,
        ),
        heightSpace,
        heightSpace,
        detail(
          ontap: () => logoutDialog(context),
          title: 'Logout',
          image: 'assets/images/icons/logout.png',
          color: primaryColor,
        ),
      ],
    );
  }


  detail(
      {required String title,
        required String image,
        Color? color,
        Function? ontap}) {
    return InkWell(
      onTap: ontap as void Function()?,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: fixPadding * 1.2,
          horizontal: fixPadding * 2.0,
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              color: color,
              height: 20,
              width: 20,
              fit: BoxFit.cover,
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            title == 'Logout'
                ? Container()
                : const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )
          ],
        ),
      ),
    );
  }

  logoutDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.all(fixPadding * 1.5),
                child: Column(
                  children: [
                    Text(
                      'Sure you want to logout?',
                      style: black16SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Cancel',
                                style: primaryColor16BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        widthSpace,
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              AppManager.authController.signOut();
                              Get.delete<UserProfileController>();
                              Get.delete<GetAllUserController>();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                border: Border.all(color: primaryColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                'Logout',
                                style: white16BoldTextStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
