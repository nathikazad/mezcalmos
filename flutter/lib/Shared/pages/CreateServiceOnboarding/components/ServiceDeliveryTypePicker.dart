import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/models/Services/ServiceInput.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';

class ServiceDeliveryTypePicker extends StatelessWidget {
  const ServiceDeliveryTypePicker({super.key, required this.viewController});
  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<ServiceDeliveryType>(
        builder: (FormFieldState<ServiceDeliveryType> state) {
          return Obx(
            () => InputDecorator(
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.grey.shade200,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none),
                focusedBorder: InputBorder.none,

                isDense: true,
                // contentPadding: EdgeInsets.all(5),

                floatingLabelBehavior: FloatingLabelBehavior.never,
                // suffixIcon: (widget.showDeleteIcon &&
                //         widget.languageValue.value != null)
                //     ? IconButton(
                //         onPressed: () {
                //           widget.languageValue.value = null;
                //         },
                //         icon: Icon(Icons.close))
                //     : null,
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<ServiceDeliveryType>(
                  value: viewController.serviceInput.value.deliveryType,
                  isDense: true,
                  dropdownColor: Colors.white,
                  onChanged: (ServiceDeliveryType? value) {
                    viewController.switchDeliveryType(value);
                  },
                  items: [
                    ServiceDeliveryType.Self_delivery,
                    ServiceDeliveryType.Delivery_Partner,
                  ].map((ServiceDeliveryType value) {
                    return DropdownMenuItem<ServiceDeliveryType>(
                      value: value,
                      child: (value.toNormalString() != null)
                          ? Text(
                              value.toNormalString(),
                              style: Get.textTheme.bodyText2?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          : Container(),
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
