void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('ejemploAPI');
    print('éxito: $value');
  } on Exception catch (err) {
    print('Tenemos una excepción: $err');
  } catch (err) {
    print('Algo terrible pasó: $err');
  } finally {
    print('Fin del try y catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw Exception('No hay parámetros en la URL');
  // throw 'Error en la petición';

  //return 'Tenemos un valor de la petición';
}
