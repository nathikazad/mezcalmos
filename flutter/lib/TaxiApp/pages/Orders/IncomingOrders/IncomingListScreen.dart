import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/incomingOrdersController.dart';
import 'package:mezcalmos/TaxiApp/routes/SimpleRouter.dart';

class IncomingOrdersScreen extends GetView<IncomingOrdersController> {
  @override
  Widget build(BuildContext context) {

    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;
    print( "---------------- orders len > ${controller.orders.length}");
    return Column(
        
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
                        tIncommingOrders, 
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

              // Removed the Native Glow Effect on list !
              child: Obx(() => MezcalmosSharedWidgets.MezcalmosNoGlowScrollConfiguration(
                  ListView.builder(
                    itemCount:  controller.orders.length,
                    itemBuilder: (ctx , i)
                    {
                      return GestureDetector(
                        onTap: () async {
                            print("Clicked on order::${controller.orders[i].id}");
                            controller.setSelectedIncommingOrder(controller.orders[i]);
                            Get.toNamed(kSelectedIcommingOrder);
                        },
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
                                  maxRadius: getSizeRelativeToScreen(60, sw, sh),
                                  minRadius: getSizeRelativeToScreen(59, sw, sh),
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(controller.orders[i].customer['image']),
                                  onBackgroundImageError: (e, s) => print("Failed loading Customer openOrder::id::${controller.orders[i].id}"),
                                ),
                              ),
                      
                              Positioned(
                                left: getSizeRelativeToScreen(150, sw, sh),
                                top:getSizeRelativeToScreen(10, sw, sh),
                                child:  Text(controller.orders[i].customer['name'] ?? tDefaultCustomerName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getSizeRelativeToScreen(40, sw, sh)
                                  ),
                                )
                              ),
                      
                              // info line                          
                              Positioned(
                                left: getSizeRelativeToScreen(148, sw, sh),
                                bottom: getSizeRelativeToScreen(20, sw, sh),
                                child:  Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                      
                                  children: [
                      
                                    Icon(Icons.location_on_outlined, size: getSizeRelativeToScreen(32, sw, sh)),
                                    Text(controller.orders[i].from['address'].toString().substring(0 , 10)+"... ",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:  getSizeRelativeToScreen(25, sw, sh)
                                      ),
                                    ),
                      
                                    Icon(Icons.my_location_rounded , size: getSizeRelativeToScreen(32, sw, sh)),
                                    SizedBox(width: 2,),
                                    Text("0 km",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: getSizeRelativeToScreen(25, sw, sh)
                                      ),
                                    ),
                      
                      
                                    SizedBox(width: 5,),
                                    Icon(Icons.social_distance , size: getSizeRelativeToScreen(32, sw, sh)),
                                    SizedBox(width: 2,),
                                    Text(controller.orders[i].routeInformation['distance']['text'] ?? "? km",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: getSizeRelativeToScreen(25, sw, sh)
                                      ),
                                    ),
                      
                                    Icon(Icons.timer , size: getSizeRelativeToScreen(32, sw, sh)),
                                    SizedBox(width: 2,),
                                    Text(controller.orders[i].routeInformation['duration']['text'] ?? "? mins",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      softWrap: false,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: getSizeRelativeToScreen(25, sw, sh)
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
                  ),
              )
              ),
            ),

          )
        ],
      );
  }
}
