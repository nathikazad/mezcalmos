extension ParseNumber on num {
  String toPriceString() {
    final String str = "\$${round()}";
    return str;
  }
}
