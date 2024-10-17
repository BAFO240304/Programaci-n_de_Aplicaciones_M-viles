class Estudiante {
  String codigo;
  String nombres;
  double nota1;
  double nota2;

  Estudiante(this.codigo, this.nombres, this.nota1, this.nota2);

  void mostrarInformacion() {
    print('Código : $codigo');
    print('Nombres : $nombres');
    print('Nota 1 : $nota1');
    print('Nota 2 : $nota2');
    print('Promedio: ${calcularPromedio()}');
  }

  double calcularPromedio() {
    return (nota1 + nota2) / 2; // Calcular el promedio
  }
}

void main() {
  List<Estudiante> listaEstudiante = [];
  listaEstudiante.add(Estudiante('001', 'Juan Pérez', 15.5, 17.8));
  listaEstudiante.add(Estudiante('002', 'Ana Gómez', 18.2, 19.5));

  for (var estudiante in listaEstudiante) {
    estudiante.mostrarInformacion();
    print('---');
  }
}