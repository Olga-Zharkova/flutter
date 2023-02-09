import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business/counter_bloc/product_bloc.dart';
import '../business/product_list_bloc/basket_bloc.dart';
import 'home_screen.dart';

class EntryPoint extends StatelessWidget {
  const EntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      MultiBlocProvider(
        providers: [
          BlocProvider<ProductBloc>(
            create: (_) => ProductBloc(),
          ),
          BlocProvider<BasketBloc>(
            create: (_) => BasketBloc(),
          ),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}
