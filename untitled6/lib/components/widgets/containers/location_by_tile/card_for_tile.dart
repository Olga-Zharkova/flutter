import 'package:flutter/material.dart';
import 'package:untitled6/pages/description_hotel_page.dart';


class CardForTile extends StatelessWidget {
  final String name;
  final String uuid;

  const CardForTile({super.key, required this.name, required this.uuid});

  @override
  Widget build(BuildContext context) {
    double _borderRadius = 15;
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: SizedBox(
        height: 140,
        child: Column(
          children: [
            Expanded(flex: 2, child: Container(color: Colors.red)),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(name, textAlign: TextAlign.center),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DescriptionHotelPage(uuid: uuid)),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(_borderRadius),
                        bottomRight: Radius.circular(_borderRadius),
                      )),
                  child: const Center(
                    child: Text(
                      'Подробнее',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
