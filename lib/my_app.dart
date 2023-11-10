import 'package:flutter/material.dart';
import 'package:list_v2/Pages/home_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 58, 181, 183)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
