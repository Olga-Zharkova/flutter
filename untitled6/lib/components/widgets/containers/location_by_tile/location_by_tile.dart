import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/components/widgets/containers/location_by_list/card_for_list.dart';
import 'package:untitled6/components/widgets/containers/location_by_tile/card_for_tile.dart';

class LocationByTile extends StatefulWidget {
  final List<dynamic> dataHotel;

  const LocationByTile({super.key, required this.dataHotel});

  @override
  State<LocationByTile> createState() => _LocationByTileState();
}

class _LocationByTileState extends State<LocationByTile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.dataHotel.length,
      itemBuilder: (BuildContext context, int index) => CardForTile(
        name: widget.dataHotel[index]['name'],
        uuid: widget.dataHotel[index]['uuid'],
      ),
    );
  }
}
