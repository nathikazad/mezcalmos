import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezcalmos/RestaurantApp/components/RestaurantOpDrawer.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/components/ROpCreateImagePicker.dart';
import 'package:mezcalmos/RestaurantApp/pages/CreateRestaurantView/controllers/ROpCreateRestuarantViewController.dart';
import 'package:mezcalmos/Shared/MezRouter.dart';
import 'package:mezcalmos/Shared/controllers/sideMenuDrawerController.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/models/Utilities/Location.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
import 'package:mezcalmos/Shared/sharedRouter.dart';
import 'package:mezcalmos/Shared/widgets/AppBar.dart';
import 'package:mezcalmos/Shared/widgets/MezButton.dart';

class ROpCreateRestuarantView extends StatefulWidget {
  const ROpCreateRestuarantView({super.key});

  @override
  State<ROpCreateRestuarantView> createState() =>
      _ROpCreateRestuarantViewState();
}

class _ROpCreateRestuarantViewState extends State<ROpCreateRestuarantView> {
  GlobalKey<FormState> _formKey = GlobalKey();
  ROpCreateRestuarantViewController viewController =
      ROpCreateRestuarantViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mezcalmosAppBar(AppBarLeftButtonType.Menu,
          title: "Create restaurant"),
      key: Get.find<SideMenuDrawerController>().getNewKey(),
      drawer: ROpDrawer(),
      bottomNavigationBar: MezButton(
        withGradient: true,
        borderRadius: 0,
        label: "Create restaurant",
        onClick: () async {
          if (_formKey.currentState?.validate() == true) {
            final ServerResponse res = await viewController.createRestaurant();
            if (res.success) {
              await showStatusInfoDialog(
                context,
                primaryClickTitle: "OK",
                primaryCallBack: () {
                  MezRouter.toNamed(kWrapperRoute);
                },
                status: "Your restaurantis under review",
                description:
                    "You can start adding items to your menu and you’ll be notified once your restaurant is approved.",
              );
              //
            } else {
              Get.snackbar('Error',
                  res.errorMessage ?? "Unkwown error, please try again",
                  backgroundColor: Colors.black,
                  colorText: Colors.white,
                  shouldIconPulse: false,
                  icon: Icon(
                    Icons.error,
                    color: Colors.red,
                  ));
            }
          }
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ROpCreateRestaurantImage(viewController: viewController),
              SizedBox(height: 25),
              Text("Restaurant name"),
              SizedBox(height: 10),
              TextFormField(
                controller: viewController.restaurantName,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "Name is required";
                  }
                  return null;
                },
                style: Get.textTheme.bodyText1,
                decoration: InputDecoration(
                  labelText: "Enter your restaurant name",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              SizedBox(height: 25),
              Text("Description"),
              SizedBox(height: 10),
              TextFormField(
                controller: viewController.restaurantDescription,
                validator: (String? v) {
                  if (v == null || v.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
                style: Get.textTheme.bodyText1,
                decoration: InputDecoration(
                  labelText: "Enter your restaurant description",
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                ),
                maxLines: 6,
                minLines: 4,
              ),
              SizedBox(height: 25),
              Text("Location"),
              SizedBox(height: 10),
              _pickFromMapComponent(context),
              // TextFormField(
              //   controller: viewController.restaurantName,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pickFromMapComponent(BuildContext context) {
    return FormField(validator: (Object? value) {
      if (viewController.restaurantLocation.value == null) {
        return "Location is required";
      }
      return null;
    }, builder: (FormFieldState<Object?> state) {
      return Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () async {
                // ignore: prefer_final_locals
                MezLocation? currentLoc =
                    await MezRouter.toNamed(kPickLocationWithoutAuth)
                        as MezLocation?;
                if (currentLoc != null) {
                  viewController.restaurantLocation.value = currentLoc;
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: (!state.isValid)
                      ? Border.all(width: 0.5, color: Colors.red.shade800)
                      : null,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.place_rounded,
                      color: Theme.of(context).primaryColorLight,
                    ),
                    const SizedBox(width: 5),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        viewController.restaurantLocation.value?.address ??
                            "Pick location",
                        maxLines: 1,
                        style: Get.textTheme.bodyText1,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            if (!state.isValid)
              Container(
                  margin: const EdgeInsets.only(top: 5, left: 22),
                  child: Text(
                    state.errorText ?? "",
                    style: Get.textTheme.subtitle1
                        ?.copyWith(color: Colors.red.shade800),
                  ))
          ],
        ),
      );
    });
  }
}
