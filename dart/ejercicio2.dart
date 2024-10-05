import 'dart:io';
void main() {
  stdout.write('Ingresa la cantidad total de dinero a repartir: ');
  double totalDinero = double.parse(stdin.readLineSync()!);
  double josue = totalDinero * 0.27;
  double daniel = totalDinero * 0.25;
  double caleb = (josue + daniel) * 0.23;
  double tamar = josue * 0.85;
  double david = totalDinero - (josue + daniel + caleb + tamar);
  print('\nReparto de dinero entre los hijos:');
  print('Tamar recibirá: \$${tamar.toStringAsFixed(2)}');
  print('Josué recibirá: \$${josue.toStringAsFixed(2)}');
  print('Caleb recibirá: \$${caleb.toStringAsFixed(2)}');
  print('Daniel recibirá: \$${daniel.toStringAsFixed(2)}');
  print('David recibirá: \$${david.toStringAsFixed(2)}');
}
