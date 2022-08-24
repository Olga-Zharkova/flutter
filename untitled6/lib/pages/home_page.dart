import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled6/components/widgets/containers/location_by_list/location_by_list.dart';
import 'package:http/http.dart' as http;
import 'package:untitled6/components/widgets/containers/location_by_tile/location_by_tile.dart';

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

  List<dynamic> _dataHotel = [];

  Future<String> fetchDataFromApi() async {
    List data = [];
    var uri = Uri.parse(
        'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      //проверка удаления виджетов из дерева
      if (mounted) {
        setState(
          () {
            for (var element in data) {
              _dataHotel.add(element);
            }
          },
        );
      }
      return "Success";
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
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
}

//FutureBuilder<List<dynamic>>(
//         future: _dataHotel,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           switch (snapshot.connectionState) {
//             case ConnectionState.done:
//               return _indicator == 0
//                   ? LocationByList(dataHotel: _dataHotel)
//                   : LocationByTile(dataHotel: _dataHotel);
//             case ConnectionState.waiting:
//               return const Center(child: CircularProgressIndicator());
//             case ConnectionState.active:
//               return const Center(child: CircularProgressIndicator());
//             default:
//               return const Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
