

class TaxiDriver {
  bool    isAuthorized;
  bool    isLooking;
  String? currentOrder;
  dynamic driverLocation;
  dynamic lastLocationUpdateTime; 


  TaxiDriver(

    this.isAuthorized,
    this.isLooking,
    this.currentOrder,
    this.driverLocation,
    this.lastLocationUpdateTime,

  );


  // Parse Json comming from the server
  TaxiDriver.fromJson(dynamic value)
      : isAuthorized = value['state']['authorizationStatus'] == "authorized",
        isLooking = value['state']['isLooking'] == "true",
        currentOrder = value['state']['currentOrder'],
        driverLocation = value['driverLocation'],
        lastLocationUpdateTime = value['lastLocationUpdateTime'];



  // Added for Debugging Perposes - Don't delete for now
  Map<String, dynamic> toJson() => {    
    "authorizationStatus": isAuthorized,
    "isLooking"               : isLooking,
    "currentOrder"            : currentOrder,
    "driverLocation"          : driverLocation,
    "lastLocationUpdateTime"  : lastLocationUpdateTime

  };
  

}