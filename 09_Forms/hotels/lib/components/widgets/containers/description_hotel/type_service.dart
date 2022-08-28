import 'package:flutter/material.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/text_service.dart';

class TypeServices extends StatelessWidget {
  final String title;
  final dynamic dataList;

  const TypeServices({super.key, required this.title, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          for (int index = 0; index < dataList.length; index++)
            TextService(service: dataList[index]),
        ],
      ),
    );
  }
}
