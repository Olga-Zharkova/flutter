import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

class CarouselSliderWidget extends StatefulWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  State<CarouselSliderWidget> createState() => _CarouselSliderWidgetState();
}

class _CarouselSliderWidgetState extends State<CarouselSliderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue.shade200,
      child: CarouselSlider(
        items: [
          SvgPicture.asset('assets/images/svg1.svg',
              color: Colors.red, semanticsLabel: 'A red up arrow'),
          Image.asset('assets/images/image1.jpg'),
          SvgPicture.asset('assets/images/svg2.svg'),
          Image.network(
              'https://2sotki.ru/wp-content/uploads/7/e/7/7e7006c676d5c9d52209cdcae884f793.jpe'),
        ],
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.4,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(milliseconds: 200),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.9,
        ),
      ),
    );
  }
}
