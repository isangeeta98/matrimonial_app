import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meetmeapp/views/login_screen.dart';

import '../constants/app_constants.dart';
import '../controller/registration_controller.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //RegistrationData1? signUpResponse;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  RegistrationController registrationController = Get.put(RegistrationController());
  Future<String?> getIP() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        registrationController.ipaddressController.text = response.body;
        return response.body;
      } else {
        print(response.body);
        return null;
      }
    } catch (exception) {
      print(exception);
      return null;
    }
  }

  @override
  void initState(){
    super.initState();
    getIP();
  }
  bool passwordVisible = false;
  bool isChecked = false;
  bool showErrorMessage = false;
  String? status;
  String? genderstatus;
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
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: primaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Sign Up',
            style: white20BoldTextStyle,
          ),
        ),
        body: ListView(
          children: [
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 90,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: fixPadding * 2.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: fixPadding * 2.0,
                          vertical: fixPadding * 1.8,
                        ),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Form(
                          key: _formKey,
                          child: isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Container(
                          padding: const EdgeInsets.all(fixPadding * 1.2),
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: greyColor.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Name';
                              } else if (value.length < 2) {
                                return 'Length of name should be minimum 3';
                              }
                              return null;
                            },
                            controller: registrationController.fullnameController,
                            cursorColor: primaryColor,
                            style: black15SemiBoldTextStyle,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              hintText: 'First Name',
                              hintStyle: grey15RegularTextStyle,
                              border: const UnderlineInputBorder(borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                          Container(
                            padding: const EdgeInsets.all(fixPadding * 1.2),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: greyColor.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: TextFormField(
                              // validator: (value) {
                              //   if (value == null || value.isEmpty) {
                              //     return 'Please enter Name';
                              //   }
                              //   return null;
                              // },
                              controller: registrationController.middlenameController,
                              cursorColor: primaryColor,
                              style: black15SemiBoldTextStyle,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                hintText: 'Middle Name',
                                hintStyle: grey15RegularTextStyle,
                                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                              Container(
                                padding: const EdgeInsets.all(fixPadding * 1.2),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: greyColor.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                    ),
                                  ],
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
                                  controller: registrationController.lastnameController,
                                  cursorColor: primaryColor,
                                  style: black15SemiBoldTextStyle,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.zero,
                                    hintText: 'Last Name',
                                    hintStyle: grey15RegularTextStyle,
                                    border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                  ),
                                ),
                              ),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                              Container(
                                height: Get.height*0.05,
                                padding: const EdgeInsets.all(fixPadding * 1.2),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: greyColor.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                    ),
                                  ],
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    elevation: 0,
                                    isDense: true,
                                    hint: Text(
                                      'Profile Create For',
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
                                        registrationController.profilecrateforController.text = newValue!;
                                      });
                                    },
                                    items: <String>[
                                      'my self',
                                      'my brother',
                                      'my sister',
                                      'my son',
                                      'my daughter',
                                      'friend',
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
                              heightSpace,
                              if(registrationController.profilecrateforController.text == 'My brother')...{
                                Container(
                                  padding: const EdgeInsets.all(fixPadding * 1.2),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: registrationController.genderController,
                                    cursorColor: primaryColor,
                                    style: black13RegularTextStyle,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: registrationController.genderController.text ='male',
                                      hintStyle: grey15RegularTextStyle,
                                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              }else if(registrationController.profilecrateforController.text == 'my son')...{
                                Container(
                                  padding: const EdgeInsets.all(fixPadding * 1.2),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: registrationController.genderController,
                                    cursorColor: primaryColor,
                                    style: black13RegularTextStyle,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: registrationController.genderController.text ='male',
                                      hintStyle: grey15RegularTextStyle,
                                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              }else if(registrationController.profilecrateforController.text == 'my sister')...{
                                Container(
                                  padding: const EdgeInsets.all(fixPadding * 1.2),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: registrationController.genderController,
                                    cursorColor: primaryColor,
                                    style: black13RegularTextStyle,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: registrationController.genderController.text ='female',
                                      hintStyle: grey15RegularTextStyle,
                                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              }else if(registrationController.profilecrateforController.text == 'my daughter')...{
                                Container(
                                  padding: const EdgeInsets.all(fixPadding * 1.2),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: registrationController.genderController,
                                    cursorColor: primaryColor,
                                    style: black13RegularTextStyle,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      hintText: registrationController.genderController.text ='female',
                                      hintStyle: grey15RegularTextStyle,
                                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              }
                              else...{
                                  Container(
                                    height: Get.height*0.05,
                                    padding: const EdgeInsets.all(fixPadding * 1.2),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: greyColor.withOpacity(0.2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                        ),
                                      ],
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        elevation: 0,
                                        isDense: true,
                                        hint: Text(
                                          'Gender',
                                          style: black13RegularTextStyle,
                                        ),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: primaryColor,
                                          size: 20,
                                        ),
                                        value: genderstatus,
                                        style: black13RegularTextStyle,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            genderstatus = newValue;
                                            registrationController.genderController.text = newValue!;
                                          });
                                        },
                                        items: <String>[
                                          'Please Select Gender',
                                          'male',
                                          'female',
                                          '',
                                        ].map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                              },

                              heightSpace,
                              heightSpace,
                              heightSpace,
                              Container(
                                  height: Get.height*0.06,
                                  padding: const EdgeInsets.all(fixPadding * 1.0),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: greyColor.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    //textAlign: TextAlign.start,
                                      controller: registrationController.dobController,
                                      style: black15BoldTextStyle,//editing controller of this TextField
                                      decoration:  InputDecoration(
                                        hintText: "Please Choose Date of Birth",
                                        isDense: true,
                                        hintStyle: grey15RegularTextStyle,
                                        //contentPadding: EdgeInsets.only(top: Get.height*0.02),
                                        border: InputBorder.none,
                                      ),
                                      readOnly: true, // when true user cannot edit text
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
                                          registrationController.dobController.text = formattedDate;
                                        }else{
                                          DateTime.now();
                                        }
                                      }
                                  )
                              ),

                              heightSpace,
                              heightSpace,
                              heightSpace,
                              emailTextField(),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                              mobileNumberTextField(),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                              passwordTextField(),
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
                                          registrationController.accepttermandconController.text = "true";
                                        }else{
                                          registrationController.accepttermandconController.text = "false";
                                        }
                                      });
                                    },
                                  ),
                                  Text("Accept Term and Condition",
                                  style: grey14SemiBoldTextStyle,)
                                ],
                              ),
                              // based up on this bool value
                              showErrorMessage ?
                              Text('Please accept the terms and conditions',
                              style: TextStyle(
                                color: Colors.red
                              ),)
                                  : Container(),
                              otherOptions(context),
                              heightSpace,
                              heightSpace,
                              heightSpace,
                              signupButton(context),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  nameTextField() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 1.2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter Name';
          } else if (value.length < 2) {
            return 'Length of name should be minimum 3';
          }
          return null;
        },
        controller: registrationController.fullnameController,
        cursorColor: primaryColor,
        style: black15SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Full Name',
          hintStyle: grey15RegularTextStyle,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  emailTextField() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 1.2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        controller: registrationController.emailController,
        validator: (value) {
          final bool isValid = EmailValidator.validate(value!);
          if (!isValid) {
            return 'Please enter correct email';
          }
        },
        keyboardType: TextInputType.emailAddress,
        cursorColor: primaryColor,
        style: black15SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Email Address',
          hintStyle: grey15RegularTextStyle,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  mobileNumberTextField() {
    return Container(
      padding: const EdgeInsets.all(fixPadding * 1.2),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter 10 digit mobile no';
          } else if (value.length < 9) {
            return 'Mobile no. should be of 10 digits.';
          }
          return null;
        },
        maxLength: 10,
        controller: registrationController.mobileController,
        cursorColor: primaryColor,
        style: black15SemiBoldTextStyle,
        decoration: InputDecoration(
          prefixIcon: const Text(
            "+91 ",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          prefixStyle: TextStyle(color: Colors.black),
          isDense: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Enter Mobile No. ',
          hintStyle: grey15RegularTextStyle,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  passwordTextField() {
    return Container(
      height: Get.height*0.05,
      padding: const EdgeInsets.all(fixPadding * 0.5),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: greyColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextFormField(
        validator: (passValue) {
          if (passValue == null || passValue.isEmpty) {
            return 'Please enter Password';
          } else if (passValue.length < 7) {
            return 'Length of Password should be minimum 8';
          }
          return null;
        },
        controller: registrationController.passwordController,
        obscureText: !passwordVisible,
        cursorColor: primaryColor,
        style: black15SemiBoldTextStyle,
        decoration: InputDecoration(
          contentPadding:  EdgeInsets.only(left: Get.width*0.01,top: Get.height*0.01, bottom: Get.height*0.01),
          isDense: true,
          //contentPadding: EdgeInsets.zero,
          hintText: 'Password',
          hintStyle: grey15RegularTextStyle,
          border: const UnderlineInputBorder(borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              passwordVisible
              ?Icons.visibility_off
              : Icons.visibility,
              color: primaryColor,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }

  // confirmPasswordTextField() {
  //   return Container(
  //     padding: const EdgeInsets.all(fixPadding * 1.2),
  //     decoration: BoxDecoration(
  //       color: whiteColor,
  //       borderRadius: BorderRadius.circular(5),
  //       boxShadow: [
  //         BoxShadow(
  //           color: greyColor.withOpacity(0.2),
  //           spreadRadius: 2,
  //           blurRadius: 2,
  //         ),
  //       ],
  //     ),
  //     child: TextFormField(
  //       controller: _confirmPassword,
  //       validator: (value) {
  //         if (value == null || value.isEmpty) {
  //           return 'Please enter Password';
  //         } else if (value.length < 7) {
  //           return 'Length of Password should be minimum 8';
  //         } else if (_password.text != _confirmPassword.text) {
  //           return 'Password and Confirm Password are not same, Please check.';
  //         }
  //         return null;
  //       },
  //       obscureText: true,
  //       cursorColor: primaryColor,
  //       style: black15SemiBoldTextStyle,
  //       decoration: InputDecoration(
  //         isDense: true,
  //         contentPadding: EdgeInsets.zero,
  //         hintText: 'Confirm Password',
  //         hintStyle: grey15RegularTextStyle,
  //         border: const UnderlineInputBorder(borderSide: BorderSide.none),
  //       ),
  //     ),
  //   );
  // }

  otherOptions(context) {
    return Column(
      children: [
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have account? ',
              style: grey14SemiBoldTextStyle,
            ),
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              ),
              child: Text(
                'Sign In',
                style: primaryColor14SemiBoldTextStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }

  signupButton(context) {
    return InkWell(
      onTap: () async {
        if (_formKey.currentState!.validate()){
          if(isChecked != true){
            setState(() => showErrorMessage = true);
          }
          else{
            setState(() => showErrorMessage = false);
            registrationController.getRegisterdata(refresh: true);
          }

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
          'Sign Up'.toUpperCase(),
          style: white16BoldTextStyle,
        ),
      ),
    );
  }
}
