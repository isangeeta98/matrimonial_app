import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:meetmeapp/views/login_screen.dart';
import 'package:meetmeapp/views/sign_up_screen.dart';

import '../constants/app_constants.dart';
import '../controller/slider_controller.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  SliderController sliderController = Get.put(SliderController());
  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }
  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }
  var baseurl = "http://65.2.137.114:5000/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>
          PageView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value){
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: sliderController.filterdata.length,
          itemBuilder: (context, index){

            // contents of slider
            return Stack(
              children: [
                GFCarousel(
                  height: Get.height,
                  aspectRatio : 12 / 8,
                  viewportFraction : 1.0,
                  passiveIndicator: Colors.grey,
                  activeIndicator: primaryColor,
                  activeDotBorder: Border.all(color: Colors.white),
                  passiveDotBorder: Border.all(color: Colors.white),
                  items: sliderController.filterdata.map(
                        (url) {
                      return Image.network(
                        "${baseurl}${sliderController.filterdata[index].sImg}",
                        fit: BoxFit.cover,
                        width: 1500.0,
                        height: Get.height,
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                SizedBox(height: Get.height*0.1,),
                Padding(
                  padding:  EdgeInsets.only(top: Get.height*0.7),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(sliderController.filterdata.length, (index) => buildDot(index, context),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //   top: Get.height*0.87,
                //   left: Get.width*0.3,
                //   child:
                // ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child:  Padding(
                    padding:  EdgeInsets.only(top: Get.height*0.05),
                    child: Container(
                      height: Get.height*0.1315,
                      width: Get.width*0.999,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          topRight: Radius.circular(5.0),
                        ),
                        image: DecorationImage(
                            image: AssetImage("assets/images/bottomimage.png")
                        ),
                        // color: primaryColor,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: Get.height*0.045),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold
                              ),),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                Get.to(()=> LoginScreen());
                              },
                              child: Container(
                                height: Get.height*0.045,
                                width: Get.width*0.2,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white,width: 2.0),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white,fontWeight: FontWeight.bold
                                    ),),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:Get.height*0.55 ),
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        Get.to(()=> SignUpScreen());
                      },
                      child: Container(
                        height: Get.height*0.055,
                        width: Get.width*0.45,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Register here",
                            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 18),),
                        ),
                      ),
                    ),
                  ),
                ),
                // Positioned(
                //     top: Get.height*0.75,
                //     left: Get.width*0.3,
                //     child:
                // ),
                // Positioned(
                //     top: Get.height*0.7,
                //     left: Get.width*0.35,
                //     child: Center(
                //       child:
                //     )
                // ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height*0.42),
                  child: Center(
                    child: Text("New to meetme ?",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 18),),
                  ),
                ),
              ],
            );
          }
      )
      ),
    );
  }
  Container buildDot(int index, BuildContext context){
    return Container(
      height: Get.height*0.013,
      width: currentIndex == index ? 10 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: currentIndex == index ? Colors.white : Colors.grey,
        //Colors.green,
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 20;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


