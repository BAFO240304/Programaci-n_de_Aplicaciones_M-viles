import 'dart:io';

class Evaluacion {
  int minutosTardanza;
  int observaciones;

  Evaluacion(this.minutosTardanza, this.observaciones);

  int puntajePorPuntualidad() {
    if (minutosTardanza == 0) {
      return 10;
    } else if (minutosTardanza <= 2) {
      return 8;
    } else if (minutosTardanza <= 5) {
      return 6;
    } else if (minutosTardanza <= 9) {
      return 4;
    } else {
      return 0;
    }
  }

  int puntajePorRendimiento() {
    if (observaciones == 0) {
      return 10;
    } else if (observaciones == 1) {
      return 8;
    } else if (observaciones == 2) {
      return 5;
    } else if (observaciones == 3) {
      return 1;
    } else {
      return 0;
    }
  }

  int puntajeTotal() {
    return puntajePorPuntualidad() + puntajePorRendimiento();
  }

  double bonificacion() {
    int total = puntajeTotal();
    if (total < 11) {
      return total * 2.5;
    } else if (total <= 13) {
      return total * 5.0;
    } else if (total <= 16) {
      return total * 7.5;
    } else if (total <= 19) {
      return total * 10.0;
    } else {
      return total * 12.5;
    }
  }
}

class Empleado {
  String nombre;
  Evaluacion evaluacion;

  Empleado(this.nombre, this.evaluacion);
}

void main() {
  // Solicitar datos al usuario
  print('Ingrese el nombre del empleado:');
  String nombre = stdin.readLineSync() ?? '';

  print('Ingrese los minutos de tardanza:');
  int minutosTardanza = int.parse(stdin.readLineSync() ?? '0');

  print('Ingrese el número de observaciones:');
  int observaciones = int.parse(stdin.readLineSync() ?? '0');

  // Crear objeto Evaluacion y Empleado
  Evaluacion evaluacion = Evaluacion(minutosTardanza, observaciones);
  Empleado empleado = Empleado(nombre, evaluacion);

  // Calcular puntajes y bonificación
  int puntajePuntualidad = evaluacion.puntajePorPuntualidad();
  int puntajeRendimiento = evaluacion.puntajePorRendimiento();
  int puntajeTotal = evaluacion.puntajeTotal();
  double bonificacion = evaluacion.bonificacion();

  // Mostrar resultados
  print('Empleado: ${empleado.nombre}');
  print('Puntaje por puntualidad: $puntajePuntualidad');
  print('Puntaje por rendimiento: $puntajeRendimiento');
  print('Puntaje total: $puntajeTotal');
  print('Bonificación: S/. ${bonificacion.toStringAsFixed(2)}');
}
