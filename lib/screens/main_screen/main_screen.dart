import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../componants/custom_text_field.dart';
import '../../componants/default_btn.dart';
import '../next_screen/next_screen.dart';
import 'controller/main_screen_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(MainScreenController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() => controller.photo.value != null &&
            controller.photo.value!.path.isNotEmpty
            ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage:
                  FileImage(File(controller.photo.value!.path)),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton.small(
                        child: const Icon(Icons.delete_outline_outlined),
                        onPressed: () => controller.photo.value = XFile("")),
                  ),
                ),
GetBuilder<MainScreenController>(
  builder: (controller)=>

                 controller.response !=null?
              Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                IconButton(
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                          text: controller.response!.recognizedText),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Copied to Clipboard'),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.copy),
                                ),
                //               ],
                //             ),
                //             const SizedBox(height: 10),
          Text(controller.response!.recognizedText,style: TextStyle(color:Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),

                          ],
                        ),
                  // ],

                )
                     :    ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,  //elevated btton background color
                    ),
                    onPressed: () =>
                        controller.processImage(File(controller.photo.value!.path)),

                    icon: const Icon(
                      Icons.photo_library_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'scan your pic'.tr,
                      style: const TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                    ) ),)

                ],
            ):


                Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,  //elevated btton background color
                      ),
                      onPressed: () =>
                          controller.pickImage(fromGallery: true),
                      icon: const Icon(
                        Icons.photo_library_outlined,
                        color: Colors.white,
                      ),
                      label: Text(
                        'from_gallery'.tr,
                        style: const TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      )),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary:Colors.white,
                      ),
                      onPressed: () =>
                          controller.pickImage(fromGallery: false),
                      icon: const Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.red,
                      ),
                      label: Text(
                        'from_camera'.tr,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500, fontSize: 16.0),
                      ))
                  ],
                ),
              ),
                 ...List.generate(controller.userData.length, (index) =>
                     CustomTextField(
                      prefixIcon: Icons.account_circle_outlined,
                      label: controller.userData[index]['hint'],
                      hint: controller.userData[index]['hint'],
                      type: TextInputType.name,
                      onChange: (v) {

                       controller.userData[index]['controller'];

                    },
                   ),
                  ),

                Obx(()=> DefaultBtn(
                      title:controller.isLoading.value==true?'loading...': 'Send Data'.tr,
                      onTap: () =>controller.addUserToGoogleSheet().then((v){Get.to(NextPage());}),
                      loading: false),)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

