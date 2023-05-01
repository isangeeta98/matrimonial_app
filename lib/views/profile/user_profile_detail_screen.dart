import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:meetmeapp/models/drop_down_response_model/body_type_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/diet_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/drink_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/education_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/family_income_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/family_status_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/family_type_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/family_value_response_model.dart';
import 'package:meetmeapp/models/drop_down_response_model/occupation_response_model.dart';

import '../../constants/app_constants.dart';
import '../../constants/string_constants.dart';
import '../../controller/get_all_user_controller.dart';
import '../../controller/profile_images/get_profile_image_controller.dart';
import '../../controller/save_info_controller/partner_preference_controller.dart';
import '../../controller/religion_controller.dart';
import '../../controller/save_info_controller/save_address_detail_controller.dart';
import '../../controller/save_info_controller/save_education_detail_controller.dart';
import '../../controller/save_info_controller/save_family_detail_controller.dart';
import '../../controller/save_info_controller/save_personal_detail_controller.dart';
import '../../controller/save_info_controller/user_kyc_controller.dart';
import '../../elements/stringconstant.dart';
import '../../models/drop_down_response_model/annual_income_response_model.dart';
import '../../models/drop_down_response_model/caste_response_model.dart';
import '../../models/drop_down_response_model/education_spec_response_model.dart';
import '../../models/drop_down_response_model/height_response_model.dart';
import '../../models/drop_down_response_model/occupation_field_response_model.dart';
import '../../models/drop_down_response_model/specially_able_response_model.dart';
import '../../models/drop_down_response_model/tenative_time_response_model.dart';
import '../../models/drop_down_response_model/religion_response_model.dart';
import '../../models/drop_down_response_model/residental_status_response_model.dart';
import '../../models/drop_down_response_model/smoke_response_model.dart';
import '../home_tabbar_screen.dart';

class UserProfileDetailScreen extends StatefulWidget {
  String? firstname;
  String? middlename;
  String? lastname;
  String? usersid;
  String? profilefor;
  String? dateobirth;
  String? genderdaat;
  UserProfileDetailScreen({Key? key, this.lastname, this.firstname,this.profilefor,this.dateobirth,
    this.genderdaat, this.middlename, this.usersid}) : super(key: key);

  @override
  State<UserProfileDetailScreen> createState() => _UserProfileDetailScreenState();
}

class _UserProfileDetailScreenState extends State<UserProfileDetailScreen> {
  final _formKeyPersonal = GlobalKey<FormState>();
  final _formKeyeditPersonal = GlobalKey<FormState>();
  final _formKeyfamily = GlobalKey<FormState>();
  final _formKeyeditfamily = GlobalKey<FormState>();
  SaveFamilyDetailController saveFamilyDetailController = Get.put(SaveFamilyDetailController());
  String isSelected = 'details';
  String? age;
  String? gender;
  String? height;
  String? weight;
  DateTime? dob;
  String? status;
  String? martialstatus;
  String? profilestatus;
  String? manglikstatus;
  String? dhadhistatus;
  String? namazstatus;
  String? hIjabstatus;
  String? nakabstatus;
  String? amritdharistatus;
  String? ablestatus;
  String? livingstatus;
  String? immigratestatus;
  String? tenativestatus;
  String? occupationfieldstatus;
  String? annualincomestatus;
  String? heightstatus;
  String? speciallyablestatus;





  String? education;
  String? religion;
  String? language;

//Preference
  String? ageFrom;
  String? ageTo;
  String? heightFrom;
  String? heightTo;
  String? patnerEducation;
  String? patnerReligion;

  List? statesList;
  String? selectedOcc;

  List? occupationList;
  String? selectedOccupation;
  List? educationList;
  String? selectedEducation;
  List? caste;
  String? selectedCaste;
  List? professionalStatusList;
  String? selectedProfessionalStatus;
  List? countryList;
  String? selectedCountry;
  List? cityList;
  String? selectedCity;
  List? stateList;
  String? selectedState;
  List? religionList;
  String? selectedreligion;
  List? languageList;
  String? selectedLanguage;
  TimeOfDay times = TimeOfDay.now();
  // var fomattedtime;
  var selectedTime;

  SaveAddressDetailController saveAddressDetailController = Get.put(SaveAddressDetailController());
  SavePersonalDetailController savePersonalDetailController = Get.find<SavePersonalDetailController>();
  UserKycController userKycController = Get.put(UserKycController());
  ReligionController religionController = Get.put(ReligionController());
  PartnerPreferenceController partnerPreferenceController = Get.put(PartnerPreferenceController());
  SaveEducationDetailController saveEducationDetailController = Get.put(SaveEducationDetailController());
  GetAllUserController getAllUserController = Get.find<GetAllUserController>();
  GetProfileImageController getProfileImageController = Get.find<GetProfileImageController>();

  @override
  void initState() {
    savePersonalDetailController.getuserdetaildata(refresh: true,
        userid: widget.usersid);
    getAllUserController.getalluserdata(refresh: true);
    getProfileImageController.getuserprofileimage(refresh: true);
    if(savePersonalDetailController.userdetaildata.value.joindata?.isNotEmpty??false){
      saveEducationDetailController.geteducationspecdata(refresh: true,
      eduserid: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails!.isNotEmpty??false)?
      savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduHighEduMaster??"" : "":"");

      religionController.getcastedata(refresh: true, religioid: (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.userData!.isNotEmpty??false)?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pReligion??"" : "":"");
      savePersonalDetailController.profiledatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null && (savePersonalDetailController.userdetaildata.value.joindata?.first.userData!.isNotEmpty??false)?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pProfileCreateFor??"" : "":"";
      setState(() {});
      savePersonalDetailController.familydatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fFatherName??"" : "":"";

      savePersonalDetailController.addressdatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aCountry??"" : "":"";

      savePersonalDetailController.educationdatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduCollegeName??"" : "":"";

      savePersonalDetailController.partnerdatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.ageTo??"" : "":"";


      savePersonalDetailController.marriagedatastore.value = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pMaritialStatus??"" : "":"";

      // var pickdate = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      // savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
      // savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pDob??
      //     DateTime.now() : DateTime.now():DateTime.now();
      // String formattedDate = DateFormat('yyyy-MM-dd').format(pickdate);
      savePersonalDetailController.editnameController = TextEditingController(text: widget.firstname);
      savePersonalDetailController.editmiddlenameController = TextEditingController(text: widget.middlename);
      savePersonalDetailController.editlastnameController = TextEditingController(text: widget.lastname);
     // savePersonalDetailController.editdobController = TextEditingController(text: (formattedDate));
      savePersonalDetailController.editreligionController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
      savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pReligion?? "" : "":"");
      saveFamilyDetailController.editfathernameController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fFatherName : "":"",);
      saveFamilyDetailController.editfathergotraController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fFatherGotra : "":"",);
      saveFamilyDetailController.editmothernameController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherName : "":"",);
      saveFamilyDetailController.editmothergotraController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherGotra : "":"",);
      saveFamilyDetailController.editmotheroccuptionController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMOccupationDetails : "":"",);
      saveFamilyDetailController.editmotheroccpstatusController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMOccupationStatus : "":"",);
      saveFamilyDetailController.editsisterController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfSister.toString() : "":"",);
      saveFamilyDetailController.editsistermarriedController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfSisterMarried.toString() : "":"",);
      saveFamilyDetailController.editbrotherController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfBrother.toString() : "":"",);
      saveFamilyDetailController.editbrothermarriedController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfBrotherMarried.toString() : "":"",);

      // edit address detail
      saveAddressDetailController.countryController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aCountry : "":"",);
      saveAddressDetailController.stateController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aState : "":"",);
      saveAddressDetailController.cityController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aCity : "":"",);
      saveAddressDetailController.addressController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aAddress : "":"",);
      saveAddressDetailController.pcountryController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPCountry : "":"",);
      saveAddressDetailController.pstateController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPState : "":"",);
      saveAddressDetailController.pcityController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPCity : "":"",);
      saveAddressDetailController.paddressController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPAddress : "":"",);

      //edit the education detail
      saveEducationDetailController.edithighedumasterController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduHighEduMaster : "":"",);
      saveEducationDetailController.editcollegenameController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduCollegeName : "":"",);
      saveEducationDetailController.editoccupationsecController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOccupationSecId : "":"",);
      saveEducationDetailController.editoccupationsplecController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOccupationSpecId : "":"",);
      saveEducationDetailController.editoccupationtitleController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOccupationTitle : "":"",);
      saveEducationDetailController.editorganisationnameController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOrganisationName : "":"",);
      saveEducationDetailController.editworkdesignationController = TextEditingController(text: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ? savePersonalDetailController.userdetaildata.value.joindata != null? savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduWorkDestination : "":"",);
    }

    super.initState();

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


  }




  Datum? dropdownvalue;
  DrinkData? drinkdropdownvalue;
  BodyTypeData? bodydropdownvalue;
  ResidentalStatusData? residentaldropdownvalue;
  EducationData? educationdropdownvalue;
  OccupationData? occupationdropdownvalue;
  OccupationData? motheroccupationdropdownvalue;
  DietData? dietdropdownvalue;
  SmokeData? smokedropdownvalue;
  FamilyValueData? familyvaluedropdownvalue;
  FamilyTypeData? familytypedropdownvalue;
  FamilyStatusData? familystatusdropdownvalue;
  FamilyIncomeData? familyincomedropdownvalue;
  FamilyIncomeData? familydropdownvalue;
  FamilyIncomeData? personaldropdownvalue;
  TenativeTimeData? tenativedropdownvalue;
  OccupationFieldData? occupationfielddropdown;
  OccupationFieldData? motheroccupationfielddropdown;
  AnnualIncomeData? annualincomedropdown;
  HeightData? heightdropdown;
  SpecialyAbleData? speciallyabledropdown;
  CastData? castedropdown;
  CastData? jaincastedropdown;
  CastData? sikhcastedropdown;
  CastData? christaincastedropdown;
  EducationSpecData? degrrdropdown;
  EducationSpecData? phddropdown;
  EducationSpecData? underdropdown;
  EducationSpecData? postdropdown;
  EducationSpecData? diplomadropdown;

  File? imageFile;
  Future getImage() async {
    final images = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (images != null) {
        imageFile = File(images.path);
        //assignmentController.addstudentAssignment(refresh: true, imagename: images );
      } else {
        print('No image selected.');
      }
    });
  }
  clearimage() {
    setState(() {
      imageFile = null;
    });
  }

  File? backimageFile;
  Future getaharbackImage() async {
    final backimages = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (backimages != null) {
        backimageFile = File(backimages.path);
        //assignmentController.addstudentAssignment(refresh: true, imagename: images );
      } else {
        print('No image selected.');
      }
    });
  }

  File? panimageFile;
  Future getpancardImage() async {
    final panimages = await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (panimages != null) {
        panimageFile = File(panimages.path);
        //assignmentController.addstudentAssignment(refresh: true, imagename: images );
      } else {
        print('No image selected.');
      }
    });
  }


  bool isChecked = false;
  bool showErrorMessage = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return primaryColor;
  }


  var baseurl = "http://65.2.137.114:5000/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ListView(
        // shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding:  EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          userProfile(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          tabBar(),
          isSelected == 'details'
              ? savePersonalDetailController.profiledatastore.value == "" ?
          personalDetails() : saveFamilyDetailController.userfamilydata.value.message == "Record add Successfully" ||savePersonalDetailController.doneClicked.value == "true" ?
          editpersonalDetails() : editpersonalDetailsScreen()
              :  isSelected == 'family'
          ? savePersonalDetailController.familydatastore.value == ""?
          familyInfo(): saveFamilyDetailController.userfamilydata.value.message == "Record add Successfully" ||
              savePersonalDetailController.familyClicked.value == "true" ?
              editfamilyInfo() : editfamilyDetailsScreen()
              :isSelected == 'address'
          ? savePersonalDetailController.addressdatastore.value == ""
          ?addressInfo() : saveAddressDetailController.addressdetaildata.value.message == "Record add Successfully"||
              savePersonalDetailController.addressClicked.value == "true" ?
          addressInfo() : editaddressDetailsScreen()
              :isSelected == 'preferences'
              ? savePersonalDetailController.partnerdatastore.value == ""
              ? patnerPreferences() : partnerPreferenceController.partnerprefdetaildata.value.message == "Record add Successfully" ||
              savePersonalDetailController.partnerClicked.value == "true" ?
          editpatnerPreferences()  : editpartnerDetailsScreen()
              :isSelected == 'education'
          ? savePersonalDetailController.educationdatastore.value == ""?
           educationInfo() : saveEducationDetailController.educationdetaildata.value.message == "Record add Successfully" ||
              savePersonalDetailController.educationClicked.value == "true"?
          editeducationInfo() :editeducationDetailsScreen()
              : kycInfo()

        ],
      ),
    );
  }
  userProfile() {
    return Column(
      children: [
        Container(
          height: 160,
          width: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image:  DecorationImage(
              image: getProfileImageController.getimageprofile.value.record != null?
              NetworkImage("${baseurl}${getProfileImageController.getimageprofile.value.record?.profileMultiImg}") as ImageProvider:
              widget.genderdaat == "Male"?
              AssetImage('assets/images/users/boyimages.png'):
              AssetImage('assets/images/users/girlimage.png'),
              //AssetImage('assets/images/users/user1.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        heightSpace,
        Text(
          '${widget.firstname} ${widget.middlename} ${widget.lastname}',
          style: black14BoldTextStyle,
        ),
        Text(
          '26 yrs  •  Software Developer',
          style: grey12SemiBoldTextStyle,
        ),
        Text(
          'Delhi, India',
          style: grey12RegularTextStyle,
        ),
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(fixPadding / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Image.asset(
                'assets/images/icons/chat.png',
                color: whiteColor,
                height: 15,
                width: 15,
              ),
            ),
            widthSpace,
            widthSpace,
            Container(
              padding: const EdgeInsets.all(fixPadding / 2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(3),
              ),
              child: const Icon(
                Icons.call_outlined,
                color: whiteColor,
                size: 15,
              ),
            ),
          ],
        ),
        heightSpace,
        // Text(
        //   'Lorem ipsum dolor sit amet, consectetur adipiscing\nelit, sed do eiusmod tempor incididunt ut labore et\ndolore magna aliqua.',
        //   textAlign: TextAlign.center,
        //   style: grey12RegularTextStyle,
        // ),
      ],
    );
  }

  tabBar() {
    return SizedBox(
      height: Get.height*0.05,
      width: Get.width*0.999,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 0.0),
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'details';
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                0.0,
                0,
                2.0,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected == 'details' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Personal Info',
                    style: TextStyle(
                      color: isSelected == 'details' ? primaryColor : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'family';
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                3.9,
                0,
                3.9,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                    isSelected == 'family' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Family Info',
                    style: TextStyle(
                      color: isSelected == 'family'
                          ? primaryColor
                          : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // widthSpace,
                  // isSelected == 'preferences'
                  //     ? InkWell(
                  //   // onTap: () => Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => const EditPreferences()),
                  //   // ),
                  //   child: Image.asset(
                  //     'assets/images/icons/edit.png',
                  //     color: primaryColor,
                  //     height: 11,
                  //     width: 11,
                  //   ),
                  // )
                  //     : Container(),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'address';
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                3.9,
                0,
                3.9,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                    isSelected == 'address' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Address Info',
                    style: TextStyle(
                      color: isSelected == 'address'
                          ? primaryColor
                          : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // widthSpace,
                  // isSelected == 'preferences'
                  //     ? InkWell(
                  //   // onTap: () => Navigator.push(
                  //   //   context,
                  //   //   MaterialPageRoute(
                  //   //       builder: (context) => const EditPreferences()),
                  //   // ),
                  //   child: Image.asset(
                  //     'assets/images/icons/edit.png',
                  //     color: primaryColor,
                  //     height: 11,
                  //     width: 11,
                  //   ),
                  // )
                  //     : Container(),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'education';
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                2.0,
                0,
                2.0,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                    isSelected == 'education' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Education Info',
                    style: TextStyle(
                      color: isSelected == 'education'
                          ? primaryColor
                          : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'kyc';
              });
            },
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                2.0,
                0,
                2.0,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                    isSelected == 'kyc' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'KYC Detail',
                    style: TextStyle(
                      color: isSelected == 'kyc'
                          ? primaryColor
                          : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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
                2.0,
                0,
                2.0,
                fixPadding / 3,
              ),
              //padding: const EdgeInsets.only(bottom: fixPadding / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color:
                    isSelected == 'preferences' ? primaryColor : greyColor,
                    width: 3.5,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Partner Preferences',
                    style: TextStyle(
                      color: isSelected == 'preferences'
                          ? primaryColor
                          : greyColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: fixPadding * 2.0,
          //     bottom: fixPadding,
          //   ),
          //   child: Row(
          //     children: [
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  familyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Form(
            key: _formKeyfamily,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Father's Name",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter Father's Name";
                      } else if (value.length < 2) {
                        return "Length of Father's name should be minimum 3";
                      }
                      return null;
                    },
                    controller: saveFamilyDetailController.fathernameController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Enter Father's Name",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Father's Occupation",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<OccupationData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Father's Occupation",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: occupationdropdownvalue,
                          //??religionController.occupationData.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          occupationdropdownvalue = newValue as OccupationData;
                          saveFamilyDetailController.fatheroccupController.text = newValue.id??"";
                        });
                      },
                      items: religionController.occupationData.value.data?.map((list) {
                        return DropdownMenuItem<OccupationData>(
                          child: Text(list.osTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Father's Occupation Status",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<OccupationFieldData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Father's Occupation Status",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: occupationfielddropdown,
                          //??religionController.occupationData.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          occupationfielddropdown = newValue as OccupationFieldData;
                          saveFamilyDetailController.fatheroccupstatusController.text = newValue.id??"";
                        });
                      },
                      items: religionController.occupationfirlddata.value.data?.map((list) {
                        return DropdownMenuItem<OccupationFieldData>(
                          child: Text(list.ofTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Father's Gotra",
                  style: black15BoldTextStyle,
                ),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Please enter Mother's Name";
                    //   } else if (value.length < 2) {
                    //     return "Length of Mother's name should be minimum 3";
                    //   }
                    //   return null;
                    // },
                    controller: saveFamilyDetailController.fathergotraController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Enter Father's Gotra",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // Text(
                //   "Father's Status",
                //   style: black15BoldTextStyle,
                // ),
                // heightSpace,
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: fixPadding,
                //     vertical: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: greyColor),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: TextFormField(
                //     // validator: (value) {
                //     //   if (value == null || value.isEmpty) {
                //     //     return "Please enter Mother's Name";
                //     //   } else if (value.length < 2) {
                //     //     return "Length of Mother's name should be minimum 3";
                //     //   }
                //     //   return null;
                //     // },
                //     controller: saveFamilyDetailController.familystatusController,
                //     cursorColor: primaryColor,
                //     style: black13MediumTextStyle,
                //     decoration: const InputDecoration(
                //       hintText: "Enter Father's Status",
                //       isDense: true,
                //       contentPadding: EdgeInsets.zero,
                //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                //     ),
                //   ),
                // ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Mother's Name",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter Mother's Name";
                      } else if (value.length < 2) {
                        return "Length of Mother's name should be minimum 3";
                      }
                      return null;
                    },
                    controller: saveFamilyDetailController.mothernameController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Enter Mother's Name",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // Text(
                //   "Mother's Parent Gotra",
                //   style: black15BoldTextStyle,
                // ),
                // heightSpace,
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: fixPadding,
                //     vertical: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: greyColor),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: TextFormField(
                //     // validator: (value) {
                //     //   if (value == null || value.isEmpty) {
                //     //     return "Please enter Mother's Name";
                //     //   } else if (value.length < 2) {
                //     //     return "Length of Mother's name should be minimum 3";
                //     //   }
                //     //   return null;
                //     // },
                //     controller: saveFamilyDetailController.motherparentController,
                //     cursorColor: primaryColor,
                //     style: black13MediumTextStyle,
                //     decoration: const InputDecoration(
                //       hintText: "Enter Mother's Parent Gotra",
                //       isDense: true,
                //       contentPadding: EdgeInsets.zero,
                //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                //     ),
                //   ),
                // ),
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // heightSpace,
                // Text(
                //   "Mother's Family Gotra",
                //   style: black15BoldTextStyle,
                // ),
                // heightSpace,
                // Container(
                //   width: double.infinity,
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: fixPadding,
                //     vertical: 8,
                //   ),
                //   decoration: BoxDecoration(
                //     border: Border.all(color: greyColor),
                //     borderRadius: BorderRadius.circular(5),
                //   ),
                //   child: TextFormField(
                //     // validator: (value) {
                //     //   if (value == null || value.isEmpty) {
                //     //     return "Please enter Mother's Name";
                //     //   } else if (value.length < 2) {
                //     //     return "Length of Mother's name should be minimum 3";
                //     //   }
                //     //   return null;
                //     // },
                //     controller: saveFamilyDetailController.motherfamilyController,
                //     cursorColor: primaryColor,
                //     style: black13MediumTextStyle,
                //     decoration: const InputDecoration(
                //       hintText: "Enter Mother's Gotra",
                //       isDense: true,
                //       contentPadding: EdgeInsets.zero,
                //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                //     ),
                //   ),
                // ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,

                Text(
                  "Mother's Occupation",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<OccupationData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Mother's Occupation",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: motheroccupationdropdownvalue,
                      //??religionController.occupationData.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          motheroccupationdropdownvalue = newValue as OccupationData;
                          saveFamilyDetailController.motheroccuptionController.text = newValue.id??"";
                        });
                      },
                      items: religionController.occupationData.value.data?.map((list) {
                        return DropdownMenuItem<OccupationData>(
                          child: Text(list.osTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Mother's Occupation Status",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<OccupationFieldData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Mother's Occupation Status",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: motheroccupationfielddropdown,
                      //??religionController.occupationData.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          motheroccupationfielddropdown = newValue as OccupationFieldData;
                          saveFamilyDetailController.motheroccpstatusController.text = newValue.id??"";
                        });
                      },
                      items: religionController.occupationfirlddata.value.data?.map((list) {
                        return DropdownMenuItem<OccupationFieldData>(
                          child: Text(list.ofTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Mother's Gotra",
                  style: black15BoldTextStyle,
                ),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return "Please enter Mother's Name";
                    //   } else if (value.length < 2) {
                    //     return "Length of Mother's name should be minimum 3";
                    //   }
                    //   return null;
                    // },
                    controller: saveFamilyDetailController.mothergotraController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Enter Mother's Gotra",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Family Status",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<FamilyStatusData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Family Status",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: familystatusdropdownvalue,
                          //??religionController.familystatusdata.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          familystatusdropdownvalue = newValue as FamilyStatusData;
                          saveFamilyDetailController.familystatusController.text = newValue.id??"";
                        });
                      },
                      items: religionController.familystatusdata.value.data?.map((list) {
                        return DropdownMenuItem<FamilyStatusData>(
                          child: Text(list.fsTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Family Value",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<FamilyValueData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Family Value",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: familyvaluedropdownvalue,
                          //??religionController.familyvaluedata.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          familyvaluedropdownvalue = newValue as FamilyValueData;
                          saveFamilyDetailController.familyvalueController.text = newValue.id??"";
                        });
                      },
                      items: religionController.familyvaluedata.value.data?.map((list) {
                        return DropdownMenuItem<FamilyValueData>(
                          child: Text(list.fvTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Family type",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<FamilyTypeData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Enter Family Type",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: familytypedropdownvalue,
                          //??religionController.familytypedata.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          familytypedropdownvalue = newValue as FamilyTypeData;
                          saveFamilyDetailController.familytypeController.text = newValue.id??"";
                        });
                      },
                      items: religionController.familytypedata.value.data?.map((list) {
                        return DropdownMenuItem<FamilyTypeData>(
                          child: Text(list.ftTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "Family Income",
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<FamilyIncomeData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Select Family  Income",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: familydropdownvalue,
                          //??religionController.familyincomedata.value.data?.first,
                      style: black13RegularTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          familydropdownvalue = newValue as FamilyIncomeData;
                          saveFamilyDetailController.familyincomeController.text = newValue.id??"";
                        });
                      },
                      items: religionController.familyincomedata.value.data?.map((list) {
                        return DropdownMenuItem<FamilyIncomeData>(
                          child: Text(list.fiTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "No. of Sister",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter No. of Sister";
                      }
                      return null;
                    },
                    controller: saveFamilyDetailController.sisterController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Sister",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "No. of Sister married",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter no. of sister married";
                      } else {
                        int tempVal = int.parse(value ?? "0");
                        int maxmark = int.parse(saveFamilyDetailController.sisterController.text ?? "0");
                        if (tempVal <= maxmark) {
                          return null;
                        }else {
                          setState(() {});
                          return "Sister married should be less than or equal to no.of sister";
                        }
                      }
                    },
                    controller: saveFamilyDetailController.sistermarriedController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Sister married",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "No. of Brother",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter No. of Brother";
                      }
                      return null;
                    },
                    controller: saveFamilyDetailController.brotherController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Brother",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                heightSpace,
                Text(
                  "No. of Brother married",
                  style: black15BoldTextStyle,
                ),
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
                        return "Please enter no. of brother married";
                      } else {
                        int tempVal = int.parse(value ?? "0");
                        int maxmark = int.parse(saveFamilyDetailController.brotherController.text ?? "0");
                        if (tempVal <= maxmark) {
                          return null;
                        }else {
                          setState(() {});
                          return "Brother married should be less than or equal to no.of brother";
                        }

                      }
                    },
                    controller: saveFamilyDetailController.brothermarriedController,
                    cursorColor: primaryColor,
                    style: black13MediumTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Brother married",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                InkWell(
                  onTap: (){
                    if (_formKeyfamily.currentState!.validate()){
                      saveFamilyDetailController.savefamilydetail(refresh: true,userid: widget.usersid,
                          focc:religionController.occupationData.value.data?.first.osTitle,
                          foccupst:religionController.occupationData.value.data?.first.osTitle,
                          fstatus:religionController.familystatusdata.value.data?.first.fsTitle,
                          fvalue:religionController.familyvaluedata.value.data?.first.fvTitle,
                          ftype:religionController.familytypedata.value.data?.first.ftTitle,
                          ficome:religionController.familyincomedata.value.data?.first.fiTitle)
                          .whenComplete(() {
                        savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                      });
                      setState(() {});
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
        )
      ],
    );
  }

  addressInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              heightSpace,
              Text(
                "Country",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.countryController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Enter Country Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "State",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.stateController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Enter State Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "City",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.cityController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Enter City Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Address",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.addressController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        print(isChecked);
                        if(isChecked == true){
                          saveAddressDetailController.boolController.text = "true";
                        }else{
                          saveAddressDetailController.boolController.text = "false";
                        }
                      });
                    },
                  ),
                  Text("Permanent Address",
                    style: grey14SemiBoldTextStyle,)
                ],
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent Country",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.boolController.text == "true"
                      ?saveAddressDetailController.countryController
                      :saveAddressDetailController.pcountryController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  readOnly: saveAddressDetailController.boolController.text == "true"?true:false,
                  decoration: const InputDecoration(
                    hintText: "Enter permanent Country Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent State",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.boolController.text == "true"
                      ?saveAddressDetailController.stateController
                      : saveAddressDetailController.pstateController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  readOnly: saveAddressDetailController.boolController.text == "true"?true:false,
                  decoration: const InputDecoration(
                    hintText: "Enter Permanent State Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent City",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller: saveAddressDetailController.boolController.text == "true"
                      ?saveAddressDetailController.cityController
                      :saveAddressDetailController.pcityController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  readOnly: saveAddressDetailController.boolController.text == "true"?true:false,
                  decoration: const InputDecoration(
                    hintText: "Enter Permanent City Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent Address",
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Please enter Father's Name";
                  //   } else if (value.length < 2) {
                  //     return "Length of Father's name should be minimum 3";
                  //   }
                  //   return null;
                  // },
                  controller:saveAddressDetailController.boolController.text == "true"
                      ?saveAddressDetailController.addressController
                      : saveAddressDetailController.paddressController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  readOnly: saveAddressDetailController.boolController.text == "true"?true:false,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    hintText: "",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              if(saveAddressDetailController.addressdetaildata.value.message == "Record add Successfully")...{
                InkWell(
                  onTap: (){
                    saveAddressDetailController.saveaddressdetail(refresh: true,isvalue: isChecked, userid: widget.usersid)
                        .whenComplete(() {
                      savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(fixPadding * 1.5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Edit'.toUpperCase(),
                      style: white16BoldTextStyle,
                    ),
                  ),
                ),
              }else...{
                InkWell(
                  onTap: (){
                    saveAddressDetailController.saveaddressdetail(refresh: true,isvalue: isChecked, userid: widget.usersid).
                        whenComplete(() {
                    savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                    });
                    setState(() {});
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
              },

              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
            ],
          ),
        )
      ],
    );
  }

  personalDetails() {
    return Form(
      key: _formKeyPersonal,
      child: Obx(()=>
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              'First Name',
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Name';
                //   } else if (value.length < 2) {
                //     return 'Length of name should be minimum 3';
                //   }
                //   return null;
                // },
                controller: savePersonalDetailController.nameController,
                cursorColor: primaryColor,
                style: black13MediumTextStyle,
                readOnly: true,
                decoration:  InputDecoration(
                  hintText: "${widget.firstname}",
                  hintStyle: black13MediumTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Middle Name',
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Name';
                //   } else if (value.length < 2) {
                //     return 'Length of name should be minimum 3';
                //   }
                //   return null;
                // },
                controller: savePersonalDetailController.middlenameController,
                cursorColor: primaryColor,
                readOnly: true,
                style: black13MediumTextStyle,
                decoration:  InputDecoration(
                  hintText: "${widget.middlename}",
                  hintStyle: black13MediumTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Last Name',
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Name';
                //   } else if (value.length < 2) {
                //     return 'Length of name should be minimum 3';
                //   }
                //   return null;
                // },
                controller: savePersonalDetailController.lastnameController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black13MediumTextStyle,
                decoration:  InputDecoration(
                  hintText: "${widget.lastname}",
                  hintStyle: black13MediumTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Row(
              children: [
                // Expanded(
                //   child: educationDropdown(),
                // ),
                // widthSpace,
                // widthSpace,
                // widthSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Religion',
                        style: black15BoldTextStyle,
                      ),
                      heightSpace,
                      Container(
                        width: Get.width*0.99,
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding,
                          vertical: fixPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Datum>(
                            isExpanded: true,
                            elevation: 0,
                            isDense: true,
                            hint: Text(
                              'Select Religion',
                              style: black13RegularTextStyle,
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: primaryColor,
                              size: 20,
                            ),
                            value: dropdownvalue,
                            //??religionController.religionData.value.data?.first,
                            //selectedreligion,
                            style: black13RegularTextStyle,
                            onChanged: (newValue) {
                              setState(() {
                                dropdownvalue = newValue as Datum;
                                savePersonalDetailController.religionController.text = newValue.id??"${religionController.religionData.value.data?.first.id}";
                                savePersonalDetailController.religionsController.text = newValue.rTitle??"${religionController.religionData.value.data?.first.rTitle}";
                              });
                              setState(() {});
                              this.religionController.getcastedata(refresh: true, religioid: newValue?.id);
                            },
                            items: religionController.religionData.value.data?.map((list) {
                              return DropdownMenuItem<Datum>(
                                child: Text(list.rTitle??'Select Religion'),
                                value: list,
                              );
                            },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            heightSpace,
            heightSpace,
            if(savePersonalDetailController.religionsController.text == "Hindu" || savePersonalDetailController.religionsController.text == "Jain" ||
                savePersonalDetailController.religionsController.text == "Sikh" ||  savePersonalDetailController.religionsController.text == "Christian")...{
              Text(
                'Caste',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              if(savePersonalDetailController.religionsController.text == "Hindu")...{
                Obx(()=>Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CastData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Select Caste",
                        style: black14RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: castedropdown,
                      //??religionController.residentalstatusData.value.data?.first,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          castedropdown = newValue as CastData;
                          savePersonalDetailController.casteController.text = newValue.id??"";

                        });

                      },
                      items: religionController.castedata.value.data?.map((list) {
                        return DropdownMenuItem<CastData>(
                          child: Text(list.cTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),),
              }else if(savePersonalDetailController.religionsController.text == "Jain")...{
                Obx(()=>Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CastData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Select Caste",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: jaincastedropdown,
                      //??religionController.residentalstatusData.value.data?.first,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          jaincastedropdown = newValue as CastData;
                          savePersonalDetailController.casteController.text = newValue.id??"";
                        });
                      },
                      items: religionController.castedata.value.data?.map((list) {
                        return DropdownMenuItem<CastData>(
                          child: Text(list.cTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),),
              }else if(savePersonalDetailController.religionsController.text == "Sikh")...{
                Obx(()=>Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CastData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Select Caste",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: sikhcastedropdown,
                      //??religionController.residentalstatusData.value.data?.first,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          sikhcastedropdown = newValue as CastData;
                          savePersonalDetailController.casteController.text = newValue.id??"";
                        });
                      },
                      items: religionController.castedata.value.data?.map((list) {
                        return DropdownMenuItem<CastData>(
                          child: Text(list.cTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),),
              }else if(savePersonalDetailController.religionsController.text == "Christian")...{
                Obx(()=>Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CastData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        "Select Caste",
                        style: black13RegularTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: christaincastedropdown,
                      //??religionController.residentalstatusData.value.data?.first,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          christaincastedropdown = newValue as CastData;
                          savePersonalDetailController.casteController.text = newValue.id??"";
                        });
                      },
                      items: religionController.castedata.value.data?.map((list) {
                        return DropdownMenuItem<CastData>(
                          child: Text(list.cTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),),
              },

            }else...{
              Container()
            },
            SizedBox(height: Get.height*0.01),

            if(savePersonalDetailController.religionsController.text == "Muslim" && widget.genderdaat == "Male")...{
              Text(
                'Dhadhi',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: dhadhistatus,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        dhadhistatus = newValue as String?;
                        //savePersonalDetailController.casteController.text = newValue!;
                      });
                    },
                    items: [
                      'Yes',
                      'No',
                      'Occasionally',
                    ]
                        .map<DropdownMenuItem<String>>((list) {
                      return DropdownMenuItem(
                        child: Text(list),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,),
              Text(
                'Namaz',
                style: black15BoldTextStyle,
              ),
              SizedBox(height: Get.height*0.009,),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: namazstatus,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        namazstatus = newValue as String?;
                        //savePersonalDetailController.casteController.text = newValue!;
                      });
                    },
                    items: [
                      '5 times a day',
                      'Once a day',
                      'Occasionally',
                      'Never',
                    ]
                        .map<DropdownMenuItem<String>>((list) {
                      return DropdownMenuItem(
                        child: Text(list),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,)
            }else...{
              Container()
            },
            if(savePersonalDetailController.religionsController.text == "Muslim" && widget.genderdaat == "Female")...{
              Text(
                'Hijab ',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: hIjabstatus,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        hIjabstatus = newValue as String?;
                        //savePersonalDetailController.casteController.text = newValue!;
                      });
                    },
                    items: [
                      'Always',
                      'Never',
                      'Occasionally',
                    ]
                        .map<DropdownMenuItem<String>>((list) {
                      return DropdownMenuItem(
                        child: Text(list),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,),
              Text(
                'Nakab',
                style: black15BoldTextStyle,
              ),
              SizedBox(height: Get.height*0.009,),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: nakabstatus,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        nakabstatus = newValue as String?;
                        //savePersonalDetailController.casteController.text = newValue!;
                      });
                    },
                    items: [
                      'Always',
                      'Never',
                      'Occasionally',
                    ]
                        .map<DropdownMenuItem<String>>((list) {
                      return DropdownMenuItem(
                        child: Text(list),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,)
            }else...{
              Container()
            },

            if(savePersonalDetailController.religionsController.text == "Sikh" && widget.genderdaat == "Male")...{
              Text(
                'Amritdhari ',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: amritdharistatus,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        amritdharistatus = newValue as String?;
                        //savePersonalDetailController.casteController.text = newValue!;
                      });
                    },
                    items: [
                      'Yes',
                      'No',
                    ]
                        .map<DropdownMenuItem<String>>((list) {
                      return DropdownMenuItem(
                        child: Text(list),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,),
            }else...{
              Container()
            },

            Text(
              'Profile Create For ',
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     return 'Please enter Name';
                //   } else if (value.length < 2) {
                //     return 'Length of name should be minimum 3';
                //   }
                //   return null;
                // },
                controller: savePersonalDetailController.profileforController,
                cursorColor: primaryColor,
                readOnly: true,
                style: black13MediumTextStyle,
                decoration:  InputDecoration(
                  hintText: savePersonalDetailController.profileforController.text.isEmpty ?"${widget.profilefor}": widget.profilefor,
                  hintStyle: black13MediumTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: fixPadding,
            //     vertical: 8,
            //   ),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: greyColor),
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton(
            //       isExpanded: true,
            //       elevation: 0,
            //       isDense: true,
            //       hint: Text(
            //         'Profile create for',
            //         style: black13RegularTextStyle,
            //       ),
            //       icon: const Icon(
            //         Icons.keyboard_arrow_down,
            //         color: primaryColor,
            //         size: 20,
            //       ),
            //       value: profilestatus,
            //       style: black13RegularTextStyle,
            //       onChanged: (String? newValue) {
            //         setState(() {
            //           profilestatus = newValue;
            //           savePersonalDetailController.profileforController.text = newValue!;
            //         });
            //       },
            //       items: <String>[
            //         'My Self',
            //         'My Brother',
            //         'My Sister',
            //         'My Son',
            //         'My daughter',
            //         'Friend',
            //       ].map<DropdownMenuItem<String>>((String value) {
            //         return DropdownMenuItem<String>(
            //           value: value,
            //           child: Text(value),
            //         );
            //       }).toList(),
            //     ),
            //   ),
            // ),
            heightSpace,
            heightSpace,
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     ageDropdown(),
            //     widthSpace,
            //     widthSpace,
            //     widthSpace,
            //     genderDropdown(),
            //   ],
            // ),
            // heightSpace,
            // heightSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Height',
                        style: black15BoldTextStyle,
                      ),
                      heightSpace,
                      Container(
                        width: Get.width*0.99,
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding,
                          vertical: fixPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<HeightData>(
                            isExpanded: true,
                            elevation: 0,
                            isDense: true,
                            hint: Text(
                              "Select Height",
                              style: black13RegularTextStyle,
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: primaryColor,
                              size: 20,
                            ),
                            value: heightdropdown,
                            //??religionController.residentalstatusData.value.data?.first,
                            style: black13RegularTextStyle,
                            onChanged: (newValue) {
                              setState(() {
                                heightdropdown = newValue as HeightData;
                                savePersonalDetailController.heightController.text = newValue.id??"";
                              });
                            },
                            items: religionController.heightdata.value.data?.map((list) {
                              return DropdownMenuItem<HeightData>(
                                child: Text(list.hTitle.toString()),
                                value: list,
                              );
                            },
                            ).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                widthSpace,
                widthSpace,
                widthSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 27.5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 1.3,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        cursorColor: primaryColor,
                        readOnly: true,
                        style: black13MediumTextStyle,
                        decoration:  InputDecoration(
                          hintText: savePersonalDetailController.genderController.text = widget.genderdaat??"",
                          hintStyle: black13MediumTextStyle,
                          //hintText: "Enter Name",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                )
               // weightDropdown(),
              ],
            ),
            heightSpace,
            heightSpace,
            dobDropdown(),
            heightSpace,
            heightSpace,
            if(savePersonalDetailController.religionsController.text == "Hindu" || savePersonalDetailController.religionsController.text == "Jain" ||
                savePersonalDetailController.religionsController.text == "Sikh")...{
              Text(
                'Time of Birth',
                style: black15BoldTextStyle,
              ),
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
                  controller: savePersonalDetailController.tobController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Time of birth",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                  readOnly: true,
                  onTap: ()async{
                    TimeOfDay? timeRecord = await showTimePicker(
                      context: context,
                      initialTime: times.replacing(hour: times.hourOfPeriod),
                      builder: (BuildContext context, Widget? child) {
                        return MediaQuery(
                          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                          child: child!,
                        );
                      },
                    );
                    if (timeRecord != null) {
                      setState(() {
                        var df = DateFormat("h:mm a");
                        var dt = df.parse(timeRecord.format(context));
                        var finaltime =  DateFormat('HH:mm a').format(dt);
                        var selectedTime = DateFormat('HH:mm a').format(dt);

                        print(finaltime);
                        setState(() {
                          selectedTime = finaltime;
                          selectedTime = timeRecord.format(context);
                        });
                        savePersonalDetailController.tobController.text = selectedTime;
                        print(selectedTime);
                      });}
                  },
                ),
              ),
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.01,),
              Text(
                'Manglik',
                style: black15BoldTextStyle,
              ),
              SizedBox(height: Get.height*0.009,),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: manglikstatus,
                    style: black13RegularTextStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        manglikstatus = newValue;
                       // savePersonalDetailController.profileforController.text = newValue!;
                      });
                    },
                    items: <String>[
                      'yes',
                      'no',
                      'dont know',
                      'doesnot matter',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.01,)
            }else...{
              Container()
            },
            if(savePersonalDetailController.religionsController.text == "Hindu" || savePersonalDetailController.religionsController.text == "Jain" ||
                savePersonalDetailController.religionsController.text == "Sikh")...{
              Text(
                'Place of Birth',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.birthplaceController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Please enter place of birth",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.01,),
              heightSpace,
              heightSpace,
            }else...{
              Container()
            },

            statusDropdown(),
            heightSpace,
            heightSpace,
            if(savePersonalDetailController.maritialstatusController.text == "Divorced" )...{
              Text(
                'No. of Child',
                style: black15BoldTextStyle,
              ),
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
                      return 'Please enter no. of child';
                    }
                    return null;
                  },
                  controller: savePersonalDetailController.noofchildController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "No. of Child",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.02,),
              // heightSpace,
              Text(
                'No. of Child living with you',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              SizedBox(height: Get.height*0.01,),
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
                      return "Please enter no. of living with you";
                    } else {
                      int tempVal = int.parse(value ?? "0");
                      int maxmark = int.parse(savePersonalDetailController.noofchildController.text ?? "0");
                      if (tempVal <= maxmark) {
                        return null;
                      }else {
                        setState(() {});
                        return "Please enter correct no.";
                      }
                    }
                  },
                  controller: savePersonalDetailController.childlivewithController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "No. of Child living with you",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.02,),
            }else if(savePersonalDetailController.maritialstatusController.text == "Widower" )...{
              Text(
                'No. of Child',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.noofchildController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "No. of Child",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.02,),
              // heightSpace,
              Text(
                'No. of Child living with you',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              SizedBox(height: Get.height*0.01,),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.childlivewithController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "No. of Child living with you",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              SizedBox(height: Get.height*0.02,),
            }else...{
              Container()
            },
            Text(
              'Residential Status',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ResidentalStatusData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Residentail Status",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: residentaldropdownvalue,
                      //??religionController.residentalstatusData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      residentaldropdownvalue = newValue as ResidentalStatusData;
                      savePersonalDetailController.residencialController.text = newValue.id??"${religionController.residentalstatusData.value.data?.first.id}";
                    });
                  },
                  items: religionController.residentalstatusData.value.data?.map((list) {
                    return DropdownMenuItem<ResidentalStatusData>(
                      child: Text(list.rsTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            // Container(
            //   width: Get.width*0.99,
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: fixPadding,
            //     vertical: fixPadding / 2,
            //   ),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: greyColor),
            //     borderRadius: BorderRadius.circular(5),
            //   ),
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton<ResidentalStatusData>(
            //       isExpanded: true,
            //       elevation: 0,
            //       isDense: true,
            //       hint: Text(
            //         'Residential Status',
            //         style: black13RegularTextStyle,
            //       ),
            //       icon: const Icon(
            //         Icons.keyboard_arrow_down,
            //         color: primaryColor,
            //         size: 20,
            //       ),
            //       value: residentaldropdownvalue??religionController.residentalstatusData.value.data?.first,
            //       style: black13RegularTextStyle,
            //       onChanged: (newValue) {
            //         setState(() {
            //           residentaldropdownvalue = newValue as ResidentalStatusData;
            //           savePersonalDetailController.residencialController.text = newValue.rsTitle??"";
            //         });
            //       },
            //       items: religionController.residentalstatusData.value.data?.map((list) {
            //         return DropdownMenuItem<ResidentalStatusData>(
            //           child: Text(list.rsTitle.toString()),
            //           value: list,
            //         );
            //       },
            //       ).toList(),
            //     ),
            //   ),
            // ),
            heightSpace,
            heightSpace,
            Text(
              'Immigrate Different Country',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Immigrate Different Country',
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: immigratestatus,
                  style: black13RegularTextStyle,
                  onChanged: (String? newValue) {
                    setState(() {
                      immigratestatus = newValue;
                      savePersonalDetailController.immigratecountryController.text = newValue!;
                    });
                  },
                  items: <String>[
                    'yes',
                    'no',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Living with family',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Living with family',
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: livingstatus,
                  style: black13RegularTextStyle,
                  onChanged: (String? newValue) {
                    setState(() {
                      livingstatus = newValue;
                      savePersonalDetailController.livingwithfamilyController.text = newValue!;
                    });
                  },
                  items: <String>[
                    'yes',
                    'no',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Diet',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<DietData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Please Select",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: dietdropdownvalue,
    //??religionController.dietData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      dietdropdownvalue = newValue as DietData;
                      savePersonalDetailController.dietController.text = newValue.id??"${religionController.dietData.value.data?.first.id}";
                    });
                  },
                  items: religionController.dietData.value.data?.map((list) {
                    return DropdownMenuItem<DietData>(
                      child: Text(list.dTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Smoke',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<SmokeData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Please Select",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: smokedropdownvalue,
                      //??religionController.smokedata.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      smokedropdownvalue = newValue as SmokeData;
                      savePersonalDetailController.smokeController.text = newValue.id??"${religionController.smokedata.value.data?.first.id}";
                    });
                  },
                  items: religionController.smokedata.value.data?.map((list) {
                    return DropdownMenuItem<SmokeData>(
                      child: Text(list.sTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Drink',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<DrinkData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Please Select',
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: drinkdropdownvalue,
                      //??religionController.drinkData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      drinkdropdownvalue = newValue as DrinkData;
                      savePersonalDetailController.drinkController.text = newValue.id??"${religionController.drinkData.value.data?.first.id}";
                    });
                  },
                  items: religionController.drinkData.value.data?.map((list) {
                    return DropdownMenuItem<DrinkData>(
                      child: Text(list.dTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Specially Able',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<SpecialyAbleData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Specially Able",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: speciallyabledropdown,
                  //??religionController.residentalstatusData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      speciallyabledropdown = newValue as SpecialyAbleData;
                      savePersonalDetailController.speciallyableController.text = newValue.id??"";
                    });
                  },
                  items: religionController.speciallyalbedata.value.data?.map((list) {
                    return DropdownMenuItem<SpecialyAbleData>(
                      child: Text(list.saTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            if(savePersonalDetailController.speciallyableController.text == "yes")...{
              Text(
                'Specially Able Description',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.abledesController,
                  cursorColor: primaryColor,
                  style: black13MediumTextStyle,
                  decoration: const InputDecoration(
                    hintText: "Specially able description",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              SizedBox(height: Get.height*0.015,),
              heightSpace,
              heightSpace,
            }else...{
              Container()
            },
            Text(
              'Tentative Time',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<TenativeTimeData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Please Select Tenative Time',
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: tenativedropdownvalue,
                      //??religionController.tenativetimedata.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      tenativedropdownvalue = newValue as TenativeTimeData;
                      savePersonalDetailController.tentativetimeController.text = newValue.id??"${religionController.tenativetimedata.value.data?.first.id}";
                    });
                  },
                  items: religionController.tenativetimedata.value.data?.map((list) {
                    return DropdownMenuItem<TenativeTimeData>(
                      child: Text(list.tiTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Annual Income',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<AnnualIncomeData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Select Annual Income",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: annualincomedropdown,
                      //??religionController.familyincomedata.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      annualincomedropdown = newValue as AnnualIncomeData;
                      savePersonalDetailController.annualincomeController.text = newValue.id??"";
                    });
                  },
                  items: religionController.annualincomedata.value.data?.map((list) {
                    return DropdownMenuItem<AnnualIncomeData>(
                      child: Text(list.aiTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            Text(
              'Body Type',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<BodyTypeData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Please Select Body Type',
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: bodydropdownvalue,
                      //??religionController.bodytypeData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      bodydropdownvalue = newValue as BodyTypeData;
                      savePersonalDetailController.bodytypeController.text = newValue.id??"${religionController.bodytypeData.value.data?.first.id}";
                    });
                  },
                  items: religionController.bodytypeData.value.data?.map((list) {
                    return DropdownMenuItem<BodyTypeData>(
                      child: Text(list.btTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            InkWell(
              onTap: (){
                if (_formKeyPersonal.currentState!.validate()){
                  savePersonalDetailController.savepersonaldetail(refresh: true,
                      userid: widget.usersid,
                      profilefor: widget.profilefor,
                      rel:religionController.religionData.value.data?.first.id,
                      resident:religionController.residentalstatusData.value.data?.first.id,
                      diet:religionController.dietData.value.data?.first.id,
                      somke:religionController.smokedata.value.data?.first.id,
                      drink:religionController.drinkData.value.data?.first.id,
                      annualin:religionController.familyincomedata.value.data?.first.id,
                      bodytype:religionController.bodytypeData.value.data?.first.id)
                      .whenComplete(() {
                    savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                  });
                  setState(() {});
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

  educationInfo(){
    return Obx(()=>
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Education',
                      style: black13RegularTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: educationdropdownvalue,
                        //??religionController.educationData.value.data?.first,
                    style: black13RegularTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        educationdropdownvalue = newValue as EducationData;
                        saveEducationDetailController.highereduController.text = newValue.id??"";
                        this.saveEducationDetailController.geteducationspecdata(refresh: true,
                        eduserid: newValue.id);
                      });
                    },
                    items: religionController.educationData.value.data?.map((list) {
                      return DropdownMenuItem<EducationData>(
                        child: Text(list.esTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Higher Education",
            style: black15BoldTextStyle,
          ),
          heightSpace,
          if(saveEducationDetailController.highedumasterController.text == "Professional Degree")...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: degrrdropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      degrrdropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          }else if (saveEducationDetailController.highedumasterController.text == "PHD")...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: phddropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      phddropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          }else if (saveEducationDetailController.highedumasterController.text == "Post-Graduate")...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: postdropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      postdropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          }else if (saveEducationDetailController.highedumasterController.text == "Undergraduate")...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: underdropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      underdropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          }else if (saveEducationDetailController.highedumasterController.text == "10+2 / Diploma")...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: diplomadropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      diplomadropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          } else...{
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<EducationSpecData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    'Select Higher Education', style: black14BoldTextStyle,
                  ), icon: const Icon(
                  Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                  value: degrrdropdown,
                  //??religionController.educationData.value.data?.first,
                  style: black14BoldTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      degrrdropdown = newValue as EducationSpecData;
                      saveEducationDetailController.highedumasterController.text = newValue.id??"";
                    });},
                  items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                    return DropdownMenuItem<EducationSpecData>(
                      child: Text(list.efTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
          },
          // Container(
          //   width: double.infinity,
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: fixPadding,
          //     vertical: 8,
          //   ),
          //   decoration: BoxDecoration(
          //     border: Border.all(color: greyColor),
          //     borderRadius: BorderRadius.circular(5),
          //   ),
          //   child: TextFormField(
          //     // validator: (value) {
          //     //   //validator to be added
          //     //   if (value == null || value.isEmpty) {
          //     //     return "Please enter Mother's Name";
          //     //   } else if (value.length < 2) {
          //     //     return "Length of Mother's name should be minimum 3";
          //     //   }
          //     //   return null;
          //     // },
          //     controller: saveEducationDetailController.highedumasterController,
          //     cursorColor: primaryColor,
          //     style: black13MediumTextStyle,
          //     decoration: const InputDecoration(
          //       hintText: "Enter Higher Education",
          //       isDense: true,
          //       contentPadding: EdgeInsets.zero,
          //       border: UnderlineInputBorder(borderSide: BorderSide.none),
          //     ),
          //   ),
          // ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "College Name",
            style: black15BoldTextStyle,
          ),
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
              // validator: (value) {
              //   //validator to be added
              //   if (value == null || value.isEmpty) {
              //     return "Please enter Mother's Name";
              //   } else if (value.length < 2) {
              //     return "Length of Mother's name should be minimum 3";
              //   }
              //   return null;
              // },
             controller: saveEducationDetailController.collegenameController,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: const InputDecoration(
                hintText: "Enter College name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Sector",
            style: black15BoldTextStyle,
          ),
          heightSpace,
          Container(
            width: Get.width*0.99,
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding / 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<OccupationData>(
                isExpanded: true,
                elevation: 0,
                isDense: true,
                hint: Text(
                  "Select Occupation Sector",
                  style: black13RegularTextStyle,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: primaryColor,
                  size: 20,
                ),
                value: occupationdropdownvalue,
                //??religionController.residentalstatusData.value.data?.first,
                style: black13RegularTextStyle,
                onChanged: (newValue) {
                  setState(() {
                    occupationdropdownvalue = newValue as OccupationData;
                    saveEducationDetailController.editoccupationsecController.text = newValue.id??"";
                  });
                },
                items: religionController.occupationData.value.data?.map((list) {
                  return DropdownMenuItem<OccupationData>(
                    child: Text(list.osTitle.toString()),
                    value: list,
                  );
                },
                ).toList(),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Specialization",
            style: black15BoldTextStyle,
          ),
          heightSpace,
          Container(
            width: Get.width*0.99,
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: fixPadding / 2,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<OccupationFieldData>(
                isExpanded: true,
                elevation: 0,
                isDense: true,
                hint: Text(
                  "Enter Occupation Specialization",
                  style: black13RegularTextStyle,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: primaryColor,
                  size: 20,
                ),
                value: occupationfielddropdown,
                //??religionController.residentalstatusData.value.data?.first,
                style: black13RegularTextStyle,
                onChanged: (newValue) {
                  setState(() {
                    occupationfielddropdown = newValue as OccupationFieldData;
                    saveEducationDetailController.occupationsplecController.text = newValue.id??"";
                  });
                },
                items: religionController.occupationfirlddata.value.data?.map((list) {
                  return DropdownMenuItem<OccupationFieldData>(
                    child: Text(list.ofTitle.toString()),
                    value: list,
                  );
                },
                ).toList(),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Title",
            style: black15BoldTextStyle,
          ),
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
              // validator: (value) {
              //   //validator to be added
              //   if (value == null || value.isEmpty) {
              //     return "Please enter Mother's Name";
              //   } else if (value.length < 2) {
              //     return "Length of Mother's name should be minimum 3";
              //   }
              //   return null;
              // },
              controller: saveEducationDetailController.occupationtitleController,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: const InputDecoration(
                hintText: "Enter Occupation Title",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Company Name",
            style: black15BoldTextStyle,
          ),
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
              // validator: (value) {
              //   //validator to be added
              //   if (value == null || value.isEmpty) {
              //     return "Please enter Mother's Name";
              //   } else if (value.length < 2) {
              //     return "Length of Mother's name should be minimum 3";
              //   }
              //   return null;
              // },
              controller: saveEducationDetailController.organisationnameController,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: const InputDecoration(
                hintText: "Enter Company Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Position in Company",
            style: black15BoldTextStyle,
          ),
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
              // validator: (value) {
              //   //validator to be added
              //   if (value == null || value.isEmpty) {
              //     return "Please enter Mother's Name";
              //   } else if (value.length < 2) {
              //     return "Length of Mother's name should be minimum 3";
              //   }
              //   return null;
              // },
              controller: saveEducationDetailController.workdesignationController,
              cursorColor: primaryColor,
              style: black13MediumTextStyle,
              decoration: const InputDecoration(
                hintText: "Position in Company",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: (){
              saveEducationDetailController.saveeducationaldetail(refresh: true,
                  userid:  widget.usersid)
                  .whenComplete(() {
                savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
              });
              setState(() {});
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
          heightSpace,
        ],
      ),
    );
  }

  kycInfo(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'AdharCard Front Image',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        InkWell(
          onTap: (){
            getImage().whenComplete(() => setState(() {}));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child:  SizedBox(
              width: Get.width*0.6,
              child: imageFile != null
                ? Image.file(imageFile!)
                  : Text("Upload AdharCard Front Image",
              style: black13MediumTextStyle,)

              // Text(imageFile != null
              //     ? imageFile!.path.toString()
              //     : 'Upload AdharCard Front Image',
              //   overflow: TextOverflow.ellipsis,
              //   style: black13MediumTextStyle,),
            ),
          ),
        ),

        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'AdharCard Back Image',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        InkWell(
          onTap: (){
            getaharbackImage().whenComplete(() => setState(() {}));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child:  SizedBox(
                width: Get.width*0.6,
                child: backimageFile != null
                    ? Image.file(backimageFile!)
                    : Text("Upload AdharCard Back Image",
                  style: black13MediumTextStyle,)

              // Text(imageFile != null
              //     ? imageFile!.path.toString()
              //     : 'Upload AdharCard Front Image',
              //   overflow: TextOverflow.ellipsis,
              //   style: black13MediumTextStyle,),
            ),
          ),
        ),


        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'PanCard Image',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        InkWell(
          onTap: (){
            getpancardImage().whenComplete(() => setState(() {}));
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: greyColor),
              borderRadius: BorderRadius.circular(5),
            ),
            child:  SizedBox(
                width: Get.width*0.6,
                child: panimageFile != null
                    ? Image.file(panimageFile!)
                    : Text("Upload PanCard Image",
                  style: black13MediumTextStyle,)

              // Text(imageFile != null
              //     ? imageFile!.path.toString()
              //     : 'Upload AdharCard Front Image',
              //   overflow: TextOverflow.ellipsis,
              //   style: black13MediumTextStyle,),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        InkWell(
          onTap: (){
            userKycController.saveuserkycdetail(refresh: true,
                afrontimage : imageFile,
                abackimage: backimageFile,
                userid: widget.usersid,
                panimage: panimageFile);
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
        heightSpace,
      ],
    );
  }

  genderDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: MediaQuery.of(context).size.width / 2 - 27.5,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Gender',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: gender,
              style: black13RegularTextStyle,
              onChanged: (String? newValue) {
                setState(() {
                  gender = newValue;
                  savePersonalDetailController.genderController.text = newValue!;
                });
              },
              items: <String>[
                'Male',
                'Female',
                'Other',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  heightDropDown() {
    return ;
  }

  dobDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Date of Birth',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: MediaQuery.of(context).size.width - 55,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 22,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextFormField(
            //textAlign: TextAlign.start,
              controller: savePersonalDetailController.dobController,
                 style: black15BoldTextStyle,//editing controller of this TextField
              decoration:  InputDecoration(
                hintText: "Please Choose Date of Birth",
                isDense: true,
                hintStyle: black15BoldTextStyle,
                //contentPadding: EdgeInsets.only(top: Get.height*0.02),
                border: InputBorder.none,
              ),
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate:DateTime(1988), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2500)
                );
                if(pickedDate != null ){
                  print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need
                      savePersonalDetailController.dobController.text = formattedDate;
                }else{
                  DateTime.now();
                }
              }
          )


          // Container(
          //   height: 100,
          //   child: CupertinoDatePicker(
          //     mode: CupertinoDatePickerMode.date,
          //     maximumYear: 2090,
          //     initialDateTime: DateTime.now(),
          //     onDateTimeChanged: (DateTime newDateTime) {
          //       if(DateTime != null ){
          //         print(DateTime);  //get the picked date in the format => 2022-07-04 00:00:00.000
          //         String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime); // format date in required form here we use yyyy-MM-dd that means time is removed
          //         print(formattedDate); //formatted date output using intl package =>  2022-07-04
          //         //You can format date as per your need
          //         dob = newDateTime;
          //         savePersonalDetailController.dobController.text = formattedDate;
          //       }else{
          //         DateTime.now();
          //       }
          //       setState(() {
          //         dob = newDateTime;
          //        // savePersonalDetailController.dobController.text = formattedDate;
          //       });
          //     },
          //   ),
          // ),
        ),
      ],
    );
  }

  statusDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Maritial Status',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Maritial Status',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: martialstatus,
              style: black13RegularTextStyle,
              onChanged: (String? newValue) {
                setState(() {
                  martialstatus = newValue;
                  savePersonalDetailController.maritialstatusController.text = newValue!;
                });
              },
              items: <String>[
                'Unmarried',
                'Divorced',
                'Widower',
                'Annulled',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  religionDropdown() {
    return ;
  }

  patnerPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        const SizedBox(height: 3),
        Text(
          'Age',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: grey13SemiBoldTextStyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          GlobalConstants().selectAge,
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: ageFrom,
                        style: black13RegularTextStyle,
                        onChanged: (String? newValue) {
                          setState(() {
                            ageFrom = newValue;
                            partnerPreferenceController.agefromController.text = newValue!;
                          });
                        },
                        items: <String>[
                          '18',
                          '19',
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31',
                          '32',
                          '33',
                          '34',
                          '35',
                          '36',
                          '37',
                          '38',
                          '39',
                          '40',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalConstants().selectAge,
                      style: grey13SemiBoldTextStyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          'to',
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                        ),
                        value: ageTo,
                        style: black13RegularTextStyle,
                        onChanged: (String? newValue) {
                          setState(() {
                            ageTo = newValue;
                            partnerPreferenceController.agetoController.text = newValue!;
                          });
                        },
                        items: <String>[
                          '18',
                          '19',
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31',
                          '32',
                          '33',
                          '34',
                          '35',
                          '36',
                          '37',
                          '38',
                          '39',
                          '40',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // heightSpace,
        // heightSpace,
        // preferenceHeight(),
        heightSpace,
        heightSpace,
        Text(
          'Education',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<EducationData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Education',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: educationdropdownvalue,
                  //??religionController.educationData.value.data?.first,
              style: black13RegularTextStyle,
              onChanged: (newValue) {
                setState(() {
                  educationdropdownvalue = newValue as EducationData;
                  partnerPreferenceController.educationController.text = newValue.id??"";
                });
              },
              items: religionController.educationData.value.data?.map((list) {
                return DropdownMenuItem<EducationData>(
                  child: Text(list.esTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          "Profession",
          style: black15BoldTextStyle,
        ),
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
            controller: partnerPreferenceController.professionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            decoration: const InputDecoration(
              hintText: "Enter Profession",
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Religion',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Datum>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Religion',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: dropdownvalue,
                  //??religionController.religionData.value.data?.first,
              //selectedreligion,
              style: black13RegularTextStyle,
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue as Datum;
                  partnerPreferenceController.religionController.text = newValue.id??"";
                });
              },
              items: religionController.religionData.value.data?.map((list) {
                return DropdownMenuItem<Datum>(
                  child: Text(list.rTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Caste',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Caste',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: selectedCaste,
              style: black13RegularTextStyle,
              onChanged: (newValue) {
                setState(() {
                  selectedCaste = newValue as String?;
                  partnerPreferenceController.casteController.text = newValue!;
                });
              },
              items: <String>[
                'Brahmin',
                'Jain',
                'Sikh',
                'Kayasth',
                'Banias',
                'Punjabi Khatri',
                'Sindhi',
              ].map<DropdownMenuItem<String>>((list) {
                return DropdownMenuItem(
                  child: Text(list),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,Text(
          'Marital',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Maritial Status',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: status,
              style: black13RegularTextStyle,
              onChanged: (String? newValue) {
                setState(() {
                  status = newValue;
                  partnerPreferenceController.maritalstatusController.text = newValue!;
                });
              },
              items: <String>[
                'Unmarried',
                'Divorced',
                'Widower',
                'Annulled',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Residential Status',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ResidentalStatusData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Residential Status',
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: residentaldropdownvalue,
                  //??religionController.residentalstatusData.value.data?.first,
              style: black13RegularTextStyle,
              onChanged: (newValue) {
                setState(() {
                  residentaldropdownvalue = newValue as ResidentalStatusData;
                  partnerPreferenceController.residencialController.text = newValue.id??"";
                });
              },
              items: religionController.residentalstatusData.value.data?.map((list) {
                return DropdownMenuItem<ResidentalStatusData>(
                  child: Text(list.rsTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Income',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FamilyIncomeData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                "Select  Income",
                style: black13RegularTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: familyincomedropdownvalue,
                  //??religionController.familyincomedata.value.data?.first,
              style: black13RegularTextStyle,
              onChanged: (newValue) {
                setState(() {
                  familyincomedropdownvalue = newValue as FamilyIncomeData;
                  partnerPreferenceController.incomeController.text = newValue.id??"";
                });
              },
              items: religionController.familyincomedata.value.data?.map((list) {
                return DropdownMenuItem<FamilyIncomeData>(
                  child: Text(list.fiTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        proceedButton(context, () {
          partnerPreferenceController.savepartnerpreferncedetail(refresh: true,
              userid: widget.usersid,
          educat:religionController.educationData.value.data?.first.id,
          reli:religionController.religionData.value.data?.first.id,
          residet:religionController.residentalstatusData.value.data?.first.id,
          pincome:religionController.familyincomedata.value.data?.first.id,)
              .whenComplete(() {
            savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
          });
          setState(() {});
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomeTabsScreen()),
          // );
        }),
        heightSpace,
        heightSpace,
      ],
    );
  }

  proceedButton(context, Function()? fn) {
    return InkWell(
      onTap: fn,
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
    );
  }

  void _nullmanagement() {
    selectedCity = null;
    selectedState = null;
  }

  void _nullmanagementstate() {
    selectedCity = null;

    print("this is working ");
  }

// edit
  editpersonalDetails() {
    return Form(
      key: _formKeyeditPersonal,
      child: Obx(()=>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
              Text(
                'First Name',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.editnameController,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly: true,
                  decoration:  InputDecoration(
                    hintText: "${widget.firstname}",
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Middle Name',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.editmiddlenameController,
                  cursorColor: primaryColor,
                  readOnly: true,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: "${widget.middlename}",
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Last Name',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.editlastnameController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: "${widget.lastname}",
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Religion',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Datum>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Religion',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: dropdownvalue,
                        //??religionController.religionData.value.data?.first,
                    //selectedreligion,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        dropdownvalue = newValue as Datum;
                        savePersonalDetailController.editreligionController.text = newValue.id??"";
                        savePersonalDetailController.editreligionsController.text = newValue.rTitle??"";
                        this.savePersonalDetailController.editcasteController.clear();
                      });
                      setState(() {});
                      this.religionController.getcastedata(refresh: true, religioid: newValue?.id);
                    },
                    items: religionController.religionData.value.data?.map((list) {
                      return DropdownMenuItem<Datum>(
                        child: Text(list.rTitle??'Select Religion'),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              if(savePersonalDetailController.editreligionsController.text == "Hindu" || savePersonalDetailController.editreligionsController.text == "Jain" ||
                  savePersonalDetailController.editreligionsController.text == "Sikh" || savePersonalDetailController.editreligionsController.text == "Christian")...{
                Text(
                  'Caste',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                if(savePersonalDetailController.editreligionsController.text == "Hindu")...{
                  Obx(()=>Container(
                    width: Get.width*0.99,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CastData>(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          "Select Caste",
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: castedropdown,
                        //??religionController.residentalstatusData.value.data?.first,
                        style: black14BoldTextStyle,
                        onChanged: (newValue) {
                          setState(() {
                            castedropdown = newValue as CastData;
                            savePersonalDetailController.editcasteController.text = newValue.id??"";
                          });
                        },
                        items: religionController.castedata.value.data?.map((list) {
                          return DropdownMenuItem<CastData>(
                            child: Text(list.cTitle.toString()),
                            value: list,
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ),),
                }else if(savePersonalDetailController.editreligionsController.text == "Jain")...{
                  Obx(()=>Container(
                    width: Get.width*0.99,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CastData>(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          "Select Caste",
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: jaincastedropdown,
                        //??religionController.residentalstatusData.value.data?.first,
                        style: black14BoldTextStyle,
                        onChanged: (newValue) {
                          setState(() {
                            jaincastedropdown = newValue as CastData;
                            savePersonalDetailController.editcasteController.text = newValue.id??"";
                          });
                        },
                        items: religionController.castedata.value.data?.map((list) {
                          return DropdownMenuItem<CastData>(
                            child: Text(list.cTitle.toString()),
                            value: list,
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ),),
                }else if(savePersonalDetailController.editreligionsController.text == "Sikh")...{
                  Obx(()=>Container(
                    width: Get.width*0.99,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CastData>(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          "Select Caste",
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: sikhcastedropdown,
                        //??religionController.residentalstatusData.value.data?.first,
                        style: black14BoldTextStyle,
                        onChanged: (newValue) {
                          setState(() {
                            sikhcastedropdown = newValue as CastData;
                            savePersonalDetailController.editcasteController.text = newValue.id??"";
                          });
                        },
                        items: religionController.castedata.value.data?.map((list) {
                          return DropdownMenuItem<CastData>(
                            child: Text(list.cTitle.toString()),
                            value: list,
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ),),
                }else if(savePersonalDetailController.editreligionsController.text == "Christian")...{
                  Obx(()=>Container(
                    width: Get.width*0.99,
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<CastData>(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          "Select Caste",
                          style: black13RegularTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: christaincastedropdown,
                        //??religionController.residentalstatusData.value.data?.first,
                        style: black14BoldTextStyle,
                        onChanged: (newValue) {
                          setState(() {
                            christaincastedropdown = newValue as CastData;
                            savePersonalDetailController.editcasteController.text = newValue.id??"";
                          });
                        },
                        items: religionController.castedata.value.data?.map((list) {
                          return DropdownMenuItem<CastData>(
                            child: Text(list.cTitle.toString()),
                            value: list,
                          );
                        },
                        ).toList(),
                      ),
                    ),
                  ),),
                },
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.01,)
              }else...{
                Container()
              },
              if(savePersonalDetailController.editreligionsController.text == "Muslim" && widget.genderdaat == "Male")...{
                Text(
                  'Dhadhi',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: dhadhistatus,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          dhadhistatus = newValue as String?;
                          //savePersonalDetailController.casteController.text = newValue!;
                        });
                      },
                      items: [
                        'Yes',
                        'No',
                        'Occasionally',
                      ]
                          .map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem(
                          child: Text(list),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,),
                Text(
                  'Namaz',
                  style: black15BoldTextStyle,
                ),
                SizedBox(height: Get.height*0.009,),
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: namazstatus,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          namazstatus = newValue as String?;
                          //savePersonalDetailController.casteController.text = newValue!;
                        });
                      },
                      items: [
                        '5 times a day',
                        'Once a day',
                        'Occasionally',
                        'Never',
                      ]
                          .map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem(
                          child: Text(list),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,)
              }else...{
                Container()
              },
              if(savePersonalDetailController.editreligionsController.text == "Muslim" && widget.genderdaat== "Female")...{
                Text(
                  'Hijab ',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: hIjabstatus,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          hIjabstatus = newValue as String?;
                          //savePersonalDetailController.casteController.text = newValue!;
                        });
                      },
                      items: [
                        'Always',
                        'Never',
                        'Occasionally',
                      ]
                          .map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem(
                          child: Text(list),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,),
                Text(
                  'Nakab',
                  style: black15BoldTextStyle,
                ),
                SizedBox(height: Get.height*0.009,),
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: nakabstatus,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          nakabstatus = newValue as String?;
                          //savePersonalDetailController.casteController.text = newValue!;
                        });
                      },
                      items: [
                        'Always',
                        'Never',
                        'Occasionally',
                      ]
                          .map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem(
                          child: Text(list),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,)
              }else...{
                Container()
              },

              if(savePersonalDetailController.editreligionsController.text == "Sikh" && widget.genderdaat == "Male")...{
                Text(
                  'Amritdhari ',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: amritdharistatus,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          amritdharistatus = newValue as String?;
                          //savePersonalDetailController.casteController.text = newValue!;
                        });
                      },
                      items: [
                        'Yes',
                        'No',
                      ]
                          .map<DropdownMenuItem<String>>((list) {
                        return DropdownMenuItem(
                          child: Text(list),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,),
              }else...{
                Container()
              },

              Text(
                'Profile Create For ',
                style: black15BoldTextStyle,
              ),
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
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter Name';
                  //   } else if (value.length < 2) {
                  //     return 'Length of name should be minimum 3';
                  //   }
                  //   return null;
                  // },
                  controller: savePersonalDetailController.editprofileforController,
                  cursorColor: primaryColor,
                  readOnly: true,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: savePersonalDetailController.editprofileforController.text == "" ?"${widget.profilefor}": widget.profilefor,
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              // Container(
              //   width: double.infinity,
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: fixPadding,
              //     vertical: 8,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: greyColor),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton(
              //       isExpanded: true,
              //       elevation: 0,
              //       isDense: true,
              //       hint: Text(
              //         'Profile create for',
              //         style: black13RegularTextStyle,
              //       ),
              //       icon: const Icon(
              //         Icons.keyboard_arrow_down,
              //         color: primaryColor,
              //         size: 20,
              //       ),
              //       value: profilestatus,
              //       style: black13RegularTextStyle,
              //       onChanged: (String? newValue) {
              //         setState(() {
              //           profilestatus = newValue;
              //           savePersonalDetailController.profileforController.text = newValue!;
              //         });
              //       },
              //       items: <String>[
              //         'My Self',
              //         'My Brother',
              //         'My Sister',
              //         'My Son',
              //         'My daughter',
              //         'Friend',
              //       ].map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
              heightSpace,
              heightSpace,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     ageDropdown(),
              //     widthSpace,
              //     widthSpace,
              //     widthSpace,
              //     genderDropdown(),
              //   ],
              // ),
              // heightSpace,
              // heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Height',
                          style: black15BoldTextStyle,
                        ),
                        heightSpace,
                        Container(
                          width: Get.width*0.99,
                          padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding,
                            vertical: fixPadding / 2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: greyColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<HeightData>(
                              isExpanded: true,
                              elevation: 0,
                              isDense: true,
                              hint: Text(
                                "Select Height",
                                style: black13RegularTextStyle,
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: primaryColor,
                                size: 20,
                              ),
                              value: heightdropdown,
                              //??religionController.residentalstatusData.value.data?.first,
                              style: black13RegularTextStyle,
                              onChanged: (newValue) {
                                setState(() {
                                  heightdropdown = newValue as HeightData;
                                  savePersonalDetailController.editheightController.text = newValue.id??"";
                                });
                              },
                              items: religionController.heightdata.value.data?.map((list) {
                                return DropdownMenuItem<HeightData>(
                                  child: Text(list.hTitle.toString()),
                                  value: list,
                                );
                              },
                              ).toList(),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: black15BoldTextStyle,
                      ),
                      heightSpace,
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 27.5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding,
                          vertical: fixPadding / 2,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: greyColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2 - 27.5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: fixPadding,
                            vertical: fixPadding / 1.3,
                          ),
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: greyColor),
                          //   borderRadius: BorderRadius.circular(5),
                          // ),
                          child: TextFormField(
                            cursorColor: primaryColor,
                            readOnly: true,
                            style: black13MediumTextStyle,
                            decoration:  InputDecoration(
                              hintText: savePersonalDetailController.editgenderController.text = widget.genderdaat??"",
                              hintStyle: black13MediumTextStyle,
                              //hintText: "Enter Name",
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: UnderlineInputBorder(borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // weightDropdown(),
                ],
              ),
              heightSpace,
              heightSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date of Birth',
                    style: black15BoldTextStyle,
                  ),
                  heightSpace,
                  Container(
                      width: MediaQuery.of(context).size.width - 55,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 22,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextFormField(
                        //textAlign: TextAlign.start,
                          controller: savePersonalDetailController.editdobController,
                          style: black14BoldTextStyle,//editing controller of this TextField
                          decoration:  InputDecoration(
                            hintText: "Please Choose Date of Birth",
                            isDense: true,
                            hintStyle: black14BoldTextStyle,
                            //contentPadding: EdgeInsets.only(top: Get.height*0.02),
                            border: InputBorder.none,
                          ),
                          readOnly: true,  // when true user cannot edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(), //get today's date
                                firstDate:DateTime(1988), //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2500)
                            );
                            if(pickedDate != null ){
                              print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                              print(formattedDate); //formatted date output using intl package =>  2022-07-04
                              //You can format date as per your need
                              savePersonalDetailController.editdobController.text = formattedDate;
                            }else{
                              DateTime.now();
                            }
                          }
                      )
                  ),
                ],
              ),
              heightSpace,
              heightSpace,
              if(savePersonalDetailController.editreligionsController.text == "Hindu" || savePersonalDetailController.editreligionsController.text == "Jain" ||
                  savePersonalDetailController.editreligionsController.text == "Sikh")...{
                Text(
                  'Time of Birth',
                  style: black15BoldTextStyle,
                ),
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
                    controller: savePersonalDetailController.edittobController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Time of birth",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                    readOnly: true,
                    onTap: ()async{
                      TimeOfDay? timeRecord = await showTimePicker(
                        context: context,
                        initialTime: times.replacing(hour: times.hourOfPeriod),
                        builder: (BuildContext context, Widget? child) {
                          return MediaQuery(
                            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                            child: child!,
                          );
                        },
                      );
                      if (timeRecord != null) {
                        setState(() {
                          var df = DateFormat("h:mm a");
                          var dt = df.parse(timeRecord.format(context));
                          var finaltime =  DateFormat('HH:mm a').format(dt);
                          var selectedTime = DateFormat('HH:mm a').format(dt);

                          print(finaltime);
                          setState(() {
                            selectedTime = finaltime;
                            selectedTime = timeRecord.format(context);
                          });
                          savePersonalDetailController.edittobController.text = selectedTime;
                          print(selectedTime);
                        });}
                    },
                  ),
                ),
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.01,),
                Text(
                  'Manglik',
                  style: black15BoldTextStyle,
                ),
                SizedBox(height: Get.height*0.009,),
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
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Please Select',
                        style: black14BoldTextStyle,
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: primaryColor,
                        size: 20,
                      ),
                      value: manglikstatus,
                      style: black14BoldTextStyle,
                      onChanged: (String? newValue) {
                        setState(() {
                          manglikstatus = newValue;
                          // savePersonalDetailController.profileforController.text = newValue!;
                        });
                      },
                      items: <String>[
                        'yes',
                        'no',
                        'dont know',
                        'doesnot matter',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.01,)
              }else...{
                Container()
              },
              if(savePersonalDetailController.editreligionsController.text == "Hindu" || savePersonalDetailController.editreligionsController.text == "Jain" ||
                  savePersonalDetailController.editreligionsController.text == "Sikh")...{
                Text(
                  'Place of Birth',
                  style: black15BoldTextStyle,
                ),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Name';
                    //   } else if (value.length < 2) {
                    //     return 'Length of name should be minimum 3';
                    //   }
                    //   return null;
                    // },
                    controller: savePersonalDetailController.editbirthplaceController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Please enter place of birth",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.01,),
                heightSpace,
                heightSpace,
              }else...{
                Container()
              },

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maritial Status',
                    style: black15BoldTextStyle,
                  ),
                  heightSpace,
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: fixPadding / 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyColor),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          'Select Maritial Status',
                          style: black14BoldTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: martialstatus,
                        style: black14BoldTextStyle,
                        onChanged: (String? newValue) {
                          setState(() {
                            martialstatus = newValue;
                            savePersonalDetailController.editmaritialstatusController.text = newValue!;
                          });
                        },
                        items: <String>[
                          'Unmarried',
                          'Divorced',
                          'Widower',
                          'Annulled',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
              heightSpace,
              heightSpace,
              if(savePersonalDetailController.editmaritialstatusController.text == "Divorced" )...{
                Text(
                  'No. of Child',
                  style: black15BoldTextStyle,
                ),
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
                        return 'Please enter no. of child';
                      }
                      return null;
                    },
                    controller: savePersonalDetailController.editnoofchildController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Child",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.02,),
                // heightSpace,
                Text(
                  'No. of Child living with you',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                SizedBox(height: Get.height*0.01,),
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
                        return "Please enter no. of living with you";
                      } else {
                        int tempVal = int.parse(value ?? "0");
                        int maxmark = int.parse(savePersonalDetailController.editnoofchildController.text ?? "0");
                        if (tempVal <= maxmark) {
                          return null;
                        }else {
                          setState(() {});
                          return "Please enter correct no.";
                        }
                      }
                    },
                    controller: savePersonalDetailController.editchildlivewithController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Child living with you",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.02,),
              }else if(savePersonalDetailController.editmaritialstatusController.text == "Widower" )...{
                Text(
                  'No. of Child',
                  style: black15BoldTextStyle,
                ),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Name';
                    //   } else if (value.length < 2) {
                    //     return 'Length of name should be minimum 3';
                    //   }
                    //   return null;
                    // },
                    controller: savePersonalDetailController.editnoofchildController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Child",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.02,),
                // heightSpace,
                Text(
                  'No. of Child living with you',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                SizedBox(height: Get.height*0.01,),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Name';
                    //   } else if (value.length < 2) {
                    //     return 'Length of name should be minimum 3';
                    //   }
                    //   return null;
                    // },
                    controller: savePersonalDetailController.editchildlivewithController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "No. of Child living with you",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                heightSpace,
                heightSpace,
                heightSpace,
                SizedBox(height: Get.height*0.02,),
              }else...{
                Container()
              },
              Text(
                'Residential Status',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ResidentalStatusData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      "Residentail Status",
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: residentaldropdownvalue,
                        //??religionController.residentalstatusData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        residentaldropdownvalue = newValue as ResidentalStatusData;
                        savePersonalDetailController.editresidencialController.text = newValue.id??"${religionController.residentalstatusData.value.data?.first.id}";
                      });
                    },
                    items: religionController.residentalstatusData.value.data?.map((list) {
                      return DropdownMenuItem<ResidentalStatusData>(
                        child: Text(list.rsTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              // Container(
              //   width: Get.width*0.99,
              //   padding: const EdgeInsets.symmetric(
              //     horizontal: fixPadding,
              //     vertical: fixPadding / 2,
              //   ),
              //   decoration: BoxDecoration(
              //     border: Border.all(color: greyColor),
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   child: DropdownButtonHideUnderline(
              //     child: DropdownButton<ResidentalStatusData>(
              //       isExpanded: true,
              //       elevation: 0,
              //       isDense: true,
              //       hint: Text(
              //         'Residential Status',
              //         style: black13RegularTextStyle,
              //       ),
              //       icon: const Icon(
              //         Icons.keyboard_arrow_down,
              //         color: primaryColor,
              //         size: 20,
              //       ),
              //       value: residentaldropdownvalue??religionController.residentalstatusData.value.data?.first,
              //       style: black13RegularTextStyle,
              //       onChanged: (newValue) {
              //         setState(() {
              //           residentaldropdownvalue = newValue as ResidentalStatusData;
              //           savePersonalDetailController.residencialController.text = newValue.rsTitle??"";
              //         });
              //       },
              //       items: religionController.residentalstatusData.value.data?.map((list) {
              //         return DropdownMenuItem<ResidentalStatusData>(
              //           child: Text(list.rsTitle.toString()),
              //           value: list,
              //         );
              //       },
              //       ).toList(),
              //     ),
              //   ),
              // ),
              heightSpace,
              heightSpace,
              Text(
                'Immigrate Different Country',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Immigrate Different Country',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: immigratestatus,
                    style: black14BoldTextStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        immigratestatus = newValue;
                        savePersonalDetailController.editimmigratecountryController.text = newValue!;
                      });
                    },
                    items: <String>[
                      'yes',
                      'no',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Living with family',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Living with family',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: livingstatus,
                    style: black14BoldTextStyle,
                    onChanged: (String? newValue) {
                      setState(() {
                        livingstatus = newValue;
                        savePersonalDetailController.editlivingwithfamilyController.text = newValue!;
                      });
                    },
                    items: <String>[
                      'yes',
                      'no',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Diet',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<DietData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      "Select Diet",
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: dietdropdownvalue,
                        //??religionController.dietData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        dietdropdownvalue = newValue as DietData;
                        savePersonalDetailController.editdietController.text = newValue.id??"${religionController.dietData.value.data?.first.id}";
                      });
                    },
                    items: religionController.dietData.value.data?.map((list) {
                      return DropdownMenuItem<DietData>(
                        child: Text(list.dTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Smoke',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<SmokeData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      "Select Smoke",
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: smokedropdownvalue,
                    //??religionController.smokedata.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        smokedropdownvalue = newValue as SmokeData;
                        savePersonalDetailController.editsmokeController.text = newValue.id??"${religionController.smokedata.value.data?.first.id}";
                      });
                    },
                    items: religionController.smokedata.value.data?.map((list) {
                      return DropdownMenuItem<SmokeData>(
                        child: Text(list.sTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Drink',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<DrinkData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Drink',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: drinkdropdownvalue,
                    //??religionController.drinkData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        drinkdropdownvalue = newValue as DrinkData;
                        savePersonalDetailController.editdrinkController.text = newValue.id??"${religionController.drinkData.value.data?.first.id}";
                      });
                    },
                    items: religionController.drinkData.value.data?.map((list) {
                      return DropdownMenuItem<DrinkData>(
                        child: Text(list.dTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Specially Able',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<SpecialyAbleData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      "Specially Able",
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: speciallyabledropdown,
                    //??religionController.dietData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        speciallyabledropdown = newValue as SpecialyAbleData;
                        savePersonalDetailController.editspeciallyableController.text = newValue.id??"";
                      });
                    },
                    items: religionController.speciallyalbedata.value.data?.map((list) {
                      return DropdownMenuItem<SpecialyAbleData>(
                        child: Text(list.saTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),

              heightSpace,
              heightSpace,
              if(savePersonalDetailController.editspeciallyableController.text == "yes")...{
                Text(
                  'Specially Able Description',
                  style: black15BoldTextStyle,
                ),
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
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Name';
                    //   } else if (value.length < 2) {
                    //     return 'Length of name should be minimum 3';
                    //   }
                    //   return null;
                    // },
                    controller: savePersonalDetailController.editabledesController,
                    cursorColor: primaryColor,
                    style: black14BoldTextStyle,
                    decoration: const InputDecoration(
                      hintText: "Specially able description",
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: UnderlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                SizedBox(height: Get.height*0.015,),
                heightSpace,
                heightSpace,
              }else...{
                Container()
              },
              Text(
                'Tentative Time',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<TenativeTimeData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Please Select Tenative Time',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: tenativedropdownvalue,
                        //??religionController.tenativetimedata.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        tenativedropdownvalue = newValue as TenativeTimeData;
                        savePersonalDetailController.edittentativetimeController.text = newValue.id??"${religionController.tenativetimedata.value.data?.first.id}";
                      });
                    },
                    items: religionController.tenativetimedata.value.data?.map((list) {
                      return DropdownMenuItem<TenativeTimeData>(
                        child: Text(list.tiTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Annual Income',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<AnnualIncomeData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      "Select Annual Income",
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: annualincomedropdown,
                        //??religionController.familyincomedata.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        annualincomedropdown = newValue as AnnualIncomeData;
                        savePersonalDetailController.editannualincomeController.text = newValue.id??"${religionController.familyincomedata.value.data?.first.id}";
                      });
                    },
                    items: religionController.annualincomedata.value.data?.map((list) {
                      return DropdownMenuItem<AnnualIncomeData>(
                        child: Text(list.aiTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                'Body Type',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<BodyTypeData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Body Type',
                      style: black14BoldTextStyle,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: primaryColor,
                      size: 20,
                    ),
                    value: bodydropdownvalue,
                        //??religionController.bodytypeData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        bodydropdownvalue = newValue as BodyTypeData;
                        savePersonalDetailController.editbodytypeController.text = newValue.id??"${religionController.bodytypeData.value.data?.first.id}";
                      });
                    },
                    items: religionController.bodytypeData.value.data?.map((list) {
                      return DropdownMenuItem<BodyTypeData>(
                        child: Text(list.btTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              InkWell(
                onTap: (){
                  if (_formKeyeditPersonal.currentState!.validate()){
                    savePersonalDetailController.editpersonaldetail(refresh: true,
                        userid: widget.usersid,
                        profilefor: widget.profilefor,
                        rel:religionController.religionData.value.data?.first.id,
                        resident:religionController.residentalstatusData.value.data?.first.id,
                        diet:religionController.dietData.value.data?.first.id,
                        somke:religionController.smokedata.value.data?.first.id,
                        drink:religionController.drinkData.value.data?.first.id,
                        annualin:religionController.familyincomedata.value.data?.first.id,
                        bodytype:religionController.bodytypeData.value.data?.first.id)
                        .whenComplete(() {
                      savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                    });
                    setState(() {});
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
                    'Update'.toUpperCase(),
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

  editfamilyInfo() {
    return Obx(()=>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Form(
                key: _formKeyeditfamily,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Father's Name",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter Father's Name";
                          } else if (value.length < 2) {
                            return "Length of Father's name should be minimum 3";
                          }
                          return null;
                        },
                        controller: saveFamilyDetailController.editfathernameController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        decoration: const InputDecoration(
                          hintText: "Enter Father's Name",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Father's Occupation",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<OccupationData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Father's Occupation",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: occupationdropdownvalue,
                              //??religionController.occupationData.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              occupationdropdownvalue = newValue as OccupationData;
                              saveFamilyDetailController.editfatheroccupController.text = newValue.id??"";
                            });
                          },
                          items: religionController.occupationData.value.data?.map((list) {
                            return DropdownMenuItem<OccupationData>(
                              child: Text(list.osTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Father's Occupation Status",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<OccupationFieldData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Father's Occupation Status",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: occupationfielddropdown,
                              //??religionController.occupationData.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              occupationfielddropdown = newValue as OccupationFieldData;
                              saveFamilyDetailController.editfatheroccupstatusController.text = newValue.id??"";
                            });
                          },
                          items: religionController.occupationfirlddata.value.data?.map((list) {
                            return DropdownMenuItem<OccupationFieldData>(
                              child: Text(list.ofTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Father's Gotra",
                      style: black15BoldTextStyle,
                    ),
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Please enter Mother's Name";
                        //   } else if (value.length < 2) {
                        //     return "Length of Mother's name should be minimum 3";
                        //   }
                        //   return null;
                        // },
                        controller: saveFamilyDetailController.editfathergotraController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        decoration: const InputDecoration(
                          hintText: "Enter Father's Gotra",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // Text(
                    //   "Father's Status",
                    //   style: black15BoldTextStyle,
                    // ),
                    // heightSpace,
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: fixPadding,
                    //     vertical: 8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: greyColor),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: TextFormField(
                    //     // validator: (value) {
                    //     //   if (value == null || value.isEmpty) {
                    //     //     return "Please enter Mother's Name";
                    //     //   } else if (value.length < 2) {
                    //     //     return "Length of Mother's name should be minimum 3";
                    //     //   }
                    //     //   return null;
                    //     // },
                    //     controller: saveFamilyDetailController.editfamilystatusController,
                    //     cursorColor: primaryColor,
                    //     style: black14BoldTextStyle,
                    //     decoration: const InputDecoration(
                    //       hintText: "Enter Father's Status",
                    //       isDense: true,
                    //       contentPadding: EdgeInsets.zero,
                    //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                    //     ),
                    //   ),
                    // ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Mother's Name",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter Mother's Name";
                          } else if (value.length < 2) {
                            return "Length of Mother's name should be minimum 3";
                          }
                          return null;
                        },
                        controller: saveFamilyDetailController.editmothernameController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        decoration: const InputDecoration(
                          hintText: "Enter Mother's Name",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // Text(
                    //   "Mother's Parent Gotra",
                    //   style: black15BoldTextStyle,
                    // ),
                    // heightSpace,
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: fixPadding,
                    //     vertical: 8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: greyColor),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: TextFormField(
                    //     // validator: (value) {
                    //     //   if (value == null || value.isEmpty) {
                    //     //     return "Please enter Mother's Name";
                    //     //   } else if (value.length < 2) {
                    //     //     return "Length of Mother's name should be minimum 3";
                    //     //   }
                    //     //   return null;
                    //     // },
                    //     controller: saveFamilyDetailController.editmotherparentController,
                    //     cursorColor: primaryColor,
                    //     style: black14BoldTextStyle,
                    //     decoration: const InputDecoration(
                    //       hintText: "Enter Mother's Parent Gotra",
                    //       isDense: true,
                    //       contentPadding: EdgeInsets.zero,
                    //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                    //     ),
                    //   ),
                    // ),
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // heightSpace,
                    // Text(
                    //   "Mother's Family Gotra",
                    //   style: black15BoldTextStyle,
                    // ),
                    // heightSpace,
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: fixPadding,
                    //     vertical: 8,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     border: Border.all(color: greyColor),
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: TextFormField(
                    //     // validator: (value) {
                    //     //   if (value == null || value.isEmpty) {
                    //     //     return "Please enter Mother's Name";
                    //     //   } else if (value.length < 2) {
                    //     //     return "Length of Mother's name should be minimum 3";
                    //     //   }
                    //     //   return null;
                    //     // },
                    //     controller: saveFamilyDetailController.editmotherfamilyController,
                    //     cursorColor: primaryColor,
                    //     style: black14BoldTextStyle,
                    //     decoration: const InputDecoration(
                    //       hintText: "Enter Mother's Gotra",
                    //       isDense: true,
                    //       contentPadding: EdgeInsets.zero,
                    //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                    //     ),
                    //   ),
                    // ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Mother's Occupation",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<OccupationData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Mother's Occupation",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: motheroccupationdropdownvalue,
                          //??religionController.occupationData.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              motheroccupationdropdownvalue = newValue as OccupationData;
                              saveFamilyDetailController.editmotheroccuptionController.text = newValue.id??"";
                            });
                          },
                          items: religionController.occupationData.value.data?.map((list) {
                            return DropdownMenuItem<OccupationData>(
                              child: Text(list.osTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Mother's Occupation Status",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<OccupationFieldData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Mother's Occupation Status",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: motheroccupationfielddropdown,
                          //??religionController.occupationData.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              motheroccupationfielddropdown = newValue as OccupationFieldData;
                              saveFamilyDetailController.editmotheroccpstatusController.text = newValue.id??"";
                            });
                          },
                          items: religionController.occupationfirlddata.value.data?.map((list) {
                            return DropdownMenuItem<OccupationFieldData>(
                              child: Text(list.ofTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Mother's Gotra",
                      style: black15BoldTextStyle,
                    ),
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
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Please enter Mother's Name";
                        //   } else if (value.length < 2) {
                        //     return "Length of Mother's name should be minimum 3";
                        //   }
                        //   return null;
                        // },
                        controller: saveFamilyDetailController.editmothergotraController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        decoration: const InputDecoration(
                          hintText: "Enter Mother's Gotra",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Family Status",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<FamilyStatusData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Family Status",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: familystatusdropdownvalue,
                              //??religionController.familystatusdata.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              familystatusdropdownvalue = newValue as FamilyStatusData;
                              saveFamilyDetailController.editfamilystatusController.text = newValue.id??"";
                            });
                          },
                          items: religionController.familystatusdata.value.data?.map((list) {
                            return DropdownMenuItem<FamilyStatusData>(
                              child: Text(list.fsTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Family Value",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<FamilyValueData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Family Value",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: familyvaluedropdownvalue,
                              //??religionController.familyvaluedata.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              familyvaluedropdownvalue = newValue as FamilyValueData;
                              saveFamilyDetailController.editfamilyvalueController.text = newValue.id??"";
                            });
                          },
                          items: religionController.familyvaluedata.value.data?.map((list) {
                            return DropdownMenuItem<FamilyValueData>(
                              child: Text(list.fvTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Family type",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<FamilyTypeData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Enter Family Type",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: familytypedropdownvalue,
                              //??religionController.familytypedata.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              familytypedropdownvalue = newValue as FamilyTypeData;
                              saveFamilyDetailController.editfamilytypeController.text = newValue.id??"";
                            });
                          },
                          items: religionController.familytypedata.value.data?.map((list) {
                            return DropdownMenuItem<FamilyTypeData>(
                              child: Text(list.ftTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "Family Income",
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: Get.width*0.99,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<FamilyIncomeData>(
                          isExpanded: true,
                          elevation: 0,
                          isDense: true,
                          hint: Text(
                            "Select Family  Income",
                            style: black14BoldTextStyle,
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: primaryColor,
                            size: 20,
                          ),
                          value: familydropdownvalue,
                              //??religionController.familyincomedata.value.data?.first,
                          style: black14BoldTextStyle,
                          onChanged: (newValue) {
                            setState(() {
                              familydropdownvalue = newValue as FamilyIncomeData;
                              saveFamilyDetailController.editfamilyincomeController.text = newValue.id??"";
                            });
                          },
                          items: religionController.familyincomedata.value.data?.map((list) {
                            return DropdownMenuItem<FamilyIncomeData>(
                              child: Text(list.fiTitle.toString()),
                              value: list,
                            );
                          },
                          ).toList(),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "No. of Sister",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter No. of Sister";
                          }
                          return null;
                        },
                        controller: saveFamilyDetailController.editsisterController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "No. of Sister",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "No. of Sister married",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter no. of sister married";
                          } else {
                            int tempVal = int.parse(value ?? "0");
                            int maxmark = int.parse(saveFamilyDetailController.editsisterController.text ?? "0");
                            if (tempVal <= maxmark) {
                              return null;
                            }else {
                              setState(() {});
                              return "Sister married should be less than or equal to no.of sister";
                            }
                          }
                        },
                        controller: saveFamilyDetailController.editsistermarriedController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "No. of Sister married",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "No. of Brother",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter No. of Brother";
                          }
                          return null;
                        },
                        controller: saveFamilyDetailController.editbrotherController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "No. of Brother",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      "No. of Brother married",
                      style: black15BoldTextStyle,
                    ),
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
                            return "Please enter no. of brother married";
                          } else {
                            int tempVal = int.parse(value ?? "0");
                            int maxmark = int.parse(saveFamilyDetailController.editbrotherController.text ?? "0");
                            if (tempVal <= maxmark) {
                              return null;
                            }else {
                              setState(() {});
                              return "Brother married should be less than or equal to no.of brother";
                            }

                          }
                        },
                        controller: saveFamilyDetailController.editbrothermarriedController,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "No. of Brother married",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: (){
                        if (_formKeyeditfamily.currentState!.validate()){
                          saveFamilyDetailController.editfamilydetail(refresh: true,userid: widget.usersid,
                              focc:religionController.occupationData.value.data?.first.id,
                              foccupst:religionController.occupationData.value.data?.first.id,
                              fstatus:religionController.familystatusdata.value.data?.first.id,
                              fvalue:religionController.familyvaluedata.value.data?.first.id,
                              ftype:religionController.familytypedata.value.data?.first.id,
                              ficome:religionController.familyincomedata.value.data?.first.id)
                              .whenComplete(() {
                            savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                          });
                          setState(() {});
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
                          'Update'.toUpperCase(),
                          style: white16BoldTextStyle,
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                  ],
                ),
              ),
            )
          ],
        )
    );
  }

  editpatnerPreferences() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        const SizedBox(height: 3),
        Text(
          'Age',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: grey13SemiBoldTextStyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          GlobalConstants().selectAge,
                          style: black14BoldTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                          size: 20,
                        ),
                        value: ageFrom,
                        style: black14BoldTextStyle,
                        onChanged: (String? newValue) {
                          setState(() {
                            ageFrom = newValue;
                            partnerPreferenceController.editagefromController.text = newValue!;
                          });
                        },
                        items: <String>[
                          '18',
                          '19',
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31',
                          '32',
                          '33',
                          '34',
                          '35',
                          '36',
                          '37',
                          '38',
                          '39',
                          '40',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalConstants().selectAge,
                      style: grey13SemiBoldTextStyle,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        elevation: 0,
                        isDense: true,
                        hint: Text(
                          'to',
                          style: black14BoldTextStyle,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryColor,
                        ),
                        value: ageTo,
                        style: black14BoldTextStyle,
                        onChanged: (String? newValue) {
                          setState(() {
                            ageTo = newValue;
                            partnerPreferenceController.editagetoController.text = newValue!;
                          });
                        },
                        items: <String>[
                          '18',
                          '19',
                          '20',
                          '21',
                          '22',
                          '23',
                          '24',
                          '25',
                          '26',
                          '27',
                          '28',
                          '29',
                          '30',
                          '31',
                          '32',
                          '33',
                          '34',
                          '35',
                          '36',
                          '37',
                          '38',
                          '39',
                          '40',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // heightSpace,
        // heightSpace,
        // preferenceHeight(),
        heightSpace,
        heightSpace,
        Text(
          'Education',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<EducationData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Education',
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: educationdropdownvalue,
                  //??religionController.educationData.value.data?.first,
              style: black14BoldTextStyle,
              onChanged: (newValue) {
                setState(() {
                  educationdropdownvalue = newValue as EducationData;
                  partnerPreferenceController.editeducationController.text = newValue.id??"";
                });
              },
              items: religionController.educationData.value.data?.map((list) {
                return DropdownMenuItem<EducationData>(
                  child: Text(list.esTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          "Profession",
          style: black15BoldTextStyle,
        ),
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
            controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            decoration: const InputDecoration(
              hintText: "Enter Profession",
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Religion',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<Datum>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Religion',
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: dropdownvalue,
                  //??religionController.religionData.value.data?.first,
              //selectedreligion,
              style: black14BoldTextStyle,
              onChanged: (newValue) {
                setState(() {
                  dropdownvalue = newValue as Datum;
                  partnerPreferenceController.editreligionController.text = newValue.id??"";
                });
              },
              items: religionController.religionData.value.data?.map((list) {
                return DropdownMenuItem<Datum>(
                  child: Text(list.rTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Caste',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Caste',
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: selectedCaste,
              style: black14BoldTextStyle,
              onChanged: (newValue) {
                setState(() {
                  selectedCaste = newValue as String?;
                  partnerPreferenceController.editcasteController.text = newValue!;
                });
              },
              items: <String>[
                'Brahmin',
                'Jain',
                'Sikh',
                'Kayasth',
                'Banias',
                'Punjabi Khatri',
                'Sindhi',
              ].map<DropdownMenuItem<String>>((list) {
                return DropdownMenuItem(
                  child: Text(list),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,Text(
          'Marital',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Select Maritial Status',
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: status,
              style: black14BoldTextStyle,
              onChanged: (String? newValue) {
                setState(() {
                  status = newValue;
                  partnerPreferenceController.editmaritalstatusController.text = newValue!;
                });
              },
              items: <String>[
                'Unmarried',
                'Divorced',
                'Widower',
                'Annulled',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Residential Status',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<ResidentalStatusData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                'Residential Status',
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: residentaldropdownvalue,
                  //??religionController.residentalstatusData.value.data?.first,
              style: black14BoldTextStyle,
              onChanged: (newValue) {
                setState(() {
                  residentaldropdownvalue = newValue as ResidentalStatusData;
                  partnerPreferenceController.editresidencialController.text = newValue.id??"";
                });
              },
              items: religionController.residentalstatusData.value.data?.map((list) {
                return DropdownMenuItem<ResidentalStatusData>(
                  child: Text(list.rsTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Income',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Container(
          width: Get.width*0.99,
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding,
            vertical: fixPadding / 2,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<FamilyIncomeData>(
              isExpanded: true,
              elevation: 0,
              isDense: true,
              hint: Text(
                "Select  Income",
                style: black14BoldTextStyle,
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 20,
              ),
              value: familyincomedropdownvalue,
                  //??religionController.familyincomedata.value.data?.first,
              style: black14BoldTextStyle,
              onChanged: (newValue) {
                setState(() {
                  familyincomedropdownvalue = newValue as FamilyIncomeData;
                  partnerPreferenceController.editincomeController.text = newValue.id??"";
                });
              },
              items: religionController.familyincomedata.value.data?.map((list) {
                return DropdownMenuItem<FamilyIncomeData>(
                  child: Text(list.fiTitle.toString()),
                  value: list,
                );
              },
              ).toList(),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        InkWell(
          onTap: (){
          partnerPreferenceController.editpartnerpreferncedetail(refresh: true,
           userid: widget.usersid,
           educat:religionController.educationData.value.data?.first.id,
           reli:religionController.religionData.value.data?.first.id,
           residet:religionController.residentalstatusData.value.data?.first.id,
           pincome:religionController.familyincomedata.value.data?.first.id,)
              .whenComplete(() {
            savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
          });
          setState(() {});
        },
          child: Container(
            padding: const EdgeInsets.all(fixPadding * 1.5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Update'.toUpperCase(),
              style: white16BoldTextStyle,
            ),
          ),
        ),
        heightSpace,
        heightSpace,
      ],
    );
  }

  editeducationInfo(){
    return Obx(()=>
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightSpace,
            heightSpace,
            heightSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Education',
                  style: black15BoldTextStyle,
                ),
                heightSpace,
                Container(
                  width: Get.width*0.99,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 2,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<EducationData>(
                      isExpanded: true,
                      elevation: 0,
                      isDense: true,
                      hint: Text(
                        'Select Education', style: black14BoldTextStyle,
                      ), icon: const Icon(
                        Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                      value: educationdropdownvalue,
                      //??religionController.educationData.value.data?.first,
                      style: black14BoldTextStyle,
                      onChanged: (newValue) {
                        setState(() {
                          educationdropdownvalue = newValue as EducationData;
                          saveEducationDetailController.edithighereduController.text = newValue.id??"";
                          saveEducationDetailController.edithigheredusController.text = newValue.esTitle??"";

                        });
                        setState(() {});
                        this.saveEducationDetailController.geteducationspecdata(refresh: true,
                            eduserid: newValue?.id);
                        },
                      items: religionController.educationData.value.data?.map((list) {
                        return DropdownMenuItem<EducationData>(
                          child: Text(list.esTitle.toString()),
                          value: list,
                        );
                      },
                      ).toList(),
                    ),
                  ),
                ),
              ],
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Higher Education",
              style: black15BoldTextStyle,
            ),
            heightSpace,
            if(saveEducationDetailController.edithigheredusController.text == "Professional Degree")...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: degrrdropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        degrrdropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            }else if (saveEducationDetailController.edithigheredusController.text == "PHD")...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: phddropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        phddropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            }else if (saveEducationDetailController.edithigheredusController.text == "Post-Graduate")...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: postdropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        postdropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            }else if (saveEducationDetailController.edithigheredusController.text == "Undergraduate")...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: underdropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        underdropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            }else if (saveEducationDetailController.edithigheredusController.text == "10+2 / Diploma")...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: diplomadropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        diplomadropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            } else...{
              Container(
                width: Get.width*0.99,
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: fixPadding / 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<EducationSpecData>(
                    isExpanded: true,
                    elevation: 0,
                    isDense: true,
                    hint: Text(
                      'Select Higher Education', style: black14BoldTextStyle,
                    ), icon: const Icon(
                    Icons.keyboard_arrow_down, color: primaryColor, size: 20,),
                    value: degrrdropdown,
                    //??religionController.educationData.value.data?.first,
                    style: black14BoldTextStyle,
                    onChanged: (newValue) {
                      setState(() {
                        degrrdropdown = newValue as EducationSpecData;
                        saveEducationDetailController.edithighedumasterController.text = newValue.id??"";
                      });},
                    items: saveEducationDetailController.educationspecdata.value.data?.map((list) {
                      return DropdownMenuItem<EducationSpecData>(
                        child: Text(list.efTitle.toString()),
                        value: list,
                      );
                    },
                    ).toList(),
                  ),
                ),
              ),
            },

            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "College Name",
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   //validator to be added
                //   if (value == null || value.isEmpty) {
                //     return "Please enter Mother's Name";
                //   } else if (value.length < 2) {
                //     return "Length of Mother's name should be minimum 3";
                //   }
                //   return null;
                // },
                controller: saveEducationDetailController.editcollegenameController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration: const InputDecoration(
                  hintText: "Enter College name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Occupation Sector",
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<OccupationData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Select Occupation Sector",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: occupationdropdownvalue,
                  //??religionController.residentalstatusData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      occupationdropdownvalue = newValue as OccupationData;
                      saveEducationDetailController.editoccupationsecController.text = newValue.id??"";
                    });
                  },
                  items: religionController.occupationData.value.data?.map((list) {
                    return DropdownMenuItem<OccupationData>(
                      child: Text(list.osTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Occupation Specialization",
              style: black15BoldTextStyle,
            ),
            heightSpace,
            Container(
              width: Get.width*0.99,
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: greyColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<OccupationFieldData>(
                  isExpanded: true,
                  elevation: 0,
                  isDense: true,
                  hint: Text(
                    "Enter Occupation Specialization",
                    style: black13RegularTextStyle,
                  ),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: primaryColor,
                    size: 20,
                  ),
                  value: occupationfielddropdown,
                  //??religionController.residentalstatusData.value.data?.first,
                  style: black13RegularTextStyle,
                  onChanged: (newValue) {
                    setState(() {
                      occupationfielddropdown = newValue as OccupationFieldData;
                      saveEducationDetailController.editoccupationsplecController.text = newValue.id??"";
                    });
                  },
                  items: religionController.occupationfirlddata.value.data?.map((list) {
                    return DropdownMenuItem<OccupationFieldData>(
                      child: Text(list.ofTitle.toString()),
                      value: list,
                    );
                  },
                  ).toList(),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Occupation Title",
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   //validator to be added
                //   if (value == null || value.isEmpty) {
                //     return "Please enter Mother's Name";
                //   } else if (value.length < 2) {
                //     return "Length of Mother's name should be minimum 3";
                //   }
                //   return null;
                // },
                controller: saveEducationDetailController.editoccupationtitleController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration: const InputDecoration(
                  hintText: "Enter Occupation Title",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Company Name",
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   //validator to be added
                //   if (value == null || value.isEmpty) {
                //     return "Please enter Mother's Name";
                //   } else if (value.length < 2) {
                //     return "Length of Mother's name should be minimum 3";
                //   }
                //   return null;
                // },
                controller: saveEducationDetailController.editorganisationnameController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration: const InputDecoration(
                  hintText: "Enter Company Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              "Position in Company",
              style: black15BoldTextStyle,
            ),
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
                // validator: (value) {
                //   //validator to be added
                //   if (value == null || value.isEmpty) {
                //     return "Please enter Mother's Name";
                //   } else if (value.length < 2) {
                //     return "Length of Mother's name should be minimum 3";
                //   }
                //   return null;
                // },
                controller: saveEducationDetailController.editworkdesignationController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration: const InputDecoration(
                  hintText: "Position in Company",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            heightSpace,
            InkWell(
              onTap: (){
                saveEducationDetailController.editeducationaldetail(refresh: true, userid:  widget.usersid)
                    .whenComplete(() {
                  savePersonalDetailController.getuserdetaildata(refresh: true,userid: widget.usersid);
                });
                setState(() {});
              },
              child: Container(
                padding: const EdgeInsets.all(fixPadding * 1.5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Update'.toUpperCase(),
                  style: white16BoldTextStyle,
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
          ],
        ),
    );
  }


  // edit screen
  editpersonalDetailsScreen() {
    return Obx((){
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
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'First Name',
            style: black15BoldTextStyle,
          ),
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
              controller: savePersonalDetailController.editnameController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              decoration:  InputDecoration(
                hintText: "${widget.firstname}",
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Middle Name',
            style: black15BoldTextStyle,
          ),
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
              controller: savePersonalDetailController.editmiddlenameController,
              cursorColor: primaryColor,
              readOnly: true,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: "${widget.middlename}",
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Last Name',
            style: black15BoldTextStyle,
          ),
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
              controller: savePersonalDetailController.editlastnameController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: savePersonalDetailController.userdetaildata.value.joindata?.first.lastname,
                //"${widget.lastname}",
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Religion',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editreligionController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: filterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          if(filterdata == "Hindu" || filterdata == "Jain" ||
              filterdata == "Sikh")...{
            Text(
              'Caste',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            if(filterdata == "Hindu")...{
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
                  // controller: savePersonalDetailController.editcasteController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: castefilterdata,
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
            }else if(filterdata == "Jain")...{
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
                  // controller: savePersonalDetailController.editcasteController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText:castefilterdata,
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
            }else if(filterdata == "Sikh")...{
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
                  //controller: savePersonalDetailController.editcasteController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: castefilterdata,
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
            }else if(filterdata == "Christian")...{
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
                  //controller: savePersonalDetailController.editcasteController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: castefilterdata,
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
            },
            SizedBox(height: Get.height*0.01,)
          }else...{
            Container()
          },
          if(filterdata == "Muslim" && widget.genderdaat == "male")...{
            Text(
              'Dhadhi',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.editcasteController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  //hintText: "${savePersonalDetailController.editcasteController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            Text(
              'Namaz',
              style: black15BoldTextStyle,
            ),
            SizedBox(height: Get.height*0.009,),
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
                //controller: savePersonalDetailController.editcasteController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  // hintText: "${savePersonalDetailController.editcasteController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,)
          }else...{
            Container()
          },
          if(filterdata == "Muslim" && widget.genderdaat == "female")...{
            Text(
              'Hijab ',
              style: black15BoldTextStyle,
            ),
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
                // controller: savePersonalDetailController.editcasteController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  // hintText: "${savePersonalDetailController.editcasteController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            Text(
              'Nakab',
              style: black15BoldTextStyle,
            ),
            SizedBox(height: Get.height*0.009,),
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
                //controller: savePersonalDetailController.editcasteController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  // hintText: "${savePersonalDetailController.editcasteController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,)
          }else...{
            Container()
          },

          if(filterdata == "Sikh" && widget.genderdaat == "male")...{
            Text(
              'Amritdhari ',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.editcasteController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  //hintText: "${savePersonalDetailController.editcasteController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
          }else...{
            Container()
          },

          Text(
            'Profile Create For ',
            style: black15BoldTextStyle,
          ),
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
              controller: savePersonalDetailController.editprofileforController,
              cursorColor: primaryColor,
              readOnly: true,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: savePersonalDetailController.editprofileforController.text == "" ?"${widget.profilefor}": widget.profilefor,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Height',
                      style: black15BoldTextStyle,
                    ),
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
                        //controller: savePersonalDetailController.editheightController,
                        readOnly: true,
                        cursorColor: primaryColor,
                        style: black14BoldTextStyle,
                        decoration:  InputDecoration(
                          hintText: heightfilterdata,
                          hintStyle: black14BoldTextStyle,
                          //hintText: "Enter Name",
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gender',
                      style: black15BoldTextStyle,
                    ),
                    heightSpace,
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 27.5,
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: fixPadding / 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: greyColor),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child:  Container(
                        height: Get.height*0.028,
                        child: TextFormField(
                          //controller: savePersonalDetailController.editgenderController,
                          readOnly: true,
                          cursorColor: primaryColor,
                          style: black14BoldTextStyle,
                          decoration:  InputDecoration(
                            hintText: "${savePersonalDetailController.editgenderController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                            savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                            savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pGender?? "" : "":""}",
                            hintStyle: black14BoldTextStyle,
                            //hintText: "Enter Name",
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            border: UnderlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),)
              // weightDropdown(),
            ],
          ),
          heightSpace,
          heightSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date of Birth',
                style: black15BoldTextStyle,
              ),
              heightSpace,
              Container(
                  width: MediaQuery.of(context).size.width - 55,
                  padding: const EdgeInsets.symmetric(
                    horizontal: fixPadding,
                    vertical: fixPadding / 22,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextFormField(
                    //textAlign: TextAlign.start,
                    controller: savePersonalDetailController.editdobController,
                    style: black14BoldTextStyle,//editing controller of this TextField
                    decoration:  InputDecoration(
                      hintText: "Please Choose Date of Birth",
                      isDense: true,
                      hintStyle: black14BoldTextStyle,
                      //contentPadding: EdgeInsets.only(top: Get.height*0.02),
                      border: InputBorder.none,
                    ),
                    readOnly: true,  // when true user cannot edit text
                    // onTap: () async {
                    //   DateTime? pickedDate = await showDatePicker(
                    //       context: context,
                    //       initialDate: DateTime.now(), //get today's date
                    //       firstDate:DateTime(1988), //DateTime.now() - not to allow to choose before today.
                    //       lastDate: DateTime(2500)
                    //   );
                    //   if(pickedDate != null ){
                    //     print(pickedDate);  //get the picked date in the format => 2022-07-04 00:00:00.000
                    //     String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                    //     print(formattedDate); //formatted date output using intl package =>  2022-07-04
                    //     //You can format date as per your need
                    //     savePersonalDetailController.editdobController.text = formattedDate;
                    //   }else{
                    //     DateTime.now();
                    //   }
                    // }
                  )
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          if(filterdata == "Hindu" || filterdata == "Jain" ||
              filterdata == "Sikh")...{
            Text(
              'Time of Birth',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.edittobController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  hintText: savePersonalDetailController.edittobController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pTob?? "" : "":"",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                readOnly: true,
                // onTap: ()async{
                //   TimeOfDay? timeRecord = await showTimePicker(
                //     context: context,
                //     initialTime: times.replacing(hour: times.hourOfPeriod),
                //     builder: (BuildContext context, Widget? child) {
                //       return MediaQuery(
                //         data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                //         child: child!,
                //       );
                //     },
                //   );
                //   if (timeRecord != null) {
                //     setState(() {
                //       var df = DateFormat("h:mm a");
                //       var dt = df.parse(timeRecord.format(context));
                //       var finaltime =  DateFormat('HH:mm a').format(dt);
                //       var selectedTime = DateFormat('HH:mm a').format(dt);
                //
                //       print(finaltime);
                //       setState(() {
                //         selectedTime = finaltime;
                //         selectedTime = timeRecord.format(context);
                //       });
                //       savePersonalDetailController.edittobController.text = selectedTime;
                //       print(selectedTime);
                //     });}
                // },
              ),
            ),
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.01,),
            Text(
              'Manglik',
              style: black15BoldTextStyle,
            ),
            SizedBox(height: Get.height*0.009,),
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
                //controller: savePersonalDetailController.editmaritialstatusController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  //hintText: "${savePersonalDetailController.editmaritialstatusController.text}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.01,)
          }else...{
            Container()
          },
          if(filterdata == "Hindu" || filterdata == "Jain" ||
              filterdata == "Sikh")...{
            Text(
              'Place of Birth',
              style: black15BoldTextStyle,
            ),
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
                // controller: savePersonalDetailController.editbirthplaceController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                readOnly: true,
                decoration:  InputDecoration(
                  hintText: "${savePersonalDetailController.editbirthplaceController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pPob?? "" : "":""}",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.01,),
            heightSpace,
            heightSpace,
          }else...{
            Container()
          },

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maritial Status',
                style: black15BoldTextStyle,
              ),
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
                  // controller: savePersonalDetailController.editmaritialstatusController,
                  readOnly: true,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  decoration:  InputDecoration(
                    hintText: "${savePersonalDetailController.editmaritialstatusController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pMaritialStatus?? "" : "":""}",
                    hintStyle: black14BoldTextStyle,
                    //hintText: "Enter Name",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          if(savePersonalDetailController.marriagedatastore.value == "Divorced" )...{
            Text(
              'No. of Child',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.editnoofchildController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                keyboardType: TextInputType.number,
                readOnly: true,
                decoration:  InputDecoration(
                  hintText: savePersonalDetailController.editnoofchildController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pNoOfChild?? "" : "":"",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.02,),
            // heightSpace,
            Text(
              'No. of Child living with you',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            SizedBox(height: Get.height*0.01,),
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
                //controller: savePersonalDetailController.editchildlivewithController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  hintText: "${savePersonalDetailController.editchildlivewithController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pNoOfChildLivingWithYou?? "" : "":""}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.02,),
          }else if(savePersonalDetailController.marriagedatastore.value == "Widower" )...{
            Text(
              'No. of Child',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.editnoofchildController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                readOnly: true,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  hintText: savePersonalDetailController.editnoofchildController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pNoOfChild?? "" : "":"",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.02,),
            // heightSpace,
            Text(
              'No. of Child living with you',
              style: black15BoldTextStyle,
            ),
            heightSpace,
            SizedBox(height: Get.height*0.01,),
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
                // controller: savePersonalDetailController.editchildlivewithController,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                keyboardType: TextInputType.number,
                readOnly: true,
                decoration:  InputDecoration(
                  hintText: savePersonalDetailController.editchildlivewithController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pNoOfChildLivingWithYou?? "" : "":"",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            SizedBox(height: Get.height*0.02,),
          }else...{
            Container()
          },
          Text(
            'Residential Status',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editresidencialController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: residebtfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Immigrate Different Country',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editimmigratecountryController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: "${savePersonalDetailController.editimmigratecountryController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pImmigrateDiffrentCountry?? "" : "":""}",
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Living with family',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editlivingwithfamilyController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: "${savePersonalDetailController.editlivingwithfamilyController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pLivingWithFamily?? "" : "":""}",
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Diet',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editdietController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: diettfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Smoke',
            style: black15BoldTextStyle,
          ),
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
              // controller: savePersonalDetailController.editsmokeController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: smokefilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Drink',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editdrinkController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: drinkfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Specially Able',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editspeciallyableController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: specfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          if(specfilterdata == "YES")...{
            Text(
              'Specially Able Description',
              style: black15BoldTextStyle,
            ),
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
                //controller: savePersonalDetailController.editabledesController,
                readOnly: true,
                cursorColor: primaryColor,
                style: black14BoldTextStyle,
                decoration:  InputDecoration(
                  hintText: "${savePersonalDetailController.editabledesController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.isNotEmpty??false) ?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData != null?
                  savePersonalDetailController.userdetaildata.value.joindata?.first.userData?.first.pSpeciallyAbilityDescription?? "" : "":""}",
                  hintStyle: black14BoldTextStyle,
                  //hintText: "Enter Name",
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: Get.height*0.015,),
            heightSpace,
            heightSpace,
          }else...{
            Container()
          },
          Text(
            'Tentative Time',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.edittentativetimeController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: tenativefilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Annual Income',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editannualincomeController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: annualfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          Text(
            'Body Type',
            style: black15BoldTextStyle,
          ),
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
              //controller: savePersonalDetailController.editbodytypeController,
              readOnly: true,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintText: bodytypwfilterdata,
                hintStyle: black14BoldTextStyle,
                //hintText: "Enter Name",
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
              savePersonalDetailController.doneClicked.value = "true";
              setState(() {
              });
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Edit'.toUpperCase(),
                style: white16BoldTextStyle,
              ),
            ),
          ),
          heightSpace,
          heightSpace,
        ],
      );
    }
    );
  }

  editfamilyDetailsScreen() {
    return Obx((){
      String? occudata = "";
      String? occufielddata = "";
      String? mothoccdata = "";
      String? mothoccfielddata = "";
      String? familvaldata = "";
      String? familstadata = "";
      String? familtydata = "";
      String? familincdata = "";
      if(religionController.occupationData.value.data != null){
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
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Father's Name",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintText: saveFamilyDetailController.editfathernameController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fFatherName?? "" : "":"",
                        hintStyle: black14BoldTextStyle,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Father's Occupation",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: occudata??"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Father's Occupation Status",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: occufielddata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Father's Gotra",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editfathergotraController.text= (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fFatherGotra?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Mother's Name",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editmothernameController.text =(savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherName?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  // heightSpace,
                  // heightSpace,
                  // heightSpace,
                  // heightSpace,
                  // Text(
                  //   "Mother's Parent Gotra",
                  //   style: black15BoldTextStyle,
                  // ),
                  // heightSpace,
                  // Container(
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: fixPadding,
                  //     vertical: 8,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: greyColor),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: TextFormField(
                  //     // controller: saveFamilyDetailController.editbrothermarriedController,
                  //     cursorColor: primaryColor,
                  //     style: black14BoldTextStyle,
                  //     keyboardType: TextInputType.number,
                  //     readOnly: true,
                  //     decoration:  InputDecoration(
                  //       hintText: saveFamilyDetailController.editmotherparentController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                  //       savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                  //       savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherGotra?? "" : "":"",
                  //       isDense: true,
                  //       contentPadding: EdgeInsets.zero,
                  //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                  //     ),
                  //   ),
                  // ),
                  // heightSpace,
                  // heightSpace,
                  // heightSpace,
                  // heightSpace,
                  // Text(
                  //   "Mother's Family Gotra",
                  //   style: black15BoldTextStyle,
                  // ),
                  // heightSpace,
                  // Container(
                  //   width: double.infinity,
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: fixPadding,
                  //     vertical: 8,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     border: Border.all(color: greyColor),
                  //     borderRadius: BorderRadius.circular(5),
                  //   ),
                  //   child: TextFormField(
                  //     // controller: saveFamilyDetailController.editbrothermarriedController,
                  //     cursorColor: primaryColor,
                  //     style: black14BoldTextStyle,
                  //     keyboardType: TextInputType.number,
                  //     readOnly: true,
                  //     decoration:  InputDecoration(
                  //       hintText: saveFamilyDetailController.editmotherfamilyController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                  //       savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                  //       savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherGotra?? "" : "":"",
                  //       isDense: true,
                  //       contentPadding: EdgeInsets.zero,
                  //       border: UnderlineInputBorder(borderSide: BorderSide.none),
                  //     ),
                  //   ),
                  // ),

                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Mother's Occupation",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: mothoccdata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Mother's Occupation Status",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: mothoccfielddata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,

                  Text(
                    "Mother's Gotra",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editmothergotraController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fMotherGotra?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Family Status",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: familstadata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Family Value",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: familvaldata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Family type",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: familtydata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "Family Income",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: familincdata,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "No. of Sister",
                    style: black15BoldTextStyle,
                  ),
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
                      //controller: saveFamilyDetailController.editsisterController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editsisterController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfSister.toString()?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "No. of Sister married",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editsistermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editsistermarriedController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfSisterMarried.toString()?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "No. of Brother",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrotherController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editbrotherController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfBrother.toString()?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    "No. of Brother married",
                    style: black15BoldTextStyle,
                  ),
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
                      // controller: saveFamilyDetailController.editbrothermarriedController,
                      cursorColor: primaryColor,
                      style: black14BoldTextStyle,
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration:  InputDecoration(
                        hintStyle: black14BoldTextStyle,
                        hintText: saveFamilyDetailController.editbrothermarriedController.text = (savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.familyDetails?.first.fNoOfBrotherMarried.toString()?? "" : "":"",
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: UnderlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  InkWell(
                    onTap: (){
                      savePersonalDetailController.familyClicked.value = "true";
                      setState(() {
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(fixPadding * 1.5),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Edit'.toUpperCase(),
                        style: white16BoldTextStyle,
                      ),
                    ),
                  ),
                  heightSpace,
                  heightSpace,
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  editeducationDetailsScreen() {
    return Obx((){
      String? educationfiltereddata = "";
      String? educationmasfiltereddata = "";
      String? occupfiltereddata = "";
      String? occupspecfiltereddata = "";
      // final educationIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduHighEduMaster).toList();
      // final educationfiltered = (religionController.educationData.value.data??[]).where((element) => educationIds!.contains(element.id)).toList();
      // print(educationfiltered.first.esTitle);
      // educationfiltereddata = educationfiltered.first.esTitle;
      //
      // final educationmasIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduHighEduSpecId).toList();
      // final educationmasfiltered = (saveEducationDetailController.educationspecdata.value.data??[]).where((element) => educationmasIds!.contains(element.id)).toList();
      // print(educationmasfiltered.first.efTitle);
      // educationmasfiltereddata = educationmasfiltered.first.efTitle;
      //
      // final occupIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduOccupationSecId).toList();
      // final occupfiltered = (religionController.occupationData.value.data??[]).where((element) => occupIds!.contains(element.id)).toList();
      // print(occupfiltered.first.osTitle);
      // occupfiltereddata = occupfiltered.first.osTitle;
      //
      // final occupspecIds = savePersonalDetailController.userdetaildata.value.joindata?.map((component) => component.usereducationdetails?.first.uEduOccupationSpecId).toList();
      // final occupspecfiltered = (religionController.occupationfirlddata.value.data??[]).where((element) => occupspecIds!.contains(element.id)).toList();
      // print(occupspecfiltered.first.ofTitle);
      // occupspecfiltereddata = occupspecfiltered.first.ofTitle;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Education',
                style: black15BoldTextStyle,
              ),
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
                  controller: saveEducationDetailController.edithighereduController,
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly: true,
                  decoration:  InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: educationfiltereddata,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ],
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Higher Education",
            style: black15BoldTextStyle,
          ),
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
              //controller: saveEducationDetailController.edithighedumasterController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              decoration:  InputDecoration(
                hintText: educationmasfiltereddata,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "College Name",
            style: black15BoldTextStyle,
          ),
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
              controller: saveEducationDetailController.editcollegenameController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              decoration:  InputDecoration(
                hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduCollegeName?? "" : "":"",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Sector",
            style: black15BoldTextStyle,
          ),
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
             // controller: saveEducationDetailController.editoccupationsecController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              decoration:  InputDecoration(
                hintStyle: black14BoldTextStyle,
                hintText: occupfiltereddata,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Specialization",
            style: black15BoldTextStyle,
          ),
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
             // controller: saveEducationDetailController.editoccupationsplecController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              decoration:  InputDecoration(
                hintText: occupspecfiltereddata,
                hintStyle: black14BoldTextStyle,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Occupation Title",
            style: black15BoldTextStyle,
          ),
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
              controller: saveEducationDetailController.editoccupationtitleController,
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly:  true,
              decoration:  InputDecoration(
                hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOccupationTitle?? "" : "":"",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Company Name",
            style: black15BoldTextStyle,
          ),
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
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              decoration:  InputDecoration(
                hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduOrganisationName?? "" : "":"",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            "Position in Company",
            style: black15BoldTextStyle,
          ),
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
              cursorColor: primaryColor,
              style: black14BoldTextStyle,
              readOnly: true,
              controller: saveEducationDetailController.editworkdesignationController,
              decoration:  InputDecoration(
                hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.isNotEmpty??false) ?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails != null?
                savePersonalDetailController.userdetaildata.value.joindata?.first.usereducationdetails?.first.uEduWorkDestination?? "" : "":"",
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: UnderlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: (){
              savePersonalDetailController.educationClicked.value = "true";
              setState(() {});
            },
            child: Container(
              padding: const EdgeInsets.all(fixPadding * 1.5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                'Edit'.toUpperCase(),
                style: white16BoldTextStyle,
              ),
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      );
    });
  }

  editpartnerDetailsScreen() {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        const SizedBox(height: 3),
        Text(
          'Age',
          style: black15BoldTextStyle,
        ),
        heightSpace,
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'From',
                      style: grey13SemiBoldTextStyle,
                    ),
                    Text(
                      (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
                      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
                      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.ageFrom?? "" : "":"",
                      style: black14BoldTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: blackColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GlobalConstants().selectAge,
                      style: grey13SemiBoldTextStyle,
                    ),
                    Text(
                      (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
                      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
                      savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.ageTo?? "" : "":"",
                      style: black14BoldTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // heightSpace,
        // heightSpace,
        // preferenceHeight(),
        heightSpace,
        heightSpace,
        Text(
          'Education',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              hintText: savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.toString().replaceAll("[", "").replaceAll("]", ""),
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          "Profession",
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              // hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.first?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Religion',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              // hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.first?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Caste',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              // hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.first?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,Text(
          'Marital',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              // hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.first?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Residential Status',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              // hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              // savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.profession?.first?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        Text(
          'Income',
          style: black15BoldTextStyle,
        ),
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
            //controller: partnerPreferenceController.editprofessionController,
            cursorColor: primaryColor,
            style: black14BoldTextStyle,
            readOnly: true,
            decoration:  InputDecoration(
              hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.isNotEmpty??false) ?
              savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces != null?
              savePersonalDetailController.userdetaildata.value.joindata?.first.partnerPerfernces?.first.incomeRange?? "" : "":"",
              hintStyle: black14BoldTextStyle,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        InkWell(
          onTap: (){
            savePersonalDetailController.partnerClicked.value = "true";
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.all(fixPadding * 1.5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Edit'.toUpperCase(),
              style: white16BoldTextStyle,
            ),
          ),
        ),
        heightSpace,
        heightSpace,
      ],
    );
  }

  editaddressDetailsScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace,
              heightSpace,
              Text(
                "Country",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  controller: saveAddressDetailController.countryController,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aCountry?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "State",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aState?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "City",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aCity?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Address",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aAddress?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                        savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aSameAddress?? true : true : true;
                        print(isChecked);
                        // if(isChecked == true){
                        //   saveAddressDetailController.boolController.text = "true";
                        // }else{
                        //   saveAddressDetailController.boolController.text = "false";
                        // }
                      });
                    },
                  ),
                  Text("Permanent Address",
                    style: grey14SemiBoldTextStyle,)
                ],
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent Country",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPCountry?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent State",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPState?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent City",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText:  (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPCity?? "" : "":"",
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              Text(
                "Permanent Address",
                style: black15BoldTextStyle,
              ),
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
                  cursorColor: primaryColor,
                  style: black14BoldTextStyle,
                  readOnly:true,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintStyle: black14BoldTextStyle,
                    hintText: (savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.isNotEmpty??false) ?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails != null?
                    savePersonalDetailController.userdetaildata.value.joindata?.first.useraddressdetails?.first.aPAddress?? "" : "":"",
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
                  savePersonalDetailController.addressClicked.value = "true";
                  setState(() {});
                },
                child: Container(
                  padding: const EdgeInsets.all(fixPadding * 1.5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    'Edit'.toUpperCase(),
                    style: white16BoldTextStyle,
                  ),
                ),
              ),
              heightSpace,
              heightSpace,
              heightSpace,
              heightSpace,
            ],
          ),
        )
      ],
    );
  }
}
