enum OrdersStates { Finished, Cancelled, Expired, InProccess, IsLooking }
class NbOrders {
  String? day;
  int? nbOrders;
  NbOrders(this.day, this.nbOrders);
}
