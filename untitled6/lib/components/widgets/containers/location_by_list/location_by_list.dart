import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/pages/description_hotel_page.dart';
import 'package:untitled6/components/widgets/containers/location_by_list/card_for_list.dart';


class LocationByList extends StatefulWidget {
  final List <dynamic> dataHotel;
  const LocationByList({super.key, required this.dataHotel});

  @override
  State<LocationByList> createState() => _LocationByListState();
}

class _LocationByListState extends State<LocationByList> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.dataHotel.length,
      itemBuilder: (BuildContext context, int index) => CardForList(
        name: widget.dataHotel[index]['name'],
        uuid: widget.dataHotel[index]['uuid'],
      ),
    );
  }
}
