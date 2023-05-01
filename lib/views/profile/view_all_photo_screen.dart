import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../constants/app_constants.dart';
import '../../controller/profile_images/get_all_images_controller.dart';
import '../../controller/profile_images/get_profile_image_controller.dart';
import '../../controller/profile_images/upload_images_controller.dart';

class ViewAllPhotoScreen extends StatefulWidget {
  const ViewAllPhotoScreen({Key? key}) : super(key: key);

  @override
  State<ViewAllPhotoScreen> createState() => _ViewAllPhotoScreenState();
}

class _ViewAllPhotoScreenState extends State<ViewAllPhotoScreen> {
  List imagesList = [
    'assets/images/users/user1.png',
    'assets/images/users/user2.png',
    'assets/images/users/user3.png',
    'assets/images/users/user4.png',
    'assets/images/users/user1.png',
    'assets/images/users/user5.png',
    'assets/images/users/user6.png',
    'assets/images/users/user7.png'
  ];
  GetAllImagesController getAllImagesController = Get.find<GetAllImagesController>();
  UploadImagesController uploadImagesController = Get.put(UploadImagesController());
  GetProfileImageController getProfileImageController = Get.find<GetProfileImageController>();
  var baseurl = "http://65.2.137.114:5000/uploads/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              Get.back();
            });
          } ,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        titleSpacing: 0,
        title: Text(
          'Photos',
          style: black20BoldTextStyle,
        ),
      ),
      body: Obx(()=>
          StaggeredGridView.countBuilder(
           staggeredTileBuilder: (_) => const StaggeredTile.fit(2),
           shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: 10,
           crossAxisSpacing: 10,
           itemCount: getAllImagesController.getallimages.value.post?.length,
            itemBuilder: (context, index) {
          //final item = imagesList[index];
          return InkWell(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text("Set as a profile image"),
                      actions: <Widget>[
                        GestureDetector(
                          // onTap: () {
                          //   Navigator.of(context).pop();
                          // },
                          child: Container(
                            padding: EdgeInsets.only(right: Get.width*0.05),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    uploadImagesController.setuserprofile(refresh: true,
                                    userid: getAllImagesController.getallimages.value.post?[index].id)
                                        .whenComplete(() => getProfileImageController.getuserprofileimage(refresh: true));
                                    Get.back();
                                  },
                                  child: SizedBox(
                                    width: Get.width*0.1,
                                      height: Get.height*0.04,
                                      child: Text("OK")),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: SizedBox(
                                      width: Get.width*0.1,
                                      height: Get.height*0.04,
                                      child: Text("Close")),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  }
              );
            },
            child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: greyColor),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Image.network(
                    "${baseurl}${getAllImagesController.getallimages.value.post?[index].profileMultiImg}"
                   // imagesList[index]
                )
            ),
          );
        },
      )),
    );
  }
}
