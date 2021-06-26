import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawer.dart';
import 'package:mezcalmos/Shared/utilities/GlobalUtilities.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSideMenu.dart';
import 'package:mezcalmos/Shared/widgets/MezcalmosSwitch.dart';
import 'package:mezcalmos/Shared/widgets/UsefullWidgets.dart';
import 'package:mezcalmos/TaxiApp/controllers/orderController.dart';
import 'package:mezcalmos/TaxiApp/helpers/InjectionHelper.dart';

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) 
  {
    final sw    = MediaQuery.of(context).size.width;
    final sh    = MediaQuery.of(context).size.height;

    // ----------------------DI-----------------------

    // INJECTING OUR NEEDED CONTROLLERS

    TaxiInjectionHelper.toInjectAtHome();
    
    // USING FIND TO INITILIZE THE CONTROLLERS INJECTED USING LAZYPUT!

    OrderController           _orderController            = Get.find<OrderController>();
    SideMenuDraweController   _sideMenuDrawerController   = Get.find<SideMenuDraweController>();

    // ------------------------------------------------
    //    
    return Scaffold(
      key: _sideMenuDrawerController.scaffoldKey,
      drawer: MezcalmosSideMenu(),
      
      backgroundColor: Colors.white,
      appBar: MezcalmosSharedWidgets.mezcalmosAppBar(_sideMenuDrawerController.openMenu),
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
                    itemCount:  _orderController.orders.length,
                    itemBuilder: (ctx , i)
                    {
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
                                  maxRadius: getSizeRelativeToScreen(60, sw, sh),
                                  minRadius: getSizeRelativeToScreen(59, sw, sh),
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage(_orderController.orders[i].customer['image']),
                                  onBackgroundImageError: (e, s) => print("Failed loading Customer openOrder::id::${_orderController.orders[i].id}"),
                                ),
                              ),
                      
                              Positioned(
                                left: getSizeRelativeToScreen(150, sw, sh),
                                top:getSizeRelativeToScreen(10, sw, sh),
                                child:  Text(_orderController.orders[i].customer['name'] ?? tDefaultCustomerName,
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
                                    Text(_orderController.orders[i].from['address'].toString().substring(0 , 10)+"... ",
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
                                    Text(_orderController.orders[i].routeInformation['distance']['text'] ?? "? km",
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
                                    Text(_orderController.orders[i].routeInformation['duration']['text'] ?? "? mins",
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