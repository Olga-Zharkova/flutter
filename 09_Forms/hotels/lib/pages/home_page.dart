import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/components/widgets/containers/error_select_data.dart';
import 'package:untitled6/components/widgets/containers/location_by_list/location_by_list.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/components/widgets/containers/location_by_tile/location_by_tile.dart';
import 'package:untitled6/models/briefly_hotel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //переменная для выбора отображения спика
  //0- список
  //1-плитка
  int _indicator = 0;

  final List<BrieflyHotel> _dataHotel = [];

  bool _hasError = false;
  bool _isLoading = false;
  final String _errorMessage = 'Контент недоступен';

  //ф-ция получения данных для главного экрана
  fetchDataFromApi() async {
    setState(() => _isLoading = true);
    try {
      final uri = Uri.parse(
          'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      final response = await http.get(uri);
      var data = jsonDecode(response.body);
      setState(() {
        for (var element in data) {
          _dataHotel.add(BrieflyHotel.fromJson(element));
        }
      });
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
    fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoading && !_hasError) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() => _indicator = 0);
                },
                icon: const Icon(Icons.list)),
            IconButton(
                onPressed: () {
                  setState(() => _indicator = 1);
                },
                icon: const Icon(Icons.apps)),
          ],
        ),
        body: _indicator == 0
            ? LocationByList(dataHotel: _dataHotel)
            : LocationByTile(dataHotel: _dataHotel),
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
