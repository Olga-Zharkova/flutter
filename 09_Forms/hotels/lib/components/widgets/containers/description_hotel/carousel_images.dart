import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselImages extends StatelessWidget {
  final List<String> photosList;

  const CarouselImages({super.key, required this.photosList});

  @override
  Widget build(BuildContext context) {

    // final List<Widget> _data = List.generate(
    //   1000,
    //       (index) {
    //     return Image.asset('assets/images/$photoUrl', fit: BoxFit.cover);
    //   },
    // );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        items: [
           for (String photoUrl in photosList)
             Image.asset('assets/images/$photoUrl', fit: BoxFit.cover)
        ],
        options: CarouselOptions(
          height: 200,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(milliseconds: 150),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
      ),
    );
  }
}
