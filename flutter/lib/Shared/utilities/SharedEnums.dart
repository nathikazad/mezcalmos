enum OrdersStates { Finished, Cancelled, Expired, InProccess, IsLooking }
// CurrentOrderEventType ENUM, used by CurrentOrderEvent.
enum CurrentOrderEventTypes { Null, OrderStatusChange, KeepAlive }
// used by TaxiAuthController <-> TaxiWrapper
enum AgentDataEvent {
/* 
 * Null == default when we initialize a variable of type AgentDataEvent (Instead of using null we use this basically)
 * DataNotLoadedYet == No data came yet from the server
 * Unauthorized == User/Agent not authorized to use the app
 * InCurrentOrder == User inside of an order.
 * Free == User is ready for default use of the app.
 */

  Null,
  DataNotLoadedYet,
  Unauthorized,
  InCurrentOrder,
  Free
}
