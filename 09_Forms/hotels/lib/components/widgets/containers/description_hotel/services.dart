import 'package:flutter/material.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/text_service.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/type_service.dart';
import 'package:untitled6/models/services_hotel.dart';

class Services extends StatelessWidget {
  final ServicesHotel servicesList;

  const Services({super.key, required this.servicesList});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypeServices(dataList: servicesList.free, title: 'Платные'),
        TypeServices(dataList: servicesList.paid, title: 'Бесплатно'),
      ],
    );
  }
}
