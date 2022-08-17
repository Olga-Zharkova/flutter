import 'package:flutter/material.dart';

import 'package:untitled5/components/widgets/containers/error_data/file_is_empty.dart';
import 'package:untitled5/components/widgets/containers/error_data/loading_data.dart';
import 'package:untitled5/components/widgets/containers/error_data/snapshot_has_error.dart';
import 'package:untitled5/components/widgets/containers/etc/data_output.dart';
import 'package:untitled5/components/widgets/containers/etc/my_text_field.dart';
import 'package:untitled5/functions/fetch_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nameFile = '';
  dynamic _data;

  //позволяет выводить данные только при успешном их получении
  //0-начало работы
  //1-наименование введенного файла корректно
  //2-наименование введенного файла некорректно
  bool _indicator = false;

  //ф-ция подхватки введенных данных
  void syncingEnteredText(String newEnteredText) {
    setState(
      () {
        _nameFile = newEnteredText;
        _indicator = false;
      },
    );
  }

  //вызов при нажатии на кнопку "найти"
  void fileSearch(String nameFile) async {
    if (nameFile.isNotEmpty) {
      setState(() {
        _indicator = true;
        //_data = fetchFileFromAssets('assets/$_nameFile.txt');
      });
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  @override
  void initState() {
    super.initState();
    _data = fetchFileFromAssets('assets/$_nameFile.txt');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: ListView(
        children: [
          MyTextField(
            syncingEnteredText: syncingEnteredText,
            fileSearch: () => fileSearch(_nameFile),
          ),
          _indicator == false
              ? const SizedBox()
              : FutureBuilder<String>(
                  future: _data,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      String? data = snapshot.data;
                      if (data == null || data.isEmpty) {
                        return const FileIsEmpty();
                      } else {
                        return DataOutput(
                          nameFile: _nameFile,
                          text: '${snapshot.data}',
                        );
                      }
                    } else {
                      return (snapshot.hasError)
                          ? const SnapshotHasError()
                          : const LoadingData();
                    }
                  },
                ),
        ],
      ),
    );
  }
}
