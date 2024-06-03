// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NextDaysStruct extends BaseStruct {
  NextDaysStruct({
    String? diaAbreviado,
    int? diaNumero,
    String? mesAbreviado,
    String? fechaCompleta,
  })  : _diaAbreviado = diaAbreviado,
        _diaNumero = diaNumero,
        _mesAbreviado = mesAbreviado,
        _fechaCompleta = fechaCompleta;

  // "DiaAbreviado" field.
  String? _diaAbreviado;
  String get diaAbreviado => _diaAbreviado ?? '';
  set diaAbreviado(String? val) => _diaAbreviado = val;
  bool hasDiaAbreviado() => _diaAbreviado != null;

  // "DiaNumero" field.
  int? _diaNumero;
  int get diaNumero => _diaNumero ?? 0;
  set diaNumero(int? val) => _diaNumero = val;
  void incrementDiaNumero(int amount) => _diaNumero = diaNumero + amount;
  bool hasDiaNumero() => _diaNumero != null;

  // "MesAbreviado" field.
  String? _mesAbreviado;
  String get mesAbreviado => _mesAbreviado ?? '';
  set mesAbreviado(String? val) => _mesAbreviado = val;
  bool hasMesAbreviado() => _mesAbreviado != null;

  // "fechaCompleta" field.
  String? _fechaCompleta;
  String get fechaCompleta => _fechaCompleta ?? '';
  set fechaCompleta(String? val) => _fechaCompleta = val;
  bool hasFechaCompleta() => _fechaCompleta != null;

  static NextDaysStruct fromMap(Map<String, dynamic> data) => NextDaysStruct(
        diaAbreviado: data['DiaAbreviado'] as String?,
        diaNumero: castToType<int>(data['DiaNumero']),
        mesAbreviado: data['MesAbreviado'] as String?,
        fechaCompleta: data['fechaCompleta'] as String?,
      );

  static NextDaysStruct? maybeFromMap(dynamic data) =>
      data is Map ? NextDaysStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'DiaAbreviado': _diaAbreviado,
        'DiaNumero': _diaNumero,
        'MesAbreviado': _mesAbreviado,
        'fechaCompleta': _fechaCompleta,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'DiaAbreviado': serializeParam(
          _diaAbreviado,
          ParamType.String,
        ),
        'DiaNumero': serializeParam(
          _diaNumero,
          ParamType.int,
        ),
        'MesAbreviado': serializeParam(
          _mesAbreviado,
          ParamType.String,
        ),
        'fechaCompleta': serializeParam(
          _fechaCompleta,
          ParamType.String,
        ),
      }.withoutNulls;

  static NextDaysStruct fromSerializableMap(Map<String, dynamic> data) =>
      NextDaysStruct(
        diaAbreviado: deserializeParam(
          data['DiaAbreviado'],
          ParamType.String,
          false,
        ),
        diaNumero: deserializeParam(
          data['DiaNumero'],
          ParamType.int,
          false,
        ),
        mesAbreviado: deserializeParam(
          data['MesAbreviado'],
          ParamType.String,
          false,
        ),
        fechaCompleta: deserializeParam(
          data['fechaCompleta'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NextDaysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NextDaysStruct &&
        diaAbreviado == other.diaAbreviado &&
        diaNumero == other.diaNumero &&
        mesAbreviado == other.mesAbreviado &&
        fechaCompleta == other.fechaCompleta;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([diaAbreviado, diaNumero, mesAbreviado, fechaCompleta]);
}

NextDaysStruct createNextDaysStruct({
  String? diaAbreviado,
  int? diaNumero,
  String? mesAbreviado,
  String? fechaCompleta,
}) =>
    NextDaysStruct(
      diaAbreviado: diaAbreviado,
      diaNumero: diaNumero,
      mesAbreviado: mesAbreviado,
      fechaCompleta: fechaCompleta,
    );
