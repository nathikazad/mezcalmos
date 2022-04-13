import 'package:flutter/material.dart';
import 'package:mezcalmos/LaundryApp/pages/EditInfoView/controllers/EditInfoController.dart';
import 'package:mezcalmos/Shared/constants/global.dart';

class LanguageSelectorComponent extends StatefulWidget {
  LanguageSelectorComponent(
      {Key? key,
      required this.languagePriority,
      required this.langValue,
      required this.oppositeLang})
      : super(key: key);
  final LanguagePriority languagePriority;
  String? langValue;
  String? oppositeLang;

  @override
  State<LanguageSelectorComponent> createState() =>
      _LanguageSelectorComponentState();
}

class _LanguageSelectorComponentState extends State<LanguageSelectorComponent> {
  EditInfoController editInfoController = EditInfoController();
  // String? _currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FormField<String>(
        builder: (FormFieldState<String> state) {
          return InputDecorator(
            decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                label: Text(getRightLAbel(widget.languagePriority)),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: (widget.languagePriority ==
                            LanguagePriority.SecondaryLanguage &&
                        widget.langValue != null)
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            widget.langValue = null;
                          });
                        },
                        icon: Icon(Icons.delete))
                    : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            isEmpty: widget.langValue == '' || widget.langValue == null,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: widget.langValue,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    widget.langValue = newValue;
                  });
                },
                items: ["English", "Spanish"].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage(getRightFlag(value)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(value)
                    ]),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

//   List<String> getLanguagesOptions() {
//     final List<String> options = ["English", "Spanish"];
//     if (widget.langValue != null) {
//       if (options.contains(widget.langValue)) {
//         options.remove(widget.langValue);
//         return options;
//       } else {
//         return options;
//       }
//     } else {
//       return options;
//     }
//   }
// }
}

String getRightFlag(String value) {
  switch (value) {
    case "English":
      return aUsaFlag;
      break;
    case "Spanish":
      return aMexicoFlag;
      break;

    default:
      return "";
  }
}

String getRightLAbel(LanguagePriority languagePriority) {
  switch (languagePriority) {
    case LanguagePriority.PrimaryLanguage:
      return "Select Primary language";

    case LanguagePriority.SecondaryLanguage:
      return "Select Secondary language";

    default:
      return "";
  }
}
