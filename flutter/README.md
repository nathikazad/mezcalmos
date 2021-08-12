> Using GetX as StateManager for many reasons :

- Very fun / easy to get around , basically friendly .
- DI (Dependency Injection) is something , one Instance injection on the root for example and you can get it anywhere else.
- Routing / Navigating is fast and less code.
- Internationalization way too easy.
- State Management is much more easy and fun to play with , Easy to observe   variables that are expected to change relativey to the UI
.
- State Management , No need to work with Streams (since it take care of them behind ).
- It Auto Dispose states.
- SnackBars and dialogs pop up without the need of context (which was really   booring before xD )
- Working with Storage easily.
- Fast Theme Changing .
- Inputs / data builtin Validations.


**So it's basically, less code, fast , code friendly ...!**

> Architecture && DI

 ```
   Splash
   |__ Wrapper
      |__ Auth
      |   | Signing
      |   | SignUp
      |
      |__ HomeScreen
      |   |__ AnuthorizedTaxi               > If Taxi is not auth to drive
      |   |__ AuthorizedTaxi::OpenOrders    > If Taxi is not in the middle of any order
      |   |__ AuthorizedTaxi::CurrentOrder  > If Taxi is in the middle of an order
      |
      |
      |__ SignOut

```