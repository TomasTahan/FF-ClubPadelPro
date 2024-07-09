// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubStruct extends BaseStruct {
  ClubStruct({
    int? clubId,
    String? nombre,
    String? ubicacion,
    Color? colorTrue,
    Color? colorSecundario,
    String? merchantCode,
    String? merchantToken,
    bool? canchaTechada,
  })  : _clubId = clubId,
        _nombre = nombre,
        _ubicacion = ubicacion,
        _colorTrue = colorTrue,
        _colorSecundario = colorSecundario,
        _merchantCode = merchantCode,
        _merchantToken = merchantToken,
        _canchaTechada = canchaTechada;

  // "clubId" field.
  int? _clubId;
  int get clubId => _clubId ?? 0;
  set clubId(int? val) => _clubId = val;

  void incrementClubId(int amount) => clubId = clubId + amount;

  bool hasClubId() => _clubId != null;

  // "nombre" field.
  String? _nombre;
  String get nombre => _nombre ?? '';
  set nombre(String? val) => _nombre = val;

  bool hasNombre() => _nombre != null;

  // "ubicacion" field.
  String? _ubicacion;
  String get ubicacion => _ubicacion ?? '';
  set ubicacion(String? val) => _ubicacion = val;

  bool hasUbicacion() => _ubicacion != null;

  // "colorTrue" field.
  Color? _colorTrue;
  Color? get colorTrue => _colorTrue;
  set colorTrue(Color? val) => _colorTrue = val;

  bool hasColorTrue() => _colorTrue != null;

  // "colorSecundario" field.
  Color? _colorSecundario;
  Color? get colorSecundario => _colorSecundario;
  set colorSecundario(Color? val) => _colorSecundario = val;

  bool hasColorSecundario() => _colorSecundario != null;

  // "merchantCode" field.
  String? _merchantCode;
  String get merchantCode => _merchantCode ?? '';
  set merchantCode(String? val) => _merchantCode = val;

  bool hasMerchantCode() => _merchantCode != null;

  // "merchantToken" field.
  String? _merchantToken;
  String get merchantToken => _merchantToken ?? '';
  set merchantToken(String? val) => _merchantToken = val;

  bool hasMerchantToken() => _merchantToken != null;

  // "canchaTechada" field.
  bool? _canchaTechada;
  bool get canchaTechada => _canchaTechada ?? false;
  set canchaTechada(bool? val) => _canchaTechada = val;

  bool hasCanchaTechada() => _canchaTechada != null;

  static ClubStruct fromMap(Map<String, dynamic> data) => ClubStruct(
        clubId: castToType<int>(data['clubId']),
        nombre: data['nombre'] as String?,
        ubicacion: data['ubicacion'] as String?,
        colorTrue: getSchemaColor(data['colorTrue']),
        colorSecundario: getSchemaColor(data['colorSecundario']),
        merchantCode: data['merchantCode'] as String?,
        merchantToken: data['merchantToken'] as String?,
        canchaTechada: data['canchaTechada'] as bool?,
      );

  static ClubStruct? maybeFromMap(dynamic data) =>
      data is Map ? ClubStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'clubId': _clubId,
        'nombre': _nombre,
        'ubicacion': _ubicacion,
        'colorTrue': _colorTrue,
        'colorSecundario': _colorSecundario,
        'merchantCode': _merchantCode,
        'merchantToken': _merchantToken,
        'canchaTechada': _canchaTechada,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'clubId': serializeParam(
          _clubId,
          ParamType.int,
        ),
        'nombre': serializeParam(
          _nombre,
          ParamType.String,
        ),
        'ubicacion': serializeParam(
          _ubicacion,
          ParamType.String,
        ),
        'colorTrue': serializeParam(
          _colorTrue,
          ParamType.Color,
        ),
        'colorSecundario': serializeParam(
          _colorSecundario,
          ParamType.Color,
        ),
        'merchantCode': serializeParam(
          _merchantCode,
          ParamType.String,
        ),
        'merchantToken': serializeParam(
          _merchantToken,
          ParamType.String,
        ),
        'canchaTechada': serializeParam(
          _canchaTechada,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ClubStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClubStruct(
        clubId: deserializeParam(
          data['clubId'],
          ParamType.int,
          false,
        ),
        nombre: deserializeParam(
          data['nombre'],
          ParamType.String,
          false,
        ),
        ubicacion: deserializeParam(
          data['ubicacion'],
          ParamType.String,
          false,
        ),
        colorTrue: deserializeParam(
          data['colorTrue'],
          ParamType.Color,
          false,
        ),
        colorSecundario: deserializeParam(
          data['colorSecundario'],
          ParamType.Color,
          false,
        ),
        merchantCode: deserializeParam(
          data['merchantCode'],
          ParamType.String,
          false,
        ),
        merchantToken: deserializeParam(
          data['merchantToken'],
          ParamType.String,
          false,
        ),
        canchaTechada: deserializeParam(
          data['canchaTechada'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ClubStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClubStruct &&
        clubId == other.clubId &&
        nombre == other.nombre &&
        ubicacion == other.ubicacion &&
        colorTrue == other.colorTrue &&
        colorSecundario == other.colorSecundario &&
        merchantCode == other.merchantCode &&
        merchantToken == other.merchantToken &&
        canchaTechada == other.canchaTechada;
  }

  @override
  int get hashCode => const ListEquality().hash([
        clubId,
        nombre,
        ubicacion,
        colorTrue,
        colorSecundario,
        merchantCode,
        merchantToken,
        canchaTechada
      ]);
}

ClubStruct createClubStruct({
  int? clubId,
  String? nombre,
  String? ubicacion,
  Color? colorTrue,
  Color? colorSecundario,
  String? merchantCode,
  String? merchantToken,
  bool? canchaTechada,
}) =>
    ClubStruct(
      clubId: clubId,
      nombre: nombre,
      ubicacion: ubicacion,
      colorTrue: colorTrue,
      colorSecundario: colorSecundario,
      merchantCode: merchantCode,
      merchantToken: merchantToken,
      canchaTechada: canchaTechada,
    );
