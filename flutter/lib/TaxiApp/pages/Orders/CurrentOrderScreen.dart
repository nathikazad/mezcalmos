import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/TaxiApp/controllers/currentOrderController.dart';

class CurrentOrderScreen extends GetView<CurrentOrderController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.id == null ? Center(child: CircularProgressIndicator()) : Center(child: Container(

      alignment: Alignment.center,
      color: Colors.white,
      
      child: Flex(direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Flexible(child: Text('CURRENT ORDER ID :')),
          SizedBox(height: 20,),
          Flexible(child: Text(controller.id)),
          SizedBox(height: 50,),
          TextButton(onPressed: () async => await controller.cancelTaxi("Testing purposes !"), child: Text("CANCEL TAXI" , style: TextStyle(color: Colors.white , fontSize: 20),),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
              backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed: () async => await controller.startRide(), child: Text("START RIDE" , style: TextStyle(color: Colors.white , fontSize: 20),),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
              backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
          ),
          SizedBox(height: 20,),
          TextButton(onPressed:  () async => await controller.finishRide() , child: Text("FINISH RIDE" , style: TextStyle(color: Colors.white , fontSize: 20),),
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(200, 50)) ,
              backgroundColor: MaterialStateProperty.all(Colors.black)
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),

    )));
  }
}
