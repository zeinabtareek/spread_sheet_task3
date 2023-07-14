// import 'package:flutter_tesseract_ocr/android_ios.dart';
// import 'interface/text_recognizer.dart';
//
// // class TesseractTextRecognizer extends ITextRecognizer {
// //   @override
//   // Future<String> processImage(String imgPath) async {
//   //   final res = await FlutterTesseractOcr.extractText(imgPath, args: {
//   //     "psm": "4",
//   //     "preserve_interword_spaces": "1",
//   //   });
//   //   print("----- Res");
//   //   print(res);
//   //   return res;
//   // }
//

  import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
  import 'interface/text_recognizer.dart';

  class TesseractTextRecognizer extends ITextRecognizer {
  @override
  Future<String> processImage(String imgPath) async {
  final tessdata = "assets/tessdata";
  final res = await FlutterTesseractOcr.extractText(imgPath,
    language: 'eng',
    // language: 'eng+ara',
     args: {
  "psm": "4",
  "preserve_interword_spaces": "1",
  // "tessedit_char_whitelist": "٠١٢٣٤٥٦٧٨٩",

     },);
  print("----- Res");
  print(res);
  return res;
  }
  // }
}