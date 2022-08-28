import 'package:flutter/material.dart';
import 'package:untitled6/pages/description_hotel_page.dart';

class CardForTile extends StatelessWidget {
  final String name;
  final String uuid;
  final String poster;

  const CardForTile({
    super.key,
    required this.name,
    required this.uuid,
    required this.poster,
  });

  @override
  Widget build(BuildContext context) {
    double borderRadius = 15;
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: SizedBox(
        height: 140,
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/$poster'),
                        fit: BoxFit.fill),
                  ),
                ),),
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
                        bottomLeft: Radius.circular(borderRadius),
                        bottomRight: Radius.circular(borderRadius),
                      ),),
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
