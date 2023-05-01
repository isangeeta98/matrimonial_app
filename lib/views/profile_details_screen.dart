import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/controller/religion_controller.dart';
import 'package:meetmeapp/models/get_all_user_response_model.dart';
import  "package:intl/intl.dart";
import '../constants/app_constants.dart';
import '../constants/string_constants.dart';
import '../controller/express_interest/interest_send_controller.dart';
import '../controller/save_info_controller/save_education_detail_controller.dart';
import '../controller/save_info_controller/save_family_detail_controller.dart';
import '../controller/all_user_controller/shortlist_block_abuse_controller.dart';
import '../controller/save_info_controller/save_personal_detail_controller.dart';
import '../controller/view_contact_user/store_view_contact_controller.dart';
import '../elements/column_builder.dart';
import 'call/call_screen.dart';

class ProfileDetailScreen extends StatefulWidget {
  final Joindatum? userdetaildata;
  String? userid;
  ProfileDetailScreen({Key? key, this.userdetaildata, this.userid}) : super(key: key);

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  ReligionController religionController = Get.put(ReligionController());
  SaveEducationDetailController saveEducationDetailController = Get.put(SaveEducationDetailController());
  SavePersonalDetailController savePersonalDetailController = Get.find<SavePersonalDetailController>();
  TextEditingController dateController = TextEditingController();
  InterestSendController interestSendController = Get.put(InterestSendController());
  StoreViewContactController storeViewContactController = Get.put(StoreViewContactController());
  @override
  void initState() {
    super.initState();
    if(savePersonalDetailController.userdetaildata.value.joindata?.isNotEmpty??false){
      saveEducationDetailController.geteducationspecdata(refresh: true,
          eduserid: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
          savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails!.isNotEmpty??false)?
          savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduHighEduMaster??"" : "":"");

      // var pickdate = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      // savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
      // savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pDob??
      //     DateTime.now() : DateTime.now():DateTime.now();
      //String formattedDate = DateFormat('yyyy-MM-dd').format(pickdate);
     // TextEditingController  dateController = TextEditingController(text: (formattedDate));
      saveEducationDetailController.geteducationspecdata(refresh: true,
          eduserid: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
          savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails!.isNotEmpty??false)?
          savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduHighEduMaster??"" : "":"");

      religionController.getcastedata(refresh: true, religioid: (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.userData!.isNotEmpty??false)?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pReligion??"" : "":"");

    }
    religionController.getreligiondata(refresh: true);
    religionController.getdrinkdata(refresh: true);
    religionController.getbodytypedata(refresh: true);
    religionController.getresidentalstatusdata(refresh: true);
    religionController.geteducationdata(refresh: true);
    religionController.getoccupationdata(refresh: true);
    religionController.getdietdata(refresh: true);
    religionController.getsmokedata(refresh: true);
    religionController.getfamilyvaluedata(refresh: true);
    religionController.getfamilytypedata(refresh: true);
    religionController.getfamilystatusdata(refresh: true);
    religionController.getfamilyincomedata(refresh: true);
    religionController.gettenativetimedata(refresh: true);
    religionController.getoccupationfielddata(refresh: true);
    religionController.getannualincomedata(refresh: true);
    religionController.getheightdata(refresh: true);
    religionController.getspeciallyabledata(refresh: true);
    setState(() {});
  }
  ShortListController shortListController = Get.put(ShortListController());
  final _formKeyPersonal = GlobalKey<FormState>();
  String isSelected = 'personalInfo';
  bool isTap = false;
  int? starStatus;
  bool blockisTap = false;
  int? blockStatus;
  String? occudata = "";
  String? occufielddata = "";
  String? mothoccdata = "";
  String? mothoccfielddata = "";
  String? familvaldata = "";
  String? familstadata = "";
  String? familtydata = "";
  String? familincdata = "";
  String? filterdata = "";
  String? residebtfilterdata = "";
  String? diettfilterdata = "";
  String? smokefilterdata = "";
  String? drinkfilterdata = "";
  String? annualfilterdata = "";
  String? bodytypwfilterdata = "";
  String? tenativefilterdata = "";
  String? specfilterdata = "";
  String? heightfilterdata = "";
  String? castefilterdata = "";
  String? educationfilterdata = "";
  String? educationmastfiltedata = "";
  String? occupfilterdata = "";
  String? occupspecfilterdata = "";
  @override
  Widget build(BuildContext context) {

    if(savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false){
      if(religionController.religionData.value.data?.first != null){
        final selectedIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pReligion).toList();
        final filtered = (religionController.religionData.value.data??[]).where((element) => selectedIds!.contains(element.id)).toList();
        print(filtered.first.rTitle);
        filterdata = filtered.first.rTitle;

        final residentIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pResidencialStatus).toList();
        final resdentfiltered = (religionController.residentalstatusData.value.data??[]).where((element) => residentIds!.contains(element.id)).toList();
        print(resdentfiltered.first.rsTitle);
        residebtfilterdata = resdentfiltered.first.rsTitle;

        final dietIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pDiet).toList();
        final dietfiltered = (religionController.dietData.value.data??[]).where((element) => dietIds!.contains(element.id)).toList();
        print(dietfiltered.first.dTitle);
        diettfilterdata = dietfiltered.first.dTitle;

        final smokeIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pSmoke).toList();
        final smokefiltered = (religionController.smokedata.value.data??[]).where((element) => smokeIds!.contains(element.id)).toList();
        print(smokefiltered.first.sTitle);
        smokefilterdata = smokefiltered.first.sTitle;

        final drinkIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pDrink).toList();
        final drinkfiltered = (religionController.drinkData.value.data??[]).where((element) => drinkIds!.contains(element.id)).toList();
        print(drinkfiltered.first.dTitle);
        drinkfilterdata = drinkfiltered.first.dTitle;

        final tenativeIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pTentativeTime).toList();
        final tenativefiltered = (religionController.tenativetimedata.value.data??[]).where((element) => tenativeIds!.contains(element.id)).toList();
        print(tenativefiltered.first.tiTitle);
        tenativefilterdata = tenativefiltered.first.tiTitle;

        final annualIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pAnnulIncome).toList();
        final annualfiltered = (religionController.annualincomedata.value.data??[]).where((element) => annualIds!.contains(element.id)).toList();
        print(annualfiltered.first.aiTitle);
        annualfilterdata = annualfiltered.first.aiTitle;

        final bodyIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pBodyType).toList();
        final bodyfiltered = (religionController.bodytypeData.value.data??[]).where((element) => bodyIds!.contains(element.id)).toList();
        print(bodyfiltered.first.btTitle);
        bodytypwfilterdata = bodyfiltered.first.btTitle;

        final specIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pSpeciallyAbility).toList();
        final specfiltered = (religionController.speciallyalbedata.value.data??[]).where((element) => specIds!.contains(element.id)).toList();
        print(specfiltered.first.saTitle);
        specfilterdata = specfiltered.first.saTitle;

        final heightIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pHeight).toList();
        final heightfiltered = (religionController.heightdata.value.data??[]).where((element) => heightIds!.contains(element.id)).toList();
        print(heightfiltered.first.hTitle);
        heightfilterdata = heightfiltered.first.hTitle;

        final casteIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.userData?.first.pCaste).toList();
        final castefiltered = (religionController.castedata.value.data??[]).where((element) => casteIds!.contains(element.id)).toList();
        print(castefiltered.first.cTitle);
        castefilterdata = castefiltered.first.cTitle;

        // final occdIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFOccupationDetails).toList();
        // final occfiltered = (religionController.occupationData.value.data??[]).where((element) => occdIds!.contains(element.id)).toList();
        // print(occfiltered.first.osTitle);
        // occudata = occfiltered.first.osTitle;

        // final occfielddIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFOccupationStatus).toList();
        // final occfieldfiltered = (religionController.occupationfirlddata.value.data??[]).where((element) => occfielddIds!.contains(element.id)).toList();
        // print(occfieldfiltered.first.ofTitle);
        // occufielddata = occfieldfiltered.first.ofTitle;

        // final mooccddIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fMOccupationDetails).toList();
        // final mooccfiltered = (religionController.occupationData.value.data??[]).where((element) => mooccddIds!.contains(element.id)).toList();
        // print(mooccfiltered.first.osTitle);
        // mothoccdata = mooccfiltered.first.osTitle;

        // final mooccfirldIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fMOccupationStatus).toList();
        // final mooccfirldfiltered = (religionController.occupationfirlddata.value.data??[]).where((element) => mooccfirldIds!.contains(element.id)).toList();
        // print(mooccfirldfiltered.first.ofTitle);
        // mothoccfielddata = mooccfirldfiltered.first.ofTitle;

        final familyvalueIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFamilyValue).toList();
        final familyvaluefiltered = (religionController.familyvaluedata.value.data??[]).where((element) => familyvalueIds!.contains(element.id)).toList();
        print(familyvaluefiltered.first.fvTitle);
        familvaldata = familyvaluefiltered.first.fvTitle;

        final familystatusIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFamilyStatus).toList();
        final familystatusfiltered = (religionController.familystatusdata.value.data??[]).where((element) => familystatusIds!.contains(element.id)).toList();
        print(familystatusfiltered.first.fsTitle);
        familstadata = familystatusfiltered.first.fsTitle;

        final familytypeIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFamilyType).toList();
        final familytypefiltered = (religionController.familytypedata.value.data??[]).where((element) => familytypeIds!.contains(element.id)).toList();
        print(familytypefiltered.first.ftTitle);
        familtydata = familytypefiltered.first.ftTitle;

        final familyincomeIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.familyDetails?.first.fFamilyIncome).toList();
        final familyincomefiltered = (religionController.familyincomedata.value.data??[]).where((element) => familyincomeIds!.contains(element.id)).toList();
        print(familyincomefiltered.first.fiTitle);
        familincdata = familyincomefiltered.first.fiTitle;

        // final educationIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduOccupationSpecId).toList();
        // final educationfiltered = (religionController.educationData.value.data??[]).where((element) => educationIds!.contains(element.id)).toList();
        // print(educationfiltered.first.esTitle);
        // educationfilterdata = educationfiltered.first.esTitle;

        // final educationmasIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduHighEduSpecId).toList();
        // final educationmasfiltered = (saveEducationDetailController.educationspecdata.value.data??[]).where((element) => educationmasIds!.contains(element.id)).toList();
        // print(educationmasfiltered.first.efTitle);
        // educationmastfiltedata = educationmasfiltered.first.efTitle;

        // final occupIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduOccupationSecId).toList();
        // final occupfiltered = (religionController.occupationData.value.data??[]).where((element) => occupIds!.contains(element.id)).toList();
        // print(occupfiltered.first.osTitle);
        // occupfilterdata = occupfiltered.first.osTitle;
        //
        // final occupspecIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduOccupationSpecId).toList();
        // final occupspecfiltered = (religionController.occupationfirlddata.value.data??[]).where((element) => occupspecIds!.contains(element.id)).toList();
        // print(occupspecfiltered.first.ofTitle);
        // occupspecfilterdata = occupspecfiltered.first.ofTitle;
      }
    }



    return GetBuilder<SavePersonalDetailController>(
        builder: (savePersonalDetailController){
          return
            // savePersonalDetailController.userdetaildata.value.joindata == null
            //   ? const Center(child: CircularProgressIndicator())
            //   :
            Scaffold(
            body: nestedScrollView(),
          );
        }

    );
  }
  nestedScrollView() {
    //toSendWhoVisitedProfile();
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.25,
            titleSpacing: 0,
            backgroundColor: primaryColor,
            pinned: true,
            leading: InkWell(
              onTap: () {
                setState(() {
                  Get.back();
                });
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: whiteColor,
              ),
            ),
            title: Text(
              "${widget.userdetaildata?.fristname} ${widget.userdetaildata?.middlename} ${widget.userdetaildata?.lastname}",
              style: white20BoldTextStyle,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/images/users/user7.png",
                   // fit: BoxFit.cover,
                  ),fit: BoxFit.cover)),
                child: Container(
                  color: blackColor.withOpacity(0.3),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2.0,
                  vertical: fixPadding,
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            if (isTap) {
                              setState(() {
                                starStatus = 0;
                              });

                            }
                            else {
                              setState(() {
                                starStatus = 1;
                              });
                              shortListController.saveshortlistdata(refresh: true,
                              sl_userId: widget.userid,
                              sl_shortlist_userId: widget.userdetaildata?.id);
                            }
                            // AddToFav? favData = await Upgradeservice()
                            //     .addRemoveFav(LoggedUID.current_UID, widget.id,
                            //     starStatus.toString());
                            //print("favData ${favData?.favstatus}");
                            setState(() {
                              isTap = !isTap;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: isTap?
                                        Text('Add to shortlist')
                                    :  Container(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                            ),
                            child: Icon(
                              isTap
                                  ? Icons.star_rounded
                                  : Icons.star_border_rounded,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'ShortList'.toUpperCase(),
                          style: white10BlackTextStyle,
                        ),
                      ],
                    ),

                    ///CHAT FEATURE COMMENETED
                    // widthSpace,
                    // widthSpace,
                    // InkWell(
                    //   onTap: () => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const Chat()),
                    //   ),
                    //   child: Column(
                    //     children: [
                    //       Container(
                    //         padding: const EdgeInsets.all(3),
                    //         decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           border: Border.all(color: whiteColor, width: 1.5),
                    //         ),
                    //         child: Image.asset(
                    //           'assets/icons/sms.png',
                    //           color: whiteColor,
                    //           height: 18,
                    //           width: 18,
                    //         ),
                    //       ),
                    //       const SizedBox(height: 2),
                    //       Text(
                    //         'ChatNow'.toUpperCase(),
                    //         style: white10BlackTextStyle,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    widthSpace,
                    widthSpace,
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CallScreen()),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                            ),
                            child: const Icon(
                              Icons.call,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'CallNow'.toUpperCase(),
                            style: white10BlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    InkWell(
                      onTap: () async {
                        if (blockisTap) {
                          setState(() {
                            blockStatus = 0;
                          });

                        }
                        else {
                          setState(() {
                            blockStatus = 1;
                          });
                          shortListController.saveblockuserdata(refresh: true,
                          bp_userId: widget.userid,
                          bp_block_userId: widget.userdetaildata?.id);
                        }
                        setState(() {
                          blockisTap = !blockisTap;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: blockisTap?
                            Text('User is Blocked')
                                : Container(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                            ),
                            child:  Icon(
                              blockisTap
                                  ? Icons.circle
                                  : Icons.block_rounded,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Block'.toUpperCase(),
                            style: white10BlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                    widthSpace,
                    widthSpace,
                    InkWell(
                      onTap: ()  {
                        showMyDialog(context);
                      },
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: whiteColor, width: 1.5),
                            ),
                            child:  Icon(
                                   Icons.report,
                              color: whiteColor,
                              size: 18,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Report'.toUpperCase(),
                            style: white10BlackTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 1.5),
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: fixPadding * 2.0,
              bottom: fixPadding,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 'personalInfo';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      3.9,
                      0,
                      3.9,
                      fixPadding / 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: isSelected == 'personalInfo'
                                ? primaryColor
                                : greyColor,
                            width: 3.5),
                      ),
                    ),
                    child: Text(
                      'Personal Info',
                      style: TextStyle(
                        color: isSelected == 'personalInfo'
                            ? primaryColor
                            : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 'religionInfo';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      3.9,
                      0,
                      3.9,
                      fixPadding / 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected == 'religionInfo'
                              ? primaryColor
                              : greyColor,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: Text(
                      'Religion Info',
                      style: TextStyle(
                        color: isSelected == 'religionInfo'
                            ? primaryColor
                            : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 'preferences';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      3.9,
                      0,
                      3.9,
                      fixPadding / 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected == 'preferences'
                              ? primaryColor
                              : greyColor,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: Text(
                      'Preferences',
                      style: TextStyle(
                        color: isSelected == 'preferences'
                            ? primaryColor
                            : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSelected = 'professionalInfo';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      3.9,
                      0,
                      3.9,
                      fixPadding / 3,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isSelected == 'professionalInfo'
                              ? primaryColor
                              : greyColor,
                          width: 3.5,
                        ),
                      ),
                    ),
                    child: Text(
                      'Professional Info',
                      style: TextStyle(
                        color: isSelected == 'professionalInfo'
                            ? primaryColor
                            : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSelected == 'personalInfo'
              ? personalInfo()
              : isSelected == 'religionInfo'
              ? religionInfo()
              : isSelected == 'preferences'
              ? preferences()
              : professionalInfo(),
        ],
      ),
    );
  }
  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) =>  AlertDialog(
          insetPadding: EdgeInsets.only(top: Get.height*0.03, bottom: Get.height*0.08, left: Get.width*0.06, right: Get.width*0.06),
          contentPadding: EdgeInsets.zero,
          scrollable: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.all(
                  Radius.circular(10.0))),
          content: Builder(
            builder: (context) {
              // Get available height and width of the build area of this widget. Make a choice depending on the size.
              var height = MediaQuery.of(context).size.height;
              var width = MediaQuery.of(context).size.width;
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState /*You can rename this!*/){
                    return Container(
                      height: Get.height*0.64,
                      width: width,
                      padding: EdgeInsets.only(right: Get.width*0.05, left: Get.width*0.05),
                      child: Form(
                        key: _formKeyPersonal,
                        child: Column(
                          children: [
                            SizedBox(height: Get.height*0.035,),
                            Text("Report about the user",
                            style: black20BoldTextStyle,),
                            heightSpace,
                            heightSpace,
                            heightSpace,
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: greyColor),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter report";
                                  }
                                  return null;
                                },
                                controller: shortListController.commentController,
                                cursorColor: primaryColor,
                                maxLines: 17,
                                style: black13MediumTextStyle,
                                decoration: const InputDecoration(
                                  //labelText: "",
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                            heightSpace,
                            heightSpace,
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(fixPadding * 1.5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Cancel'.toUpperCase(),
                                  style: white16BoldTextStyle,
                                ),
                              ),
                            ),
                            heightSpace,
                            heightSpace,
                            InkWell(
                              onTap: (){
                                if (_formKeyPersonal.currentState!.validate()){
                                  shortListController.submitabsuiveuser(refresh: true,
                                  ap_userId: widget.userid,
                                  ap_abuse_userId: widget.userdetaildata?.id);
                                  Get.back();
                                }
                              },
                              child: Container(
                                padding: const EdgeInsets.all(fixPadding * 1.5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'Save'.toUpperCase(),
                                  style: white16BoldTextStyle,
                                ),
                              ),
                            ),
                            heightSpace,
                            heightSpace,

                          ],
                        ),
                      ),
                    );
                  }
              );
            },
          ),
        )
    );
  }

  personalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        personalDetails(),
        heightSpace,
        heightSpace,
        basicDetails(),
        heightSpace,
        heightSpace,
        habits(),
        // heightSpace,
        // heightSpace,
        // hobbies(),
        heightSpace,
        heightSpace,
        familyDetails(),
        heightSpace,
        heightSpace,
        location(),
        // heightSpace,
        // heightSpace,
        // contact(),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,

        detailButton(GlobalConstants().sendInterest, ()
        async {
          interestSendController.sendinterestdata(refresh: true,
              senderid: widget.userid,
              receverid: widget.userdetaildata?.id);
         // await sendInterest();
        }),

        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        detailButton(
          'Upgrade to unlock contact details',
              () {
                storeViewContactController.storeviewcontactdata(refresh: true,
                vuserid: widget.userid,
                vviewuserid:  widget.userdetaildata?.id);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const SubscriptionPaln()),
            // );
          },
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
      ],
    );
  }

  personalDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Personal Information'),
        heightSpace,
        heightSpace,
        // Text(
        //   'A Few Lines About Me',
        //   style: grey14BoldTextStyle,
        // ),
        // Text(
        //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmo eiusmod tempor incididunt ut labore et dolore magna aliqua Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod...',
        //   style: grey13RegularTextStyle,
        // ),
      ],
    );
  }

  basicDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Basic Details'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: fixPadding / 3),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Name',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-    ${widget.userdetaildata?.fristname} ${widget.userdetaildata?.middlename} ${widget.userdetaildata?.lastname}',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Age',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-     25',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Height',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-     ${heightfilterdata}',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'DOB',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-    "${dateController.text}" ',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Marital Status',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-    ${(savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false)
                                 ? savePersonalDetailController.userdetaildata.value.joindata != null?
                            savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pMaritialStatus : "":""} ',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Annual Income',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-    ${annualfilterdata}',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Body Type',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-    ${bodytypwfilterdata}',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  habits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Habits'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Drinking',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                       "-    ${drinkfilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Eating',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${diettfilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Smoking',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${smokefilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  // hobbies() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       subTitle('Hobbies'),
  //       heightSpace,
  //       heightSpace,
  //       ColumnBuilder(
  //         itemCount: 5,
  //         itemBuilder: (context, index) {
  //           return Padding(
  //             padding: EdgeInsets.only(
  //                 bottom: index == 5 - 1 ? 0 : fixPadding / 3),
  //             child: Row(
  //               children: [
  //                 Text(
  //                   'hobby',
  //                   style: grey13SemiBoldTextStyle,
  //                 ),
  //               ],
  //             ),
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  familyDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Family Details'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Father's Name",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fFatherName}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Father's Gotra",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fFatherGotra}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Father's Occupation",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${occudata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Father's Occupation Status",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${occufielddata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Mother',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fMotherName}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Mother's Gotra",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fMotherGotra}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Mother's Occupation",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${mothoccdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Mother's Occupation Status",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${mothoccfielddata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Family Type",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${familtydata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Family Value",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${familvaldata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Family Status",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${familstadata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Family Income",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${familincdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "No. of Bother Married",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fNoOfBrotherMarried} "??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "No. of Sister Married",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.familyDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.familyDetails?.first.fNoOfSisterMarried} "??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        )
      ],
    );
  }

  location() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Location'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Text(
              //         'Citizenship',
              //         style: grey13SemiBoldTextStyle,
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child: Text(
              //         '-     India',
              //         style: grey13SemiBoldTextStyle,
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Country',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aCountry}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'State',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aState}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'City',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aCity}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Permanent Country',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aPCountry}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Permanent State',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aPState}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Permanent City',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.myAddressDetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.myAddressDetails?.first.aPCity}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  contact() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Contact'),
        heightSpace,
        heightSpace,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                'Mobile No',
                style: grey13SemiBoldTextStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "-    ${widget.userdetaildata?.mobile}"??"",
                style: grey13SemiBoldTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  detailButton(String btnText, void Function() btnFn) {
    return InkWell(
      onTap: btnFn,
      child: Container(
        padding: const EdgeInsets.all(fixPadding),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          btnText,
          style: white16BoldTextStyle,
        ),
      ),
    );
  }

  religionInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Religion Information'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Religion',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${filterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),

              if(filterdata != "Muslim" || filterdata != "Christian")...{
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Cast',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "-    ${castefilterdata}",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Time of Birth',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        (widget.userdetaildata?.userData?.isNotEmpty??false) ?
                        widget.userdetaildata != null?
                        "-    ${widget.userdetaildata?.userData?.first.pTob}"??"" : "":"",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Place of Birth',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        (widget.userdetaildata?.userData?.isNotEmpty??false) ?
                        widget.userdetaildata != null?
                        "-    ${widget.userdetaildata?.userData?.first.pPob}"??"" : "":"",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Manglik',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        (widget.userdetaildata?.userData?.isNotEmpty??false) ?
                        widget.userdetaildata != null?
                        "-    ${widget.userdetaildata?.userData?.first.pManglik}"??"" : "":"",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Horoscop',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        (widget.userdetaildata?.userData?.isNotEmpty??false) ?
                        widget.userdetaildata != null?
                        "-    ${widget.userdetaildata?.userData?.first.pHoroscop}"??"" : "":"",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              },
              if(filterdata == "Muslim")...{
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Cast',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "-    ${castefilterdata}",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              },

              if(filterdata == "Sikh")...{
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Amritdhari',
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        (widget.userdetaildata?.userData?.isNotEmpty??false) ?
                        widget.userdetaildata != null?
                        "-    ${widget.userdetaildata?.userData?.first.pSardar}"??"" : "":"",
                        style: grey13SemiBoldTextStyle,
                      ),
                    ),
                  ],
                ),
              }

            ],
          ),
        )
      ],
    );
  }

  preferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Preferences'),
        heightSpace,
        heightSpace,
        partnerPreferences(),
        heightSpace,
        heightSpace,
        professionalPreferences(),
        heightSpace,
        heightSpace,
        religionPreferences(),
        heightSpace,
        heightSpace,
        //locationPreferences(),
        heightSpace,
        heightSpace,
      ],
    );
  }

  partnerPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Partner Preferences'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Age',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.partnerPerfernces?.first.ageFrom}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       flex: 1,
              //       child: Text(
              //         'Height',
              //         style: grey13SemiBoldTextStyle,
              //       ),
              //     ),
              //     Expanded(
              //       flex: 2,
              //       child:  Text(
              //         (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
              //         widget.userdetaildata != null?
              //         "-    ${widget.userdetaildata?.partnerPerfernces?.first.}"??"" : "":"",
              //         style: grey13SemiBoldTextStyle,
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Marital Status',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.partnerPerfernces?.first.maritalStatus}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  professionalPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Professional Preferences'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Education',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("-",
                      // (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
                      // widget.userdetaildata != null?
                      // "-    ${widget.userdetaildata?.partnerPerfernces?.first.eduction}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Occupation',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '-     ',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  religionPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        subTitle('Religion Preferences'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Cast',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("-",
                      // (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
                      // widget.userdetaildata != null?
                      // "-    ${widget.userdetaildata?.partnerPerfernces?.first.caste}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Religion',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text("-",
                      // (widget.userdetaildata?.partnerPerfernces?.isNotEmpty??false) ?
                      // widget.userdetaildata != null?
                      // "-    ${widget.userdetaildata?.partnerPerfernces?.first.religion}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  professionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title('Professional Information'),
        heightSpace,
        heightSpace,
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Collage Name',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.usereducationdetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.usereducationdetails?.first.uEduCollegeName}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Education',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${educationfilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Higher Education',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${educationmastfiltedata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Occupation Sector',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${occupfilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Occupation Specialization',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "-    ${occupspecfilterdata}",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Occupation Title',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.usereducationdetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.usereducationdetails?.first.uEduOccupationTitle}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Organisation Name',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.usereducationdetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.usereducationdetails?.first.uEduOrganisationName}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Working Destination',
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      (widget.userdetaildata?.usereducationdetails?.isNotEmpty??false) ?
                      widget.userdetaildata != null?
                      "-    ${widget.userdetaildata?.usereducationdetails?.first.uEduWorkDestination}"??"" : "":"",
                      style: grey13SemiBoldTextStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  title(String title) {
    return Text(
      title,
      style: black16BoldTextStyle,
    );
  }

  subTitle(String title) {
    return Text(
      title,
      style: black14BoldTextStyle,
    );
  }
}
