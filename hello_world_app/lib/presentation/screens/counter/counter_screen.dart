import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

   const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Implementa un diseño básico
    appBar: AppBar(
      title: const Text("Counter Screen"),
    ),
        body: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center, //Parecido a display flex
                children: [
                  Text('$clickCounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
                  Text( clickCounter ==1? "Click" : "Clicks", style: const TextStyle(fontSize: 25))
                ],
                ),
        ),
        //Función que aumentará el numero al pulsar el botón
        floatingActionButton: FloatingActionButton(
          onPressed: (){
          setState(() { //Permite que la pantalla se acutalice en tiempo real
            clickCounter++;
            
          });
        },
        child: const Icon(Icons.plus_one),
        ),
        
//        floatingActionButton: FloatingActionButton(
  //        onPressed: (){
    //      setState(() { //Permite que la pantalla se acutalice en tiempo real
      //      clickCounter--;
        //    
        //  });
        //},
        //child: const Icon(Icons.exposure_minus_1_rounded),
        
        
        //)
        );
  }
}