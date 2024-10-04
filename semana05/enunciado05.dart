import 'dart:io';
void main() {
  print('Ingresa el tamaño de la matriz (N):');
  int n = int.parse(stdin.readLineSync()!);
  List<List<int>> matrizA = List.generate(n, (i) => List.filled(n, 0));
  List<List<int>> matrizB = List.generate(n, (i) => List.filled(n, 0));
  List<List<int>> suma = List.generate(n, (i) => List.filled(n, 0));
  print('Ingresa los elementos de la matriz A:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento A[$i][$j]:');
      matrizA[i][j] = int.parse(stdin.readLineSync()!);
    }
  }
  print('Ingresa los elementos de la matriz B:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento B[$i][$j]:');
      matrizB[i][j] = int.parse(stdin.readLineSync()!);
    }
  }
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      suma[i][j] = matrizA[i][j] + matrizB[i][j];
    }
  }
  print('La suma de las matrices A y B es:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('${suma[i][j]} ');
    }
    print('');
  }
}
