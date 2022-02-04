import 'package:mezcalmos/Shared/models/Location.dart';
import 'package:mezcalmos/Shared/models/Orders/Order.dart';

class FakeOrder extends Order {
  FakeOrder({
    required String orderId,
    required String serviceProviderId,
    required PaymentType paymentType,
    required DateTime orderTime,
    required OrderType orderType,
    required num cost,
    required UserInfo customer,
    required Location to,
  }) : super(
            orderId: orderId,
            orderType: orderType,
            serviceProviderId: serviceProviderId,
            paymentType: paymentType,
            orderTime: orderTime,
            cost: cost,
            customer: customer,
            to: to);

  @override
  bool inProcess() {
    // TODO: implement inProcess
    throw UnimplementedError();
  }

  @override
  bool isCanceled() {
    // TODO: implement isCanceled
    throw UnimplementedError();
  }
}
