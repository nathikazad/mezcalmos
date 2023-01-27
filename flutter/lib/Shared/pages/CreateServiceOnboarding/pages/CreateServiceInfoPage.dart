import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/constants/global.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServiceProviderType.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/components/CreateServiceImageComponent.dart';
import 'package:mezcalmos/Shared/pages/CreateServiceOnboarding/controllers/CreateServiceViewController.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';

class CreateServiceInfoPage extends StatelessWidget {
  const CreateServiceInfoPage({
    Key? key,
    required this.viewController,
  }) : super(key: key);

  final CreateServiceViewController viewController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreateServiceImageComponent(viewController: viewController),
          SizedBox(
            height: 25,
          ),
          Text(
            "${viewController.serviceType.toNormalString()} Name",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: viewController.serviceName,
            decoration: InputDecoration(
                hintText:
                    "Your ${viewController.serviceType.toNormalString()} name"),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            "${viewController.serviceType.toNormalString()} Location",
            style: Get.textTheme.bodyText1,
          ),
          SizedBox(
            height: 10,
          ),
          _locationCard(),
        ],
      ),
    );
  }

  Widget _locationCard() {
    return Obx(
      () => Card(
        color: Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            final Location? newLoc =
                await MezRouter.toNamed(kPickLocationNew) as Location?;

            if (newLoc != null) {
              viewController.setNewLocation(newLoc);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            child: Row(
              children: [
                Icon(
                  Icons.place_rounded,
                  color: primaryBlueColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                    flex: 5,
                    fit: FlexFit.tight,
                    child: Text(
                      viewController.newLocation.value?.address ??
                          'Pick new location',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primaryBlueColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
