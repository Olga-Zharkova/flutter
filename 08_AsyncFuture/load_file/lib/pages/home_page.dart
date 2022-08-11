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
  String _nameFiles = '';

  //позволяет выводить данные только при успешном их получении
  bool _indicator = true;

  //ф-ция подхватки введенных данных
  void syncingEnteredText(String newEnteredText) {
    setState(
      () {
        _nameFiles = newEnteredText;
        _indicator = false;
      },
    );
  }

  //вызов при нажатии на кнопку "найти"
  void fileSearch(String nameFiles) {
    if (nameFiles.isNotEmpty) {
      setState(() => _indicator = true);
    }
  }

  @override
  void initState() {
    super.initState();
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
            fileSearch: fileSearch(_nameFiles),
          ),
          _indicator == false
              ? const SizedBox()
              : FutureBuilder<String>(
                  future: fetchFileFromAssets('assets/$_nameFiles'),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      String? data = snapshot.data;
                      if (data == null || data.isEmpty) {
                        return const FileIsEmpty();
                      } else {
                        return DataOutput(
                          nameFile: _nameFiles,
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
