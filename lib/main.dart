import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty/screens/HomeScreen.dart';
import 'package:rick_morty/screens/ItemsScreen.dart';
import 'package:rick_morty/services/character_services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterServices(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'items': (_) => const ItemsScreen(),
      },
    );
  }
}
