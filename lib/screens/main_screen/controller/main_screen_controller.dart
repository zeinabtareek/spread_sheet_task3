import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../model/recognition_response.dart';
import '../../../model/user.dart';
import '../../../services/google_drive_services.dart';
import '../../../services/users_services.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../scan_screen/recognizer/interface/text_recognizer.dart';
import '../../scan_screen/recognizer/mlkit_text_recognizer.dart';
import '../../scan_screen/recognizer/tesseract_text_recognizer.dart';


class MainScreenController extends GetxController{

  final   fName =   ''.obs;
  final   lName =  ''.obs;
  final   address =  ''.obs;
  final   landline =  ''.obs;
  final   mobile =  ''.obs;
  final   area =  ''.obs;
  final   fImage =  ''.obs;
  final   lImage =  ''.obs;
  final   isLoading =  false.obs;
  final Rx<XFile?> photo = XFile("").obs;

   List userData=[].obs;

  late ITextRecognizer _recognizer;

  RecognitionResponse? response;
  @override
    onInit() async{
   // await UsersSheet.init();
    userData= [
      {'hint':'First Name','controller':fName.value.toString(),},
      {'hint':'Last Name','controller':lName.value.toString(),},
      {'hint':' Address','controller':address.value.toString(),},
      {'hint':'Area ','controller':area.value.toString(),},
      {'hint':'Mobile ','controller':mobile.value.toString(),},
      {'hint':'Landline ','controller':landline.value.toString(),},

    ].obs;
    _recognizer = TesseractTextRecognizer();
  }



  @override
  void dispose() {
    super.dispose();
    if (_recognizer is MLKitTextRecognizer) {
      (_recognizer as MLKitTextRecognizer).dispose();
    }
  }

  pickImage({required bool fromGallery}) async {
    final ImagePicker picker = ImagePicker();

    if (fromGallery) {
      photo.value = await picker.pickImage(source: ImageSource.gallery);
    } else {
      photo.value = await picker.pickImage(source: ImageSource.camera);
    }
  }

  //image scan
  void processImage(File imageFile) async {
    final recognizedText = await _recognizer.processImage(imageFile.path);
    response = RecognitionResponse(
      imgPath: imageFile.path,
      recognizedText: recognizedText,
    );

   }
  Future<String> uploadImageAndGetUrl(File imageFile) async {
    final storageRef = firebase_storage.FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.png');
    final uploadTask = storageRef.putFile(imageFile);
    await uploadTask.whenComplete(() {});
    final imageUrl = await storageRef.getDownloadURL();
    return imageUrl;
  }




  addUserToGoogleSheet() async {
    isLoading.value = true;

    // Convert the XFile object to a File object
    final imageFile = File(photo.value!.path);

    // Upload the image and get the download URL
    final imageUrl = await uploadImageAndGetUrl(imageFile);

    var id = await UsersSheet.getRowCount() + 1;
    final user = User(
      id: id,
      fName: fName.value,
      lName: lName.value,
      landline: landline.value,
      mobile: mobile.value,
      area: area.value,
      address: address.value,
      fImage: imageUrl,
    );

    await insertUsers(user);
    sendDataToDrive(user);
    isLoading.value = false;
  }
  insertUsers(User user)async{
    await UsersSheet.insert([user.toJson()]);
  }


}