import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //final List<String> nav = ['Мои фото', 'Галерея'];
  final List<Tab> nav = [
    const Tab(text: 'Мои фото'),
    const Tab(text: 'Галерея')
  ];

  //final List fakeData = List.generate(100, (index) => index.toString());

  Map<String, dynamic> data = {
    'Мои фото': [
      'https://picsum.photos/1200/501',
      'https://picsum.photos/1200/502',
      'https://picsum.photos/1200/503',
      'https://picsum.photos/1200/504',
      'https://picsum.photos/1200/505',
      'https://picsum.photos/1200/506',
      'https://picsum.photos/1200/507',
      'https://picsum.photos/1200/508',
      'https://picsum.photos/1200/509',
      'https://picsum.photos/1200/510',
    ],
    'Галерея': [
      'https://picsum.photos/1200/511',
      'https://picsum.photos/1200/512',
      'https://picsum.photos/1200/513',
      'https://picsum.photos/1200/514',
      'https://picsum.photos/1200/515',
      'https://picsum.photos/1200/516',
      'https://picsum.photos/1200/517',
      'https://picsum.photos/1200/518',
      'https://picsum.photos/1200/519',
      'https://picsum.photos/1200/520',
    ]
  };

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: nav.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: nav,
          ),
        ),
        body: TabBarView(
          children: nav.map((name) {
            return ListView(
              key: PageStorageKey(name),
              children: <Widget>[
                ...data[name.text].map((e) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      color: Colors.white,
                      child: CachedNetworkImage(
                        imageUrl: e,
                        placeholder: (context, e) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, e, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                }).toList()
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
