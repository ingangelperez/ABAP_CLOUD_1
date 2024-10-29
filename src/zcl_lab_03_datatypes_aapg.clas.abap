CLASS zcl_lab_03_datatypes_aapg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.


    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.

    CLASS-METHODS:

      convert_data_type,
      truncate_and_round,
      inline_type_declaration,
      force_type_conversion,
      calculate_date_and_time,
      timestamp_fields.

    CLASS-DATA:

      go_out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_03_datatypes_aapg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    go_out = out.

    "Conversiones de Tipo
    convert_data_type( ).

    "Truncamiento y Redondeo
    truncate_and_round( ).

    "Tipos de Declaraciones en Línea
    inline_type_declaration( ).

    "Conversiones del Tipo Forzado
    force_type_conversion( ).

    "Cálculo de Fecha y Hora
    calculate_date_and_time( ).

    "Campos Timestamp
    timestamp_fields( ).

  ENDMETHOD.

  METHOD convert_data_type.
    "Conversiones de Tipo

    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345'.
    DATA: mv_num   TYPE i.
    DATA: mv_float TYPE f.

    "Convertir el valor de MV_CHAR a un número entero y a un número punto flotante
    mv_num   = mv_char.
    mv_float = mv_char.

    "Se muestra el resultado en consola
    go_out->write( |\nConversiones de Tipo| ).
    go_out->write( |Número Entero:| ).
    go_out->write( mv_num ).
    go_out->write( |Número Punto Flotante:| ).
    go_out->write( mv_float ).

  ENDMETHOD.

  METHOD truncate_and_round.
    "Truncamiento y Redondeo

    DATA: mv_trunc TYPE i.
    DATA: mv_round TYPE i.
    DATA: mv_float TYPE f VALUE '123.45'.

    "Se trunca el valor de MV_FLOAT en la primera variable y se redondea
    "el valor en la segunda variable sumándole el valor de “0,5”
    mv_trunc = mv_float.
    mv_round = mv_float + '0.5'.

    "Se muestra el resultado en consola
    go_out->write( |\nTruncamiento y Redondeo| ).
    go_out->write( |Truncamiento:| ).
    go_out->write( mv_trunc ).
    go_out->write( |Redondeo:| ).
    go_out->write( mv_round ).

  ENDMETHOD.

  METHOD inline_type_declaration.
    "Tipos de Declaraciones en Línea

    DATA(lv_abap_text) = 'ABAP'.

    "Se muestra el resultado en consola
    go_out->write( |\nTipos de Declaraciones en Línea| ).
    go_out->write( lv_abap_text ).

  ENDMETHOD.

  METHOD force_type_conversion.
    "Conversiones del Tipo Forzado

    DATA: mv_char  TYPE c LENGTH 10 VALUE '12345'.
    DATA: mv_num   TYPE i.

    "Se convierte forzadamente el valor de la primera variable
    "que se encuentra en caracteres a número
    mv_num = CONV i( mv_char ).

    "Se muestra el resultado en consola
    go_out->write( |\nConversiones del Tipo Forzado| ).
    go_out->write( mv_num ).

  ENDMETHOD.

  METHOD calculate_date_and_time.
    "Cálculo de Fecha y Hora

    DATA: mv_date_1 TYPE d.
    DATA: mv_date_2 TYPE d.
    DATA: mv_days   TYPE i.
    DATA: mv_time   TYPE t.

    "Se asignan valores a los campos MV_DATE_1 y MV_DATE_2 para obtener el número
    "de días entre la primera variable y la segunda
    mv_date_1 = '20240101'.
    mv_date_2 = cl_abap_context_info=>get_system_date( ).

    mv_days = mv_date_2 - mv_date_1.

    "Se muestra el resultado en consola
    go_out->write( |\nCálculo de Fecha y Hora| ).
    go_out->write( |Diferencia de días: { mv_days }| ).
    go_out->write( |MV_DATE_1 en Formato DDMMYYYY: { mv_date_1 DATE = USER }| ).

  ENDMETHOD.

  METHOD timestamp_fields.
    "Campos Timestamp

    DATA: mv_timestamp TYPE utclong.
    DATA: mv_date_2    TYPE d.
    DATA: mv_time      TYPE t.

    "Se obtiene la fecha actual con la función UTCLONG_CURRENT(), luego se pasa
    "la fecha y hora a 2 variables MV_DATE_2 y MV_TIME:
    mv_timestamp = utclong_current( ).

    TRY.

        CONVERT UTCLONG mv_timestamp
        TIME ZONE cl_abap_context_info=>get_user_time_zone( )
        INTO DATE mv_date_2
        TIME mv_time.

      CATCH cx_abap_context_info_error.
    ENDTRY.

    "Se resta 2 días a la variable MV_TIMESTAMP
    mv_timestamp = utclong_add( val = mv_timestamp days = -2 ).

    "Se muestra el resultado en consola
    go_out->write( |\nCampos Timestamp| ).
    go_out->write( |Fecha extraída de campo UTCLONG { mv_date_2 DATE = USER }| ).
    go_out->write( |Hora extraída de campo UTCLONG { mv_time TIME = USER }| ).
    go_out->write( |Campo Timestamp (menos 2 días) { mv_timestamp }| ).

  ENDMETHOD.

ENDCLASS.
