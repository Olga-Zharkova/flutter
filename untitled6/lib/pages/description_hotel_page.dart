import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/components/widgets/containers/description_hotel/address_and_rating.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/card_service.dart';


class DescriptionHotelPage extends StatefulWidget {
  final String uuid;

  const DescriptionHotelPage({super.key, required this.uuid});

  @override
  State<DescriptionHotelPage> createState() => _DescriptionHotelPageState();
}

class _DescriptionHotelPageState extends State<DescriptionHotelPage> {
  Map _dataHotel = {};
  final _styleTypeTariff = const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);


  Future<String> fetchDataFromApi(String uuid) async {
    Map data = {};
    var uri = Uri.parse('https://run.mocky.io/v3/$uuid');
    print(uri);
    var response = await http.get(uri);
    print(response);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
      //проверка удаления виджетов из дерева
      if (mounted) {
        setState(() => _dataHotel = data);
      }
      return "Success";
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_dataHotel["name"]}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            AddressAndRating(
                type: 'Страна', name: _dataHotel["address"]["country"]),
            AddressAndRating(
                type: 'Город', name: _dataHotel["address"]["city"]),
            AddressAndRating(
                type: 'Улица', name: _dataHotel["address"]["street"]),
            AddressAndRating(type: 'rating', name: '${_dataHotel["rating"]}'),
            const SizedBox(height: 30),
            const Text(
              'СЕРВИСЫ',
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Платные', style: _styleTypeTariff,),
                      const SizedBox(height: 5),
                      for (int index=0; index < _dataHotel["services"]["free"].length; index++)
                        CardService(service: _dataHotel["services"]["free"][index]),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Бесплатно', style: _styleTypeTariff,),
                      const SizedBox(height: 5),
                      for (int index=0; index < _dataHotel["services"]["paid"].length; index++)
                        CardService(service: _dataHotel["services"]["paid"][index]),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
