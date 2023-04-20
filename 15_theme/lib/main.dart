import 'package:flutter/material.dart';
import 'package:untitled15/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeLight,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;
  bool _isLoading = false;
  final List<Map<String, dynamic>> _chips = [
    {'name': 'News', 'isSelect': false},
    {'name': 'Book', 'isSelect': true},
    {'name': 'Games', 'isSelect': true},
    {'name': 'Messages', 'isSelect': false},
    {'name': 'People', 'isSelect': false}
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_alt),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (currentIndex) {
          _tabController.index = currentIndex;
          setState(() {
            _currentTabIndex = currentIndex;
            _tabController.animateTo(_currentTabIndex);
          });
        },
        currentIndex: _currentTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Список товаров',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Поиск товаров',
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Заказать товар',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      onPressed: () async {
                        setState(() => _isLoading = true);
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() => _isLoading = false);
                      },
                    ),
                  ],
                ),
              ),
              if (_isLoading)
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(),
                ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    8,
                    (index) => Card(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: double.infinity,
                              child: Image.asset(
                                'assets/images/img_${index + 1}.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('Краткое описание карточки'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 12,
              children: [
                ..._chips
                    .map(
                      (item) => FilterChip(
                        onSelected: (v) {
                          setState(() {
                            item['isSelect'] = v;
                          });
                        },
                        selected: item['isSelect'],
                        label: Text(
                          item['name'],
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    )
                    .toList(),
                const FilterChip(
                  onSelected: null,
                  label: Text('City'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            actions: [
                              ElevatedButton(
                                child: Text(
                                  'Да',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                child: Text(
                                  'Нет',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                            title: const Text('Сменить аватар'),
                          );
                        });
                  },
                  child: const CircleAvatar(
                    radius: 40,
                    child: Text('AB'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
