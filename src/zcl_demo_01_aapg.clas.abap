CLASS zcl_demo_01_aapg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_01_aapg IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA: lv_text   TYPE c LENGTH 20 VALUE '   Prueba   '.
*    DATA: lv_string TYPE string      VALUE '   Prueba   '.
*
*    out->write( 'Prueba CHAR' ).
*    out->write( |STRLEN: { numofchar( lv_text ) } | ).
*    out->write( |NUMOFCHAR: { numofchar( lv_text ) }| ).
*
*    out->write( 'Prueba STRIGN' ).
*    out->write( |STRLEN: { numofchar( lv_string ) } | ).
*    out->write( |NUMOFCHAR: { numofchar( lv_string ) }| ).

*    DATA: lv_result TYPE string VALUE '1234567890'.
*
*    lv_result = substring( val = lv_result off = 2 len = 3 ).
*    out->write( lv_result ).

*    DATA: lv_char TYPE c LENGTH 10 VALUE '     CLOUD'.
*
*    SHIFT lv_char LEFT DELETING LEADING abap_false.
*    out->write( lv_char ).

*    DATA: lv_string   TYPE string VALUE 'ABAP CLOUD'.
*    DATA: lv_position TYPE i.
*
*    lv_position = find_any_of( val = lv_string sub = 'OU' ).
*    out->write( lv_position ).

    DATA: lv_char TYPE c LENGTH 10 VALUE '      ABCD'.

    SHIFT lv_char LEFT DELETING LEADING space.
    out->write( lv_char ).


  ENDMETHOD.

ENDCLASS.
