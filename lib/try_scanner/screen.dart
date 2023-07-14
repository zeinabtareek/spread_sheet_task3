// import 'package:flutter/cupertino.dart';
//
// import 'package:cnic_scanner/model/cnic_model.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'src/app_color.dart';
// // import 'src/custom_dialog.dart';
// import 'package:cnic_scanner/cnic_scanner.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// // import 'package:fluttaertoast/fluttertoast.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController nameTEController = TextEditingController(),
//       cnicTEController = TextEditingController(),
//       dobTEController = TextEditingController(),
//       doiTEController = TextEditingController(),
//       doeTEController = TextEditingController();
//
//   /// you're required to initialize this model class as method you used
//   /// from this package will return a model of CnicModel type
//   CnicModel _cnicModel = CnicModel();
//
//   Future<void> scanCnic(ImageSource imageSource) async {
//     /// you will need to pass one argument of "ImageSource" as shown here
//     CnicModel cnicModel =
//     await CnicScanner().scanImage(imageSource: imageSource);
//     if (cnicModel == null) return;
//     setState(() {
//       _cnicModel = cnicModel;
//       nameTEController.text = _cnicModel.cnicHolderName;
//       cnicTEController.text = _cnicModel.cnicNumber;
//       dobTEController.text = _cnicModel.cnicHolderDateOfBirth;
//       doiTEController.text = _cnicModel.cnicIssueDate;
//       doeTEController.text = _cnicModel.cnicExpiryDate;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         body: Container(
//           margin: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 18,
//               ),
//               Text('Enter ID Card Details',
//                   style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 23.0,
//                       fontWeight: FontWeight.bold)),
//               SizedBox(
//                 height: 5,
//               ),
//               Text('To verify your Account, please enter your CNIC details.',
//                   style: TextStyle(
//                       color: Colors.red,
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.w500)),
//               SizedBox(
//                 height: 35,
//               ),
//               Expanded(
//                 child: ListView(
//                   padding: const EdgeInsets.all(0),
//                   shrinkWrap: true,
//                   children: [
//                     _dataField(
//                         text: 'Name', textEditingController: nameTEController),
//                     _cnicField(textEditingController: cnicTEController),
//                     _dataField(
//                         text: 'Date of Birth',
//                         textEditingController: dobTEController),
//                     _dataField(
//                         text: 'Date of Card Issue',
//                         textEditingController: doiTEController),
//                     _dataField(
//                         text: 'Date of Card Expire',
//                         textEditingController: doeTEController),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     _getScanCNICBtn(),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// these are my custom designs you can use according to your ease
//   Widget _cnicField({required TextEditingController textEditingController}) {
//     return Card(
//       elevation: 7,
//       margin: const EdgeInsets.only(top: 2.0, bottom: 5.0),
//       child: Container(
//         margin:
//         const EdgeInsets.only(top: 2.0, bottom: 1.0, left: 0.0, right: 0.0),
//         child: IntrinsicHeight(
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 width: 3,
//                 height: 45,
//                 margin: const EdgeInsets.only(left: 3.0, right: 7.0),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [
//                           Colors.white24,
//                           Colors.green,
//                           Colors.black45,
//                       ],
//                       stops: [
//                         0.0,
//                         0.5,
//                         1.0
//                       ],
//                       tileMode: TileMode.mirror,
//                       end: Alignment.bottomCenter,
//                       begin: Alignment.topRight),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//               ),
//               Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'CNIC Number',
//                         style: TextStyle(
//                             color:  Colors.green,
//                             fontSize: 13.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Row(
//                         children: [
//                           Image.asset("assets/images/cnic.png",
//                               width: 40, height: 30),
//                           Expanded(
//                             child: TextField(
//                               controller: textEditingController,
//                               decoration: InputDecoration(
//                                 hintText: '41000-0000000-0',
//                                 hintStyle: TextStyle(color: Colors.green,),
//                                 border: InputBorder.none,
//                                 isDense: true,
//                                 contentPadding: EdgeInsets.only(left: 5.0),
//                               ),
//                               style: TextStyle(
//                                   color:  Colors.grey,
//                                   fontWeight: FontWeight.bold),
//                               textInputAction: TextInputAction.done,
//                               keyboardType: TextInputType.number,
//                               textAlign: TextAlign.left,
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _dataField(
//       {required String text,
//         required TextEditingController textEditingController}) {
//     return Card(
//         shadowColor:Colors.indigo,
//         elevation: 5,
//         margin: const EdgeInsets.only(
//           top: 10,
//           bottom: 5,
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 5),
//               child: Icon(
//                 (text == "Name") ? Icons.person : Icons.date_range,
//                 color:Colors.indigo,
//                 size: 17,
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Padding(
//                     padding:
//                     const EdgeInsets.only(left: 15.0, top: 5, bottom: 3),
//                     child: Text(
//                       text.toUpperCase(),
//                       style: TextStyle(
//                           color: Colors.white10,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 15.0, bottom: 5),
//                     child: TextField(
//                       controller: textEditingController,
//                       decoration: InputDecoration(
//                         hintText: (text == "Name") ? "User Name" : 'DD/MM/YYYY',
//                         border: InputBorder.none,
//                         isDense: true,
//                         hintStyle: TextStyle(
//                             color: Colors.indigo,
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold),
//                         contentPadding: EdgeInsets.all(0),
//                       ),
//                       style: TextStyle(
//                           color: Colors.indigo,
//                           fontWeight: FontWeight.bold),
//                       textInputAction: TextInputAction.done,
//                       keyboardType: (text == "Name")
//                           ? TextInputType.text
//                           : TextInputType.number,
//                       textAlign: TextAlign.left,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
//
//   // Widget _getScanCNICBtn() {
//   //   return TextButton(
//   //     // elevation: 5,
//   //     // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//   //     onPressed: () {
//   //       /// this is the custom dialog that takes 2 arguments "Camera" and "Gallery"
//   //       showDialog(
//   //           context: context,
//   //           builder: (BuildContext context) {
//   //             return
//   //               CustomDialogBox(onCameraBTNPressed: () {
//   //                 scanCnic(ImageSource.camera);
//   //               },
//   //                   onGalleryBTNPressed: () {
//   //               scanCnic(ImageSource.gallery);
//   //             });
//   //           });
//   //     },
//   //     child: Container(
//   //       alignment: Alignment.center,
//   //       width: 500,
//   //       decoration: BoxDecoration(
//   //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//   //         gradient: LinearGradient(colors: <Color>[
//   //           Colors.indigo,
//   //           Colors.orange,
//   //           Colors.green,
//   //         ]),
//   //       ),
//   //       padding: const EdgeInsets.all(12.0),
//   //       child: Text('Scan CNIC', style: TextStyle(fontSize: 18)),
//   //     ),
//   //   );
//   // }
//   Widget _getScanCNICBtn() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         elevation: 5,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         textStyle: TextStyle(color: Colors.white),
//         padding: EdgeInsets.all(0.0),
//       ),
//       onPressed: () {
//         /// this is the custom dialog that takes 2 arguments "Camera" and "Gallery"
//         showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return CustomDialogBox(onCameraBTNPressed: () {
//                 scanCnic(ImageSource.camera);
//               }, onGalleryBTNPressed: () {
//                 scanCnic(ImageSource.gallery);
//               });
//             });
//       },
//       // textColor: Colors.white,
//       // padding: EdgeInsets.all(0.0),
//       child: Container(
//         alignment: Alignment.center,
//         width: 500,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           gradient: LinearGradient(colors: <Color>[
//             Colors.grey,
//             Colors.red,
//              Colors.green,
//           ]),
//         ),
//         padding: const EdgeInsets.all(12.0),
//         child: Text('Scan CNIC', style: TextStyle(fontSize: 18)),
//       ),
//     );
//   }
//
// }
//
// class CustomDialogBox extends StatelessWidget {
//   final VoidCallback onCameraBTNPressed;
//   final VoidCallback onGalleryBTNPressed;
//
//   const CustomDialogBox({
//     Key? key,
//     required this.onCameraBTNPressed,
//     required this.onGalleryBTNPressed,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//       child: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   'Choose an option',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: onCameraBTNPressed,
//                   child: Text('Camera'),
//                 ),
//               ),
//               SizedBox(height: 16),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: onGalleryBTNPressed,
//                   child: Text('Gallery'),
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // library cnic_scanner;
// //
// // import 'package:flutter/material.dart';
// // import 'package:google_ml_kit/google_ml_kit.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:intl/intl.dart';
// // import 'package:fluttertoast/fluttertoast.dart';
// // import 'model/cnic_model.dart';
//
// // class CnicScanner {
// //   /// it will pick your image either form Gallery or from Camera
// //   final ImagePicker _picker = ImagePicker();
// //
// //   /// it will check the image source
// //   late ImageSource source;
// //
// //   /// a model class to store cnic data
// //   CnicModel _cnicDetails = CnicModel();
// //
// //   /// this var track record which side has been scanned
// //   /// and which needed to be scanned and prompt user accordingly
// //   bool isFrontScan = false;
// //
// //   /// this method will be called when user uses this package
// //   Future<CnicModel> scanImage({required ImageSource imageSource}) async {
// //     source = imageSource;
// //     XFile? image = await _picker.pickImage(source: imageSource);
// //     if (image == null) {
// //       return Future.value(_cnicDetails);
// //     } else {
// //       return await scanCnic(imageToScan: InputImage.fromFilePath(image.path));
// //     }
// //   }
// //
// //   /// this method will process the images and extract information from the card
// //   Future<CnicModel> scanCnic({required InputImage imageToScan}) async {
// //     List<String> cnicDates = [];
// //     // GoogleMlKit.vision.languageModelManager();
// //     TextRecognizer textDetector = GoogleMlKit.vision.textRecognizer();
// //     final RecognizedText recognisedText =
// //     await textDetector.processImage(imageToScan);
// //     bool isNameNext = false;
// //     for (TextBlock block in recognisedText.blocks) {
// //       for (TextLine line in block.lines) {
// //         if (isNameNext) {
// //           _cnicDetails.cnicHolderName = line.text;
// //           isNameNext = false;
// //         }
// //         if (line.text.toLowerCase() == "name" ||
// //             line.text.toLowerCase() == "nane" ||
// //             line.text.toLowerCase() == "nam" ||
// //             line.text.toLowerCase() == "ame") {
// //           isNameNext = true;
// //         }
// //         for (TextElement element in line.elements) {
// //           String selectedText = element.text;
// //           if (selectedText.length == 15 &&
// //               selectedText.contains("-", 5) &&
// //               selectedText.contains("-", 13)) {
// //             _cnicDetails.cnicNumber = selectedText;
// //           } else if (selectedText.length == 10 &&
// //               ((selectedText.contains("/", 2) &&
// //                   selectedText.contains("/", 5)) ||
// //                   (selectedText.contains(".", 2) &&
// //                       selectedText.contains(".", 5)))) {
// //             cnicDates.add(selectedText.replaceAll(".", "/"));
// //           }
// //         }
// //       }
// //     }
// //     if (cnicDates.length > 0 &&
// //         _cnicDetails.cnicExpiryDate.length == 10 &&
// //         !cnicDates.contains(_cnicDetails.cnicExpiryDate)) {
// //       cnicDates.add(_cnicDetails.cnicExpiryDate);
// //     }
// //     if (cnicDates.length > 0 &&
// //         _cnicDetails.cnicIssueDate.length == 10 &&
// //         !cnicDates.contains(_cnicDetails.cnicIssueDate)) {
// //       cnicDates.add(_cnicDetails.cnicIssueDate);
// //     }
// //     if (cnicDates.length > 0 &&
// //         _cnicDetails.cnicExpiryDate.length == 10 &&
// //         !cnicDates.contains(_cnicDetails.cnicExpiryDate)) {
// //       cnicDates.add(_cnicDetails.cnicExpiryDate);
// //     }
// //     if (cnicDates.length > 1) {
// //       cnicDates = sortDateList(dates: cnicDates);
// //     }
// //     if (cnicDates.length == 1 &&
// //         _cnicDetails.cnicHolderDateOfBirth.length != 10) {
// //       _cnicDetails.cnicHolderDateOfBirth = cnicDates[0];
// //       isFrontScan = true;
// //       Fluttertoast.showToast(
// //           msg: "Scan Back Side Now",
// //           toastLength: Toast.LENGTH_SHORT,
// //           gravity: ToastGravity.BOTTOM,
// //           backgroundColor: Colors.grey,
// //           textColor: Colors.white,
// //           fontSize: 16.0);
// //     } else if (cnicDates.length == 2) {
// //       _cnicDetails.cnicIssueDate = cnicDates[0];
// //       _cnicDetails.cnicExpiryDate = cnicDates[1];
// //       if (!isFrontScan)
// //         Fluttertoast.showToast(
// //             msg: "Scan Front Side Now",
// //             toastLength: Toast.LENGTH_SHORT,
// //             gravity: ToastGravity.BOTTOM,
// //             backgroundColor: Colors.grey,
// //             textColor: Colors.white,
// //             fontSize: 16.0);
// //     } else if (cnicDates.length == 3) {
// //       _cnicDetails.cnicHolderDateOfBirth = cnicDates[0].replaceAll(".", "/");
// //       _cnicDetails.cnicIssueDate = cnicDates[1].replaceAll(".", "/");
// //       _cnicDetails.cnicExpiryDate = cnicDates[2].replaceAll(".", "/");
// //     }
// //     textDetector.close();
// //     if (_cnicDetails.cnicNumber.length > 0 &&
// //         _cnicDetails.cnicHolderDateOfBirth.length > 0 &&
// //         _cnicDetails.cnicIssueDate.length > 0 &&
// //         _cnicDetails.cnicExpiryDate.length > 0) {
// //       print('==================== SMART CARD DETAILS $_cnicDetails');
// //       return Future.value(_cnicDetails);
// //     } else {
// //       print('==================== OLD CARD DETAILS $_cnicDetails');
// //       return await scanImage(imageSource: source);
// //     }
// //   }
// //
// //   /// it will sort the dates
// //   static List<String> sortDateList({required List<String> dates}) {
// //     List<DateTime> tempList = [];
// //     DateFormat format = DateFormat("dd/MM/yyyy");
// //     for (int i = 0; i < dates.length; i++) {
// //       tempList.add(format.parse(dates[i]));
// //     }
// //     tempList.sort((a, b) => a.compareTo(b));
// //     dates.clear();
// //     for (int i = 0; i < tempList.length; i++) {
// //       dates.add(format.format(tempList[i]));
// //     }
// //     return dates;
// //   }
// // }