import 'package:flutter/material.dart';

class TextFieldStyled extends StatefulWidget {
  const TextFieldStyled({Key? key}) : super(key: key);

  @override
  State<TextFieldStyled> createState() => _TextFieldStyledState();
}

class _TextFieldStyledState extends State<TextFieldStyled> {
  static const _enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purple,
      width: 1.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  );
  static const _focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.purple,
      width: 3.0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: _enabledBorder,
              focusedBorder: _focusedBorder,
              suffixIcon: Icon(Icons.search, color: Colors.purple),
              //почему не дает объявить действие у кнопки?
              //Invalid constant value
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(Icons.search, color: Colors.purple),
              // ),
              hintText: 'Введите значение',
              helperText: 'Поле для поиска заметок',
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w400,
              ),
              floatingLabelStyle: TextStyle(
                color: Colors.purple,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
