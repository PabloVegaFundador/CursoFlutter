import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {

   const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {

  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold( //Implementa un diseño básico
    appBar: AppBar(
      title: const Text("Counter Functions"),
      actions: [
        IconButton(
        icon: Icon(Icons.refresh_rounded),
        onPressed: () { 
          setState(() {
            clickCounter = 0;
          });
         }),
      ],
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
        
        //Función que modifica el número al pulsar los botones
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //Al pulsar el botón incrementará el número
          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: (){
              setState(() {
                clickCounter ++;
              });
            },
            ),

          SizedBox(height: 10),//espacio entre ambos botones (gap)
            //Al pulsar el botón reiniciará el contador
          CustomButton(icon: Icons.refresh_outlined,
            onPressed: (){
              setState(() {
                clickCounter = 0;
              });
            },),
          
          SizedBox(height: 10), 

            //Al pulsar el botón restará uno al número
          CustomButton(icon: Icons.exposure_minus_1_outlined,
            onPressed: (){
              setState(() {                
                if(clickCounter > 0) clickCounter --;
              });
            },),
          
          SizedBox(height: 15)
            ],
        )
        );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressed;
  

  const CustomButton({
    super.key, 
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: Icon(icon),
            );
  }
}