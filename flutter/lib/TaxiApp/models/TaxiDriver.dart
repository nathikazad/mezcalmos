

class TaxiDriver {

  // we might use some ModelHelpers Afterwards (Serialization) for easy access .
  final String  id;
  final String  fname;
  final String  lname;
  final image;

  bool    authorizationStatus;
  bool    isLooking;
  dynamic currentOrder;
  dynamic driverLocation;
  dynamic lastLocationUpdateTime; 


  TaxiDriver(
    this.id, 
    this.fname, 
    this.lname, 
    this.image,

    this.authorizationStatus,
    this.isLooking,
    this.currentOrder,
    this.driverLocation,
    this.lastLocationUpdateTime,

  );


  // Parse Json comming from the server
  TaxiDriver.fromJson(Map<String, dynamic> json) :

    id                      = json['id'],
    fname                   = json['fname'],
    lname                   = json['lname'],
    image                   = json['image'],

    authorizationStatus     = json['authorizationStatus'],
    isLooking               = json['isLooking'],
    currentOrder            = json['currentOrder'],
    driverLocation          = json['driverLocation'],
    lastLocationUpdateTime  = json['lastLocationUpdateTime'];



  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() =>  {

    "id"                      : id,
    "fname"                   : fname,
    "lname"                   : lname,
    "image"                   : image,
    
    "authorizationStatus"     : authorizationStatus,
    "isLooking"               : isLooking,
    "currentOrder"            : currentOrder,
    "driverLocation"          : driverLocation,
    "lastLocationUpdateTime"  : lastLocationUpdateTime

  };
  

}