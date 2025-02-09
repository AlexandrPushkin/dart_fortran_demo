import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:interop_demo/fortran_functions_bindings.dart';

void main() {
  final mathFunctionsPath = 'math_functions.dll';
  final mathlib = DynamicLibrary.open(mathFunctionsPath);
  final mathFunctions = FortranFunctions(mathlib);

  double a = 91;
  double b = 30;
  double result;

  result = mathFunctions.add_f(a, b);
  print('Fortran: The sum of $a and $b is $result');
  result = mathFunctions.sub_f(a, b);
  print('Fortran: The sub of $a and $b is $result');
  result = mathFunctions.div_f(a, b);
  print('Fortran: The div of $a and $b is $result');
  result = mathFunctions.mul_f(a, b);
  print('Fortran: The mul of $a and $b is $result');

  final stringFunctionsPath = 'string_functions.dll';
  final stringlib = DynamicLibrary.open(stringFunctionsPath);
  final stringFunctions = FortranFunctions(stringlib);

  final str1 = 'Hello, '.toNativeUtf8().cast<Char>();
  final str2 = 'World!'.toNativeUtf8().cast<Char>();
  final resultStr = calloc<Char>(100);
  stringFunctions.concatenate(
    str1,
    str2,
    resultStr,
  );
  print('Concatenated string: ${resultStr.cast<Utf8>().toDartString()}');

  calloc.free(str1);
  calloc.free(str2);
  calloc.free(resultStr);
}
