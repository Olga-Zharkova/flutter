// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class ImageSVG extends StatefulWidget {
  const ImageSVG({Key? key}) : super(key: key);

  @override
  State<ImageSVG> createState() => _ImageSVGState();
}

class _ImageSVGState extends State<ImageSVG> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent.shade200,
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.75,
        color: Colors.amberAccent.shade200,
        child: SvgPicture.asset('assets/images/svg1.svg',
            color: Colors.red, semanticsLabel: 'A red up arrow'),
      ),
    );
  }
}
