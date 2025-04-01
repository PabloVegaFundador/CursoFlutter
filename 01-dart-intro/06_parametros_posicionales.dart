void main() {
  print(greetEveryone());
  print('Suma: ${addTwoNumbers(1, 4)}');
  print('Suma opcional: ${addTwoNumbersOptional(1)}');

  print(greetPerson(name: 'Pablo', message: 'Hi,'));
}

String greetEveryone() => 'Hello everyone!';

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [int b = 0]) {
  //si no recibe un segundo valor, por defecto será 0
  return a + b;
}

String greetPerson({required String name, String message = 'Hola, '}) {
  return '$message $name';
}
