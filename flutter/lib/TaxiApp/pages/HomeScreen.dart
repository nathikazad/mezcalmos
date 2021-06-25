import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';

class HomeScreen extends GetWidget<AuthController> {

  @override
  Widget build(BuildContext context) 
  {
    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;


    // Injecting OrderController at this Node.
    OrderController _orderController  = Get.put(OrderController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(),

      body: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            margin: EdgeInsets.only(left: getSizeRelativeToScreen(40, sw, sh) , right: getSizeRelativeToScreen(40, sw, sh)),
            child:  Container(

              height: getSizeRelativeToScreen(300, sw, sh),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Transform.scale(
                      scale: 1.15,
                      child: Text(
                        "Incomming Orders", 
                        style: TextStyle(
                          fontSize: getSizeRelativeToScreen(70, sw, sh),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                      child: MezcalmosSwitch(
                        values: ['on', 'off'],
                        onToggleCallback: (v) => print(v),
                        buttonColor: Colors.green,
                        backgroundColor: Colors.transparent,
                        textColor: const Color(0xFFFFFFFF),
                    )
                  )
                ],

              ),
            ) ,
          ),

          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: getSizeRelativeToScreen(40, sw, sh) , right: getSizeRelativeToScreen(40, sw, sh)),
              child: Obx(() => ListView.builder(
                  itemCount:  _orderController.orders.length,
                  itemBuilder: (ctx , i)
                  {

                    print(" List Len >>>>>>>>>>>... "+_orderController.orders.length.toString());
                    // return Text(_orderController.orders[i].id);
                    return GestureDetector(
                      onTap: () => print("Clicked on order::${_orderController.orders[i].id}"),
                      child: Container(
                        color: Colors.transparent,
                        padding:EdgeInsets.only(top: 10 , bottom: 10) ,
                        alignment: Alignment.centerLeft,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.centerLeft,
                          children: [
                    
                            Positioned(
                              child: CircleAvatar(
                                maxRadius: 30,
                                minRadius: 20,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(_orderController.orders[i].customer['image']),
                                onBackgroundImageError: (e, s) => print("Failed loading Customer openOrder::id::${_orderController.orders[i].id}"),
                              ),
                            ),
                    
                            Positioned(
                              left: 70,
                              top:5,
                              child:  Text(_orderController.orders[i].customer['name'] ?? "...",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                                ),
                              )
                            ),
                    
                            // info line                          
                            Positioned(
                              left: 70,
                              bottom:10,
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                    
                                children: [
                    
                                  Icon(Icons.location_on_outlined, size: 15),
                                  Text(_orderController.orders[i].from['address'].toString().substring(0 , 10)+"... ",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    ),
                                  ),
                    
                                  Icon(Icons.my_location_rounded , size: 15),
                                  SizedBox(width: 2,),
                                  Text("0 km",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    ),
                                  ),
                    
                    
                                  SizedBox(width: 5,),
                                  Icon(Icons.social_distance , size: 15),
                                  SizedBox(width: 2,),
                                  Text(_orderController.orders[i].routeInformation['distance']['text'] ?? "~ km",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    ),
                                  ),
                    
                                  Icon(Icons.timer , size: 15),
                                  SizedBox(width: 2,),
                                  Text(_orderController.orders[i].routeInformation['duration']['text'] ?? "? mins",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13
                                    ),
                                  ),
                                ]                           
                              )
                            ),
                    
                          ],
                        ),
                      ),
                    );
          
                  }
                )
              ),
            ),

          )
        ],
      ),
     
      // body: Container(height : double.infinity , child: Center(
        
      //   // Putting OBX here since, we're using length of orders , which will be changing
      //   child: Obx(() => ListView.builder(itemCount:  _orderController.orders.length, itemBuilder: (ctx , i){

      //     print(" List Len >>>>>>>>>>>... "+_orderController.orders.length.toString());
      //     return Text(_orderController.orders[i].id);
          
      //   },)),

      // )),
      
    );
  }
}