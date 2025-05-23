import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //Obliga a cerrar la ventana sólo cuando se pulse alguno de los botones
      builder:
          (context) => AlertDialog(
            title: const Text('¿Estás seguro?'),
            content: const Text(
              """Ad Lorem incididunt id id cillum voluptate voluptate culpa sit ea quis. 
                Tempor ex sit veniam velit ut magna aliqua Lorem. Eiusmod ex laboris proident 
                quis sint reprehenderit ut ullamco commodo sint voluptate. Dolor consectetur 
                eiusmod veniam et cillum nostrud excepteur culpa do aliqua. Eu ex veniam adipisicing 
                sunt reprehenderit est tempor. Incididunt veniam non mollit Lorem anim do aliquip elit cupidatat.""",
            ),
            actions: [
              TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
              FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snackbars y Diálogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      """Ad Lorem incididunt id id cillum voluptate voluptate culpa sit ea quis. 
                      Tempor ex sit veniam velit ut magna aliqua Lorem. Eiusmod ex laboris proident 
                      quis sint reprehenderit ut ullamco commodo sint voluptate. Dolor consectetur 
                      eiusmod veniam et cillum nostrud excepteur culpa do aliqua. Eu ex veniam adipisicing 
                      sunt reprehenderit est tempor. Incididunt veniam non mollit Lorem anim do aliquip elit cupidatat.""",
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            Padding(padding: EdgeInsets.all(7)), //Espacio entre botones
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('Mostrar diálogo de pantalla'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
