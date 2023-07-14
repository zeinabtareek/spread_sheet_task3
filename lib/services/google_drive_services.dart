
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:google_sign_in/google_sign_in.dart' as signIn;
import 'package:spread_sheet_task/model/user.dart';
// import '../model/user.dart';
import '../services/google_auth_client.dart';
import 'dart:convert';
Future<void> sendDataToDrive(User user) async {
  final googleSignIn = signIn.GoogleSignIn.standard(scopes: [drive.DriveApi.driveScope]);
  final signIn.GoogleSignInAccount? account = await googleSignIn.signIn();
  print("User account $account");
  final authHeaders = await account?.authHeaders;
  final authenticateClient = GoogleAuthClient(authHeaders!);
  final driveApi = drive.DriveApi(authenticateClient);

  // Get the most recently modified folder in the user's Google Drive account
  final folderList = await driveApi.files.list(q: "mimeType='application/vnd.google-apps.folder'", orderBy: "modifiedTime desc", pageSize: 1);
  final folderId = folderList.files!.first.id;


  final usersCsv = 'The user data :\n${user.fName},${user.lName},${user.landline},${user.mobile},${user.id},${user.address}\n';
  final csvBytes = utf8.encode(usersCsv);
  final mediaStream = Stream.fromIterable([csvBytes]);

  // Upload the CSV file to the most recently modified folder in the user's Google Drive account
  final media = drive.Media(mediaStream, csvBytes.length);
  final driveFile = drive.File();
  driveFile.name = "users.csv";
  driveFile.parents = [];
  driveFile.mimeType = 'text/csv';
  final result = await driveApi.files.create(driveFile, uploadMedia: media);
  print("Upload result: $result");
}