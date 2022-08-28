import 'package:flutter/material.dart';
import 'package:untitled6/pages/description_hotel_page.dart';

class CardForList extends StatelessWidget {
  final String name;
  final String uuid;
  final String poster;

  const CardForList({
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
        height: 175,
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(borderRadius)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/$poster'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: borderRadius, vertical: borderRadius / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(name),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DescriptionHotelPage(uuid: uuid)),
                        );
                      },
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(2),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Подробнее',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
