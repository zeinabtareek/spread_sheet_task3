
import 'package:gsheets/gsheets.dart';
import 'package:spread_sheet_task/model/user.dart';

class UsersSheet {
  static final _spreadsheetId = '1NLNiQU3yCvbk4EL2NJBHKIRGILnVJ4WXvqwMIvQB3Zg';
  // static final _spreadsheetId = '1AT10JIcF3to-kVxS67uHM_yGQuPi3_MfOjS_PSa7pfo';
  static final credentials = r'''
{
  "type": "service_account",
  "project_id": "application-e388e",
  "private_key_id": "e4e3d9bac199b9b3ec41e166c971832dc9e6d07b",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD7ERIVThZI3Ud8\nFzDrNwXGfXhSf4j7TD+IbbqUFpN1fJdtJ/Vdy7GIe264NGwFrNHuipU7nenjM8gy\nYgpjiG5kB67558DTdFpYibfBIL9XeM/Jj6nWaEgBXelHnU7mj7VgtIDo14TIJQHD\nBa12qkSVsBzx2l1ehprLwMdDaSKRuU/XX1jXt2VOz9u+AtYnNbDSmOD6snzhyl3f\nJHLJWh2yBdH4qUHjtawiAKOPjudfesb8aDTqeDCrcsHpzfWIPlH3I1hnUwo1yrJA\nN77VqV0x8mTnIU+wLo1DeYupU9vhe542KLpYmBw1nhgC9Dmtu3t+3R5cpdLsZOoI\n7jYxWqq/AgMBAAECggEAZiZBZcKyJW5GnfHvmNv3sRUupd429QvGU7NVdNgkoeoR\n0DswRTvRnTafSzok80An3/aplip/VU4lt34VPP7u7ysDIbGNzlrqQVizF1REFYpV\nfGxDzTT7ivbTKaySxBMXWGPIiTPa1fXcnCUMuRm4svCHLk3KrGF2zMzAJii6BHCD\ngkQsmryfhJhdacigKWDQgRswrd7fPchxhWnJRFhznS3s2TB9BTTxVim18ItizeVL\ninyW8GByRpshOgi3n+lJXbQqT51+3zL41CkCJ0bd4j8T8UNpD7HCfFzMEI38XZxo\nKT2UyE3PHXYdRxU9PN4NXTKzWwrJlnXbo5OyUGgoiQKBgQD/Ot9+1NMDX9iIKD1i\nn7lLOxRIoVo85rzdSUVk626e/IRzswGAuWPfnBD2BRsb7o9F4xVgmwHhxSOztRTW\nBAKy12hulHMk4wEiPHY8ELvPL9QAe8HWdgPVFSLc+HfwWOBkEZzAJI2AZKjx+BrT\n71p8IFyXnebE03xS2PVFlMe1lwKBgQD70vtqNgiFsbvEmp/GB1lukvwJIjKFyBq7\n6jJh5XzuyYl4ljPdx0/UkVAN6TfvboTPZnIDbTJlR0+qr/9orZRap/SOarQD+0rJ\n7huSng3fy9YWRAt1c/58p64eDT35POCpgqkxOzPnAwJSyPCPoESgAJAGuxPS66ao\nAPf09HlpGQKBgQCj8rtyC1/owP6kp8SWv6cVDkQ/S3ZdvJIBS3nKE/mhIvAqKgiD\nGZNwJh43CpyZWqqp5+7peWjCEBKY828I8taQ7xHkRnOYdEFcLp58gvtBYaW7EcQ3\n8OMRU1xruSfCOjUZ0r5wJorGuOJVXFxPW2cyaM9RjVqZgIhR54/WPHX0zQKBgQCD\ne1M9z1x/wZ7SNhF56dht/VyOwEY0x5f9yXfo2VNzsdKPHY2THD+4Mu7jdIN6BfBe\nAZVB6L/JVYRpEF+AnjC5bLwpp9i5w3j3GdVXpiKEWP88vOZmutuC5mHo2u0itwBu\nQQRp6gldcprB8px3wSxThjes6/ybweJQEcFlKkhB8QKBgC0S3zYZ3HOpDZJB+nMn\nL31bHB6yEjqN761YcFJcPlN/kErvR5OtT9PVi+4o2svzQLbkxnmST3urEonGd5F4\neRMTmLUaLTztvmA5al0gk2QlUQsFS1JnQVCSjSBHbUIIbsRwHxYqY4QqhHSoDX83\nVWiAANTfzjhAMmIcx8og5nbn\n-----END PRIVATE KEY-----\n",
  "client_email": "taskss@application-e388e.iam.gserviceaccount.com",
  "client_id": "114362132826376399531",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/taskss%40application-e388e.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}

''';

  static final gsheets = GSheets(credentials);
  static Worksheet? _usersheet;

  static Future init() async {
   try{
     final spreadsheet = await gsheets.spreadsheet(_spreadsheetId);
     _usersheet = await _getWorkSheet(spreadsheet, title: 'Users');
     final firstRow=UserFields.getField();
     _usersheet!.values.insertRow(1, firstRow);
   }catch(e){
     print('Init Error $e');
   }
  }

  static Future<Worksheet?> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    }catch(e){
      return   spreadsheet.worksheetByTitle(title);

    }
  }



  static Future insert(List<Map<String,dynamic>>rowList)async{
    if(_usersheet==null)return;
    _usersheet!.values.map.appendRows(rowList);
  }
  static Future<int> getRowCount( ) async{
    if(_usersheet==null) return 0;
    final lastRow =await _usersheet!.values.lastRow();

    if(lastRow == null || lastRow.first == null) return 0;

    try {
      return int.parse(lastRow.first);
    } catch (e) {
      print('Error parsing row count: ${e.toString()}');
      return 0;
    }
  }




}
