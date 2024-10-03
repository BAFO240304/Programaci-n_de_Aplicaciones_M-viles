import 'dart:io';
void main() {

  const double sueldoBasico = 600.0;
  const double porcentajeComisionBaja = 0.05;
  const double porcentajeComisionAlta = 0.07;
  const double bonificacionBaja = 25.0;
  const double bonificacionAlta = 22.0;
  const double porcentajeDescuentoBajo = 0.11;
  const double porcentajeDescuentoAlto = 0.15;
  const double limiteComision = 15000.0;
  const double limiteSueldoBruto = 3500.0;
  print("Ingrese el importe total vendido: ");
  double importeVendido = double.parse(stdin.readLineSync()!);
  print("Ingrese el número de hijos: ");
  int numeroHijos = int.parse(stdin.readLineSync()!);
  double comision = (importeVendido > limiteComision)
      ? (importeVendido * porcentajeComisionAlta)
      : (importeVendido * porcentajeComisionBaja);
  double bonificacion = (numeroHijos < 5)
      ? (numeroHijos * bonificacionBaja)
      : (numeroHijos * bonificacionAlta);
  double sueldoBruto = sueldoBasico + comision + bonificacion;
  double descuento = (sueldoBruto > limiteSueldoBruto)
      ? (sueldoBruto * porcentajeDescuentoAlto)
      : (sueldoBruto * porcentajeDescuentoBajo);
  double sueldoNeto = sueldoBruto - descuento;
  print("Sueldo básico: S/. ${sueldoBasico.toStringAsFixed(2)}");
  print("Comisión: S/. ${comision.toStringAsFixed(2)}");
  print("Bonificación: S/. ${bonificacion.toStringAsFixed(2)}");
  print("Sueldo bruto: S/. ${sueldoBruto.toStringAsFixed(2)}");
  print("Descuento: S/. ${descuento.toStringAsFixed(2)}");
  print("Sueldo neto: S/. ${sueldoNeto.toStringAsFixed(2)}");
}
