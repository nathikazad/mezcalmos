extension ParseNumber on num {
  num get doubleWithoutDecimalToInt {
    return this % 1 == 0 ? toInt() : this;
  }

  String toPriceString(
      {bool rounded = true, bool hideZero = true, String? label}) {
    final String str =
        "\$${(rounded) ? round().toStringAsFixed(0) : toStringAsFixed(1)}";
    return (this == 0 && hideZero) ? "-" : str + (label ?? "");
  }
}

extension IntArrayHelper on List<int> {
  int closest(int value) {
    int data = first;
    forEach((int element) {
      if ((value - element).abs() < (value - data)) {
        data = element;
      }
    });
    return data;
  }
}
// def closest (num, arr):
//     curr = arr[0]
//     foreach val in arr:
//         if abs (num - val) < abs (num - curr):
//             curr = val
//     return curr
