import 'package:flutter/material.dart';
import 'package:rickandmorty/core/service_locator/service_locator.dart' as di;
import 'package:rickandmorty/features/home/presentation/pages/home_page.dart'; // Импортируем как `di`


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(), 
    );
  }
}
