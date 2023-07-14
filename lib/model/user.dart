class UserFields{
  static  String id='id';
  static   String fName='fName';
  static   String lName='lName';
  static   String area='area';
  static   String address='address';
  static   String landline='landline';
  static   String mobile='mobile';
  static   String fImage='fImage';

  static List <String > getField()=>[id,fName,lName,landline,area,address,mobile,fImage];

}

class User {
    final int ?id;
    final String fName;
    final String lName;
    final String area;
    final String address;
    final String landline;
    final   fImage;
    final String mobile;
    User({
      this.id,
      required this.address,
      required this.fName,
      required this.landline,
      required this.fImage,
      required this.lName,
      required this.mobile,
      required this.area,
    });

    toJson()=>{
      UserFields.id:id,
      UserFields.fName:fName,
      UserFields.lName:lName,
      UserFields.landline:landline,
      UserFields.fImage:fImage,
      UserFields.mobile:mobile,
      UserFields.area:area,
      UserFields.address:address,
    };

}