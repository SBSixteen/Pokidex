import 'package:flutter/material.dart';
import 'package:pokidex_19660/provider/pokemon_provider.dart';
import 'package:pokidex_19660/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PokemonProvider>(
        create: (context) => PokemonProvider(),
        child: MaterialApp(
          title: "Providers Class",
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
            useMaterial3: true
          ),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        ));
  }
}
