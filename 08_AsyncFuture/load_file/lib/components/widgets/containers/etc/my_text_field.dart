import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Function(String) syncingEnteredText;
  final Function fileSearch(String value);

  const MyTextField({Key? key, required this.syncingEnteredText, required this.fileSearch(value)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );

    const focusedBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: TextField(
        onChanged: syncingEnteredText,
        decoration: InputDecoration(
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            suffixIconConstraints:
                const BoxConstraints(minHeight: 60, minWidth: 80),
            suffixIcon: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: TextButton(
                onPressed: fileSearch(),
                child: const Text(
                  'Найти',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )),
      ),
    );
  }
}
