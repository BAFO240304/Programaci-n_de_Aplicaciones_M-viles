import 'dart:io';
class Vendedor {
  final double sueldoBasico = 350.75;
  final double porcentajeComision = 0.05;
  final double porcentajeDescuento = 0.15;
  double importeVendido = 0.0;
  void solicitarImporte() {
    print("Ingrese el importe total vendido en el mes:");
    String? input = stdin.readLineSync();
    importeVendido = double.tryParse(input!) ?? 0;
  }
  double calcularComision() {
    return importeVendido * porcentajeComision;
  }
  double calcularSueldoBruto() {
    return sueldoBasico + calcularComision();
  }
  double calcularDescuento() {
    return calcularSueldoBruto() * porcentajeDescuento;
  }
  double calcularSueldoNeto() {
    return calcularSueldoBruto() - calcularDescuento();
  }
  void imprimirBoleta() {
    double comision = calcularComision();
    double sueldoBruto = calcularSueldoBruto();
    double descuento = calcularDescuento();
    double sueldoNeto = calcularSueldoNeto();
    print("\n===== BOLETA DE PAGO =====");
    print("Sueldo Básico: S/. $sueldoBasico");
    print("Comisión (5% de S/. $importeVendido): S/. $comision");
    print("Sueldo Bruto: S/. $sueldoBruto");
    print("Descuento (15% del sueldo bruto): S/. $descuento");
    print("Sueldo Neto: S/. $sueldoNeto");
    print("==========================");
  }
}
void main() {
  Vendedor vendedor = Vendedor();
  vendedor.solicitarImporte();
  vendedor.imprimirBoleta();
}