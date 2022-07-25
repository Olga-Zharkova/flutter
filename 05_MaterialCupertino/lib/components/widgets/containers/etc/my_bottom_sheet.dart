import 'package:flutter/material.dart';

//выезжающая область после нажатия на кнопку +
class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Expanded(flex: 1, child: Icon(Icons.layers_outlined)),
            Expanded(
              flex: 4,
              child: Text('Сумма'),
            ),
            Expanded(
              flex: 1,
              child: Text('200 руб'),
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        SizedBox(
          height: 50,
          width: 100,
          child: FloatingActionButton(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            onPressed: onTap,
            backgroundColor: Colors.grey.shade200,
            child: const Text(
              'Оплатить',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
