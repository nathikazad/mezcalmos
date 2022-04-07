/*
* Created By Mirai Devs.
* On 3/26/2022.
*/
extension GenerateTheName on String {
  String generateTheName() {
    String imageString = '';
    if (isNotEmpty) {
      final List<String> _split = split(" ");
      for (int i = 0; i < _split.length; i++) {
        if (i < 2 && _split[i].isNotEmpty) {
          imageString += _split[i][0];
        } else {
          break;
        }
      }
    }
    return imageString.toUpperCase();
  }
}
