CLASS zcl_lab_02_arithmetic_aapg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

    CLASS-METHODS:

      addition_exercise,
      subtraction_exercise,
      multiplication_exercise,
      division_exercise,
      integer_division_exercise,
      modulus_exercise,
      exponentiation_exercise,
      square_root_exercise.

    CLASS-DATA:

      go_out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_02_arithmetic_aapg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    go_out = out.

    "Ejercicio de Suma
    addition_exercise( ).

    "Ejercicio de Resta
    subtraction_exercise( ).

    "Ejercicio de Multiplicación
    multiplication_exercise( ).

    "Ejercicio de División
    division_exercise( ).

    "Ejercicio de División sin Resto
    integer_division_exercise( ).

    "Ejercicio de Residuo de División
    modulus_exercise( ).

    "Ejercicio de Exponenciación
    exponentiation_exercise( ).

    "Ejercicio de Raíz Cuadrada
    square_root_exercise( ).

  ENDMETHOD.

  METHOD addition_exercise.
    "Ejercicio de Suma - Sentencia ADD

    DATA: lv_base_rate            TYPE i VALUE 20.
    DATA: lv_corp_area_rate       TYPE i VALUE 10.
    DATA: lv_medical_service_rate TYPE i VALUE 15.
    DATA: lv_total_rate           TYPE i.

    "Se aplica operación de sumatoria de las variables con valor
    lv_total_rate = lv_base_rate + lv_corp_area_rate + lv_medical_service_rate.

    "Al resultado de la suma anterior se le suma el valor 5 con la sentencia obsoleta ADD
    ADD 5 TO lv_total_rate.

    "Se muestra el resultado en consola
    go_out->write( |Suma - Sentencia ADD \n| ).
    go_out->write( lv_total_rate ).

  ENDMETHOD.

  METHOD subtraction_exercise.
    "Ejercicio de Resta - Sentencia SUBTRACT

    DATA: lv_maintenance_rate TYPE i VALUE 30.
    DATA: lv_margin_rate      TYPE i VALUE 10.
    DATA: lv_base_rate        TYPE i.

    "Se aplica operación de resta sobre las variables con valor
    lv_base_rate = lv_maintenance_rate - lv_margin_rate.

    "Al resultado de la operación anterior, se le resta el valor 4 con la sentencia obsoleta SUBTRACT
    SUBTRACT 4 FROM lv_base_rate.

    "Se muestra el resultado en consola
    go_out->write( |\nResta - Sentencia SUBTRACT \n| ).
    go_out->write( lv_base_rate ).

  ENDMETHOD.

  METHOD multiplication_exercise.
    "Ejercicio de Multiplicación - Sentencia MULTIPLY

    DATA: lv_package_weight TYPE i VALUE 2.
    DATA: lv_cost_per_kg    TYPE i VALUE 3.
    DATA: lv_multi_rate     TYPE i.

    "Se aplica operación de multiplicación sobre las variables con valor
    lv_multi_rate = lv_package_weight * lv_cost_per_kg.

    "El resultado de la operación anterior, se multiplica por el valor 2 con la sentencia obsoleta MULTIPLY
    MULTIPLY lv_multi_rate BY 2.

    "Se muestra el resultado en consola
    go_out->write( |\nMultiplicación - Sentencia MULTIPLY \n| ).
    go_out->write( lv_multi_rate ).

  ENDMETHOD.

  METHOD division_exercise.
    "Ejercicio de División - Sentencia DIVIDE

    DATA: lv_total_weight TYPE i VALUE 38.
    DATA: lv_num_packages TYPE i VALUE 4.
    DATA: lv_applied_rate TYPE p LENGTH 8 DECIMALS 2.

    "Se aplica operación de división sobre las variables con valor
    lv_applied_rate = lv_total_weight / lv_num_packages.

    "El resultado de la operación anterior, se divide por el valor 3 con la sentencia obsoleta DIVIDE
    DIVIDE lv_applied_rate BY 3.

    "Se muestra el resultado en consola
    go_out->write( |\nDivisión - Sentencia DIVIDE \n| ).
    go_out->write( lv_applied_rate ).

  ENDMETHOD.

  METHOD integer_division_exercise.
    "Ejercicio de División sin Resto - Sentencia DIV

    DATA: lv_total_cost         TYPE i VALUE 17.
    DATA: lv_discount_threshold TYPE i VALUE 4.
    DATA: lv_result             TYPE p LENGTH 4 DECIMALS 2.

    "Se obtiene el resultado de la división sin resto.
    lv_result = lv_total_cost DIV lv_discount_threshold.

    "Se muestra el resultado en consola
    go_out->write( |\nDivisión sin Resto - Sentencia DIV\n| ).
    go_out->write( lv_result ).

  ENDMETHOD.

  METHOD modulus_exercise.
    "Ejercicio de Residuo de División - Sentencia MOD

    DATA: lv_total_cost         TYPE i VALUE 19.
    DATA: lv_discount_threshold TYPE i VALUE 4.
    DATA: lv_remainder          TYPE p LENGTH 4 DECIMALS 2.

    "Se obtiene el residuo de la división
    lv_remainder = lv_total_cost MOD lv_discount_threshold.

    "Se muestra el resultado en consola
    go_out->write( |\nResiduo de División - Sentencia MOD\n| ).
    go_out->write( lv_remainder ).

  ENDMETHOD.

  METHOD exponentiation_exercise.
    "Ejercicio de Exponenciación

    DATA: lv_weight TYPE i VALUE 5.
    DATA: lv_expo   TYPE i.

    "Se eleva al cuadrado la variable LV_WEIGHT
    lv_expo = ipow( base = lv_weight exp = 2 ).

    "Se muestra el resultado en consola
    go_out->write( |\nExponenciación\n| ).
    go_out->write( lv_expo ).

  ENDMETHOD.

  METHOD square_root_exercise.
    "Ejercicio de Raíz Cuadrada

    DATA: lv_square_root TYPE i.
    DATA: lv_expo        TYPE i VALUE 25. "Del ejercicio de exponenciación

    "Se determina la raíz cuadrada de la variable LV_EXPO
    lv_square_root = sqrt( lv_expo ).

    "Se muestra el resultado en consola
    go_out->write( |\nRaíz Cuadrada\n| ).
    go_out->write( lv_square_root ).

  ENDMETHOD.

ENDCLASS.
