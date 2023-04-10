class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      app: AppBar(),
      drawer: DrawerMenu(),
      body: Column(),
    );
  }
}
