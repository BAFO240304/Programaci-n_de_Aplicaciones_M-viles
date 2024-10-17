import 'dart:io';
class Empleado {
  String categoria;
  double horasTrabajadas;
  int numeroHijos;
  Empleado(this.categoria, this.horasTrabajadas, this.numeroHijos);
}
class Sueldo {
  static const double tarifaA = 45.0;
  static const double tarifaB = 37.5;
  double calcularSueldoBasico(Empleado empleado) {
    double tarifaHoraria = empleado.categoria == 'A' ? tarifaA : tarifaB;
    return tarifaHoraria * empleado.horasTrabajadas;
  }
  double calcularSueldoBruto(Empleado empleado, Bonificacion bonificacion) {
    double sueldoBasico = calcularSueldoBasico(empleado);
    double bonificacionTotal = bonificacion.calcularBonificacion(empleado);
    return sueldoBasico + bonificacionTotal;
  }
}
class Bonificacion {
  static const double bonificacionPorHijoHasta3 = 40.5;
  static const double bonificacionPorHijoMasDe3 = 35.0;

  double calcularBonificacion(Empleado empleado) {
    if (empleado.numeroHijos <= 3) {
      return empleado.numeroHijos * bonificacionPorHijoHasta3;
    } else {
      return (3 * bonificacionPorHijoHasta3) +
          ((empleado.numeroHijos - 3) * bonificacionPorHijoMasDe3);
    }
  }
}
class Descuento {
  static const double porcentajeDescuentoAlto = 0.135;
  static const double porcentajeDescuentoBajo = 0.10;
  double calcularDescuento(double sueldoBruto) {
    if (sueldoBruto >= 3500) {
      return sueldoBruto * porcentajeDescuentoAlto;
    } else {
      return sueldoBruto * porcentajeDescuentoBajo;
    }
  }
}
class Boleta {
  void imprimirBoleta(Empleado empleado, Sueldo sueldo, Bonificacion bonificacion, Descuento descuento) {
    double sueldoBasico = sueldo.calcularSueldoBasico(empleado);
    double bonificacionTotal = bonificacion.calcularBonificacion(empleado);
    double sueldoBruto = sueldoBasico + bonificacionTotal;
    double descuentoTotal = descuento.calcularDescuento(sueldoBruto);
    double sueldoNeto = sueldoBruto - descuentoTotal;
    print("\n===== BOLETA DE SUELDO =====");
    print("Sueldo Básico: S/. ${sueldoBasico.toStringAsFixed(2)}");
    print("Bonificación por Hijos: S/. ${bonificacionTotal.toStringAsFixed(2)}");
    print("Sueldo Bruto: S/. ${sueldoBruto.toStringAsFixed(2)}");
    print("Descuento: S/. ${descuentoTotal.toStringAsFixed(2)}");
    print("Sueldo Neto: S/. ${sueldoNeto.toStringAsFixed(2)}");
    print("==============================");
  }
}
void main() {
  Empleado empleado = obtenerDatosEmpleado();
  Sueldo sueldo = Sueldo();
  Bonificacion bonificacion = Bonificacion();
  Descuento descuento = Descuento();
  Boleta boleta = Boleta();

  boleta.imprimirBoleta(empleado, sueldo, bonificacion, descuento);
}
Empleado obtenerDatosEmpleado() {
  print("Ingrese la categoría del empleado (A o B):");
  String? categoria = stdin.readLineSync()?.toUpperCase();
  print("Ingrese las horas trabajadas:");
  double horasTrabajadas = double.tryParse(stdin.readLineSync()!) ?? 0.0;
  print("Ingrese el número de hijos:");
  int numeroHijos = int.tryParse(stdin.readLineSync()!) ?? 0;
  return Empleado(categoria!, horasTrabajadas, numeroHijos);
}
