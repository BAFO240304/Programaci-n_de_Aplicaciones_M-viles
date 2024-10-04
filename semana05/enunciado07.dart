import 'dart:io';
void main() {
  print('Ingresa el tamaño de la matriz (n):');
  int n = int.parse(stdin.readLineSync()!);
  List<List<int>> matriz = List.generate(n, (i) => List.filled(n, 0));
  int num = 1;
  int inicioFila = 0, finFila = n - 1;
  int inicioCol = 0, finCol = n - 1;
  while (num <= n * n) {
    for (int i = inicioCol; i <= finCol; i++) {
      matriz[inicioFila][i] = num++;
    }
    inicioFila++;
    for (int i = inicioFila; i <= finFila; i++) {
      matriz[i][finCol] = num++;
    }
    finCol--;
    if (inicioFila <= finFila) {
      for (int i = finCol; i >= inicioCol; i--) {
        matriz[finFila][i] = num++;
      }
      finFila--;
    }
    if (inicioCol <= finCol) {
      for (int i = finFila; i >= inicioFila; i--) {
        matriz[i][inicioCol] = num++;
      }
      inicioCol++;
    }
  }
  print('Matriz en espiral:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('${matriz[i][j]} ');
    }
    print('');
  }
}
