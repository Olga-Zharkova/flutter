import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/components/widgets/containers/description_hotel/address_and_rating_hotel.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/carousel_images.dart';
import 'package:untitled6/components/widgets/containers/description_hotel/services.dart';
import 'package:untitled6/components/widgets/containers/error_select_data.dart';
import 'package:untitled6/models/description_hotel.dart';

class DescriptionHotelPage extends StatefulWidget {
  final String uuid;

  const DescriptionHotelPage({super.key, required this.uuid});

  @override
  State<DescriptionHotelPage> createState() => _DescriptionHotelPageState();
}

class _DescriptionHotelPageState extends State<DescriptionHotelPage> {
  late DescriptionHotel _dataOneHotel;

  bool _hasError = false;
  bool _isLoading = false;
  final String _errorMessage = 'Контент временно недоступен';

  //ф-ция получения данных для главного экрана
  fetchDataFromApi(String uuid) async {
    setState(() => _isLoading = true);

    try {
      final uri = Uri.parse('https://run.mocky.io/v3/$uuid');
      final response = await http.get(uri);
      var data = jsonDecode(response.body);
      setState(() => _dataOneHotel = DescriptionHotel.fromJson(data));
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi(widget.uuid);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading && !_hasError) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_dataOneHotel.name),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CarouselImages(photosList: _dataOneHotel.photos),
              AddressAndRating(
                  type: 'Страна', name: _dataOneHotel.address.country),
              AddressAndRating(type: 'Город', name: _dataOneHotel.address.city),
              AddressAndRating(
                  type: 'Улица', name: _dataOneHotel.address.street),
              AddressAndRating(type: 'rating', name: '${_dataOneHotel.rating}'),
              const SizedBox(height: 30),
              const Text(
                'СЕРВИСЫ',
                style: TextStyle(fontSize: 36),
              ),
              const SizedBox(height: 10),
              //services
              Services(servicesList: _dataOneHotel.services),
            ],
          ),
        ),
      );
    }
    if (_isLoading) {
      return const ColoredBox(
        color: Color(0xffffffff),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (_hasError) {
      return ErrorSelectData(errorMessage: _errorMessage);
    } else {
      return const ColoredBox(
        color: Colors.black,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
