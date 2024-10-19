CLASS zcl_lab_01_var_aapg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

    TYPES: BEGIN OF mty_customer,
             id       TYPE i,
             customer TYPE c LENGTH 15,
             age      TYPE i,
           END OF mty_customer.

    CONSTANTS: mc_purchase_date TYPE d VALUE '20240930'.
    CONSTANTS: mc_purchase_time TYPE t VALUE '210500'.

    CONSTANTS: mc_price     TYPE f VALUE '10.5'.
    CONSTANTS: mc_tax       TYPE i VALUE '16'.
    CONSTANTS: mc_increase  TYPE decfloat16 VALUE '20.5'.
    CONSTANTS: mc_discounts TYPE decfloat34 VALUE '10.5'.
    CONSTANTS: mc_type      TYPE c LENGTH 10 VALUE 'PC'.
    CONSTANTS: mc_shipping  TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36'.
    CONSTANTS: mc_id_code   TYPE n LENGTH 4 VALUE '1110'.
    CONSTANTS: mc_qr_code   TYPE x LENGTH 5 VALUE 'F5FC'.

    CONSTANTS: BEGIN OF mc_customer,
                 id       TYPE i           VALUE 10,
                 customer TYPE c LENGTH 15 VALUE 'John Doe',
                 age      TYPE i           VALUE 20,
               END OF mc_customer.

    CONSTANTS: mc_airport TYPE REF TO /dmo/airport VALUE IS INITIAL.

    CONSTANTS: mc_product  TYPE string  VALUE 'Laptop'.
    CONSTANTS: mc_bar_code TYPE xstring VALUE '12121121211'.

  PROTECTED SECTION.

    CLASS-METHODS:

      elementary_data_type
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out,

      complex_data_type
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out,

      reference_data_type
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out,

      data_object
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out,

      constants_practice
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out,

      inline_declaration
        IMPORTING
          out TYPE REF TO if_oo_adt_classrun_out.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lab_01_var_aapg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "Tipo de Datos Elemental
    elementary_data_type( out ).

    "Tipo de Datos Complejo
    complex_data_type( out ).

    "Tipo de Datos de Referencia
    reference_data_type( out ).

    "Objeto de Datos
    data_object( out ).

    "Constantes
    constants_practice( out ).

    "Declaraciones en línea
    inline_declaration( out ).

  ENDMETHOD.

  METHOD elementary_data_type.
    "Tipos Elementales

    DATA: mv_purchase_date TYPE d.
    DATA: mv_purchase_time TYPE t.

    DATA: mv_price     TYPE f VALUE '10.5'.
    DATA: mv_tax       TYPE i VALUE '16'.
    DATA: mv_increase  TYPE decfloat16 VALUE '20.5'.
    DATA: mv_discounts TYPE decfloat34 VALUE '10.5'.
    DATA: mv_type      TYPE c LENGTH 10 VALUE 'PC'.
    DATA: mv_shipping  TYPE p LENGTH 8 DECIMALS 2 VALUE '40.36'.
    DATA: mv_id_code   TYPE n LENGTH 4 VALUE '1110'.
    DATA: mv_qr_code   TYPE x LENGTH 5 VALUE 'F5FC'.

    mv_purchase_date = cl_abap_context_info=>get_system_date( ).
    mv_purchase_time = cl_abap_context_info=>get_system_time( ).

    "Se muestra el resultado en consola para cada escenario
    out->write( |Tipos de Datos Elementales| ).
    out->write( |Fecha del sistema: { mv_purchase_date DATE = USER } - Hora del Sistema: { mv_purchase_time TIME = USER }| ).

    out->write( |Variable MV_PRICE:| ).
    out->write( mv_price ).

    out->write( |Variable MV_TAX:| ).
    out->write( mv_tax ).

    out->write( |Variable MV_INCREASE:| ).
    out->write( mv_increase ).

    out->write( |Variable MV_DISCOUNTS:| ).
    out->write( mv_discounts ).

    out->write( |Variable MV_TYPE:| ).
    out->write( mv_type ).

    out->write( |Variable MV_SHIPPING:| ).
    out->write( mv_shipping ).

    out->write( |Variable MV_ID_CODE:| ).
    out->write( mv_id_code ).

    out->write( |Variable MV_QR_CODE:| ).
    out->write( mv_qr_code ).

  ENDMETHOD.

  METHOD complex_data_type.
    "Tipos Complejos

    DATA(ms_customer) = VALUE mty_customer( id       = 10
                                            customer = 'John Doe'
                                            age      = 20 ).

    "Se muestra el resultado en consola
    out->write( |Tipos de Datos Complejos| ).
    out->write( ms_customer ).

  ENDMETHOD.

  METHOD reference_data_type.
    "TIpos de Referencia

    DATA: ms_airport TYPE REF TO /dmo/airport.

    ms_airport = NEW #( ).

    IF ms_airport IS BOUND.

      ms_airport->airport_id = 'ABC'.
      ms_airport->city       = 'New York'.
      ms_airport->client     = '123'.
      ms_airport->country    = 'US'.
      ms_airport->name       = 'John F. Kennedy'.

    ENDIF.

    "Se muestra el resultado en consola
    out->write( |Tipo de Datos de Referencia| ).
    out->write( ms_airport ).

  ENDMETHOD.

  METHOD data_object.
    "Objetos de Datos

    DATA: mv_product  TYPE string  VALUE 'Laptop'.
    DATA: mv_bar_code TYPE xstring VALUE '12121121211'.

    "Se muestra el resultado en consola
    out->write( |Objeto de Datos| ).
    out->write( |Variable MV_PRODUCT:| ).
    out->write( mv_product ).
    out->write( |Variable MV_BAR_CODE:| ).
    out->write( mv_bar_code ).

  ENDMETHOD.

  METHOD constants_practice.
    "Constantes

    DATA: mv_purchase_date TYPE d.
    DATA: mv_purchase_time TYPE t.
    DATA: mv_price         TYPE f.
    DATA: mv_tax           TYPE i.
    DATA: mv_increase      TYPE decfloat16.
    DATA: mv_discounts     TYPE decfloat34.
    DATA: mv_type          TYPE c LENGTH 10 .
    DATA: mv_shipping      TYPE p LENGTH 8 DECIMALS 2.
    DATA: mv_id_code       TYPE n LENGTH 4.
    DATA: mv_qr_code       TYPE x LENGTH 5.
    DATA: ms_customer      TYPE mty_customer.
    DATA: ms_airport       TYPE REF TO /dmo/airport.
    DATA: mv_product       TYPE string.
    DATA: mv_bar_code      TYPE xstring.

    mv_purchase_date = mc_purchase_date.
    mv_purchase_time = mc_purchase_time.
    mv_price         = mc_price.
    mv_tax           = mc_tax.
    mv_increase      = mc_increase.
    mv_discounts     = mc_discounts.
    mv_type          = mc_type.
    mv_shipping      = mc_shipping.
    mv_id_code       = mc_id_code.
    mv_qr_code       = mc_qr_code.
    ms_customer      = mc_customer.
    ms_airport       = mc_airport.
    mv_product       = mc_product.
    mv_bar_code      = mc_bar_code.

    "Se crea la referencia de la variable ms_airport y se le asignan valores
    ms_airport = NEW #( ).

    IF ms_airport IS BOUND.

      ms_airport->* = VALUE #( airport_id = 'ABC'
                               city       = 'New York'
                               client     = '123'
                               country    = 'US'
                               name       = 'John F. Kennedy' ).

    ENDIF.

    "Se muestra el resultado en consola
    out->write( |Prueba de Constantes| ).

    out->write( |Fecha del sistema: { mv_purchase_date DATE = USER } - Hora del Sistema: { mv_purchase_time TIME = USER }| ).

    out->write( |Variable MV_PRICE:| ).
    out->write( mv_price ).

    out->write( |Variable MV_TAX:| ).
    out->write( mv_tax ).

    out->write( |Variable MV_INCREASE:| ).
    out->write( mv_increase ).

    out->write( |Variable MV_DISCOUNTS:| ).
    out->write( mv_discounts ).

    out->write( |Variable MV_TYPE:| ).
    out->write( mv_type ).

    out->write( |Variable MV_SHIPPING:| ).
    out->write( mv_shipping ).

    out->write( |Variable MV_ID_CODE:| ).
    out->write( mv_id_code ).

    out->write( |Variable MV_QR_CODE:| ).
    out->write( mv_qr_code ).

    out->write( |Variable MS_CUSTOMER:| ).
    out->write( ms_customer ).

    out->write( |Variable MS_AIRPORT:| ).
    out->write( ms_airport ).

    out->write( |Variable MV_PRODUCT:| ).
    out->write( mv_product ).

    out->write( |Variable MV_BAR_CODE:| ).
    out->write( mv_bar_code ).

  ENDMETHOD.

  METHOD inline_declaration.
    "Declaraciones en Línea

    DATA(mv_product)  = mc_product.
    DATA(mv_bar_code) = mc_bar_code.

    "Se muestra el resultado en consola
    out->write( |Declaraciones en Línea| ).
    out->write( |Variable MV_PRODUCT:| ).
    out->write( mv_product ).
    out->write( |Variable MV_BAR_CODE:| ).
    out->write( mv_bar_code ).

  ENDMETHOD.

ENDCLASS.
