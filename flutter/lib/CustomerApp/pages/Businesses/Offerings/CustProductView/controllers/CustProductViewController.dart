import 'package:get/get.dart';
import 'package:mezcalmos/CustomerApp/controllers/custBusinessCartController.dart';
import 'package:mezcalmos/CustomerApp/models/BusinessCartItem.dart';
import 'package:mezcalmos/CustomerApp/pages/CustCartView/CustCartView.dart';
import 'package:mezcalmos/Shared/cloudFunctions/model.dart';
import 'package:mezcalmos/Shared/controllers/authController.dart';
import 'package:mezcalmos/Shared/graphql/business_product/hsBusinessProduct.dart';
import 'package:mezcalmos/Shared/models/Services/Business/Business.dart';
import 'package:mezcalmos/Shared/helpers/GeneralPurposeHelper.dart';
import 'package:mezcalmos/Shared/pages/AuthScreens/SignInScreen.dart';

class CustProductViewController {
  CustBusinessCartController? custBusinessCartController =
      Get.find<AuthController>().isUserSignedIn
          ? Get.find<CustBusinessCartController>()
          : null;
  // state vars //
  Rxn<ProductWithBusinessCard> _product = Rxn<ProductWithBusinessCard>();
  Rx<double> totalOrderCost = Rx(0);
  Rx<int> _totalUnits = Rx(1);
  Rxn<Map<TimeUnit, num>> _timeCost = Rxn();
  Rxn<bool> isOnlineOrdering = Rxn<bool>(false);

  // getters //
  ProductWithBusinessCard? get product => _product.value;
  Rx<int> get totalUnits => _totalUnits;
  Rxn<Map<TimeUnit, num>> get timeCost => _timeCost;
  // methods //
  Future<void> fetchData({required int productId}) async {
    _product.value = await get_product_by_id(id: productId, withCache: false);
    isOnlineOrdering.value = product!.business.onlineOrdering;
    _setInitialTimeCost();
    _calcTotalOrderCost();
  }

  void _setInitialTimeCost() {
    final TimeUnit costKey = _product.value!.details.cost.entries.first.key;
    final num costValue = _product.value!.details.cost.entries.first.value;
    _timeCost.value = {
      costKey: costValue,
    };
  }

  void _calcTotalOrderCost() {
    double newCost = 0;
    newCost += (_totalUnits.value) * (_timeCost.value!.values.first.toInt());
    totalOrderCost.value = newCost;
  }

  bool _isAbleToBook() {
    if (custBusinessCartController!.cart.value != null) {
      return custBusinessCartController!.cart.value!.items
          .every((BusinessCartItem e) => e.businessId == product!.business.id);
    }
    return true;
  }

  Future<void> bookOffering() async {
    if (custBusinessCartController == null) {
      if (Get.find<AuthController>().isUserSignedIn) {
        custBusinessCartController = Get.find<CustBusinessCartController>();
      } else {
        // Go to sign in screen
        await SignInView.navigateAtOrderTime();
        return;
      }
    }
    if (!_isAbleToBook()) {
      showErrorSnackBar(
        errorTitle: "You can only book items from one business at a time",
      );
      return;
    }
    await custBusinessCartController!.addCartItem(
      BusinessCartItem(
        businessId: _product.value!.business.id,
        itemId: _product.value!.id!,
        offeringType: OfferingType.Product,
        parameters: BusinessItemParameters(
          numberOfUnits: 1,
          timeUnit: TimeUnit.Unit,
          
        ),
        cost: totalOrderCost.value,
        product: _product.value,
      ),
    );
    await CustCartView.navigate();
  }
}
