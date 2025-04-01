import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_functions_screen.dart';
//import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Quia el banner de "Debug"
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.red
      ),
      home: const CounterFunctionScreen()
    );
  }

}