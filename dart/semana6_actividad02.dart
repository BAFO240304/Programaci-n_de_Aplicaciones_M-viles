import 'dart:io';
class InversionFeria {
  final double alquilerPorcentaje = 0.23;
  final double publicidadPorcentaje = 0.07;
  final double transportePorcentaje = 0.26;
  final double serviciosPorcentaje = 0.12;
  final double decoracionPorcentaje = 0.21;
  final double variosPorcentaje = 0.11;
  double calcularGasto(double total, double porcentaje) {
    return total * porcentaje;
  }
  void imprimirDetalleInversion(double total) {
    print("\n===== DISTRIBUCIÓN DE LA INVERSIÓN =====");
    print("Total a invertir: S/. ${total.toStringAsFixed(2)}");
    print("Alquiler de espacio: S/. ${calcularGasto(total, alquilerPorcentaje).toStringAsFixed(2)}");
    print("Publicidad: S/. ${calcularGasto(total, publicidadPorcentaje).toStringAsFixed(2)}");
    print("Transporte: S/. ${calcularGasto(total, transportePorcentaje).toStringAsFixed(2)}");
    print("Servicios feriales: S/. ${calcularGasto(total, serviciosPorcentaje).toStringAsFixed(2)}");
    print("Decoración: S/. ${calcularGasto(total, decoracionPorcentaje).toStringAsFixed(2)}");
    print("Gastos varios: S/. ${calcularGasto(total, variosPorcentaje).toStringAsFixed(2)}");
    print("=======================================");
  }
}
class Feria {
  InversionFeria inversion = InversionFeria();
  double totalInvertir = 0.0;
  void solicitarMontoInversion() {
    print("Ingrese el monto total a invertir en la feria:");
    String? input = stdin.readLineSync();
    totalInvertir = double.tryParse(input!) ?? 0;
  }
  void procesarInversion() {
    if (totalInvertir > 0) {
      inversion.imprimirDetalleInversion(totalInvertir);
    } else {
      print("El monto ingresado no es válido.");
    }
  }
}
void main() {
  Feria feria = Feria(); 
  feria.solicitarMontoInversion();
  feria.procesarInversion();
}
