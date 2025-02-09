Проект с демонстрацией возможности вызова Fortran кода на Dart

Необходимые пакеты
ffi
ffigen

1 Исходный код на Фортран должен быть написан в режиме совместимости с языком C
    использовать именованные типы из iso_c_binding  (https://fortranwiki.org/fortran/show/iso_c_binding)
    использовать инструкции вида bind(C, name="add_f") для однозначного определения наименования функции, т.к. компилятор Фортран может приписывать к исходным названиями доп. символы(_)
2 Сформировать dll файл из исходного кода с расширением .f90. В примере указан пример команды для компилятора gfortran.
    gfortran -shared -o math_functions.dll math_functions.f90
    gfortran -shared -o string_functions.dll string_functions.f90
3 Создать header-файлы на языке C с сигнатурой функций из Fortran
    double add_f(double a, double b);
    void concatenate(const char* str1, const char* str2, char* result_str);

4 Настроить конфигурационный файл ffigen
    name: наименование генерируемого класса
    description: описание класса
    comments: опции переноса комментариев из .h файлов
    output: путь и наименование для генерируемого файла
    llvm-path: расположение пакета llvm
    headers: 
        entry-points: наименования используемых .h файлов
    
Конфигурации можно указать как в pubspec.yaml, так и в отдельном файле
Полный набор настроек приведен на сайте пакета [text](https://pub.dev/packages/ffigen)

5 Запустить ffigen для генерации файла
    dart run ffigen
В случае отдельного конфигурационного файла передать параметр --config
    dart run ffigen --config ffigen.yaml

6 После генерации файла можно вызывать исходные Fortran функции.




gfortran -shared -o math_functions.dll math_functions.f90
dart run ffigen --config ffigen.yaml