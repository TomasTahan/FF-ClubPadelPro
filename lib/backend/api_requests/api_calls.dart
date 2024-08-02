import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start SupabaseDashboard Group Code

class SupabaseDashboardGroup {
  static String getBaseUrl() =>
      'https://ttxvolraillgucvjjsen.supabase.co/rest/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
  };
  static FuncCanchasDispoCall funcCanchasDispoCall = FuncCanchasDispoCall();
  static FuncReservarCanchaCall funcReservarCanchaCall =
      FuncReservarCanchaCall();
  static FuncSalirPartidoCall funcSalirPartidoCall = FuncSalirPartidoCall();
  static GetPartidosUserCall getPartidosUserCall = GetPartidosUserCall();
  static GetClasesCall getClasesCall = GetClasesCall();
  static SearchUsersCall searchUsersCall = SearchUsersCall();
  static GetPartidosLigaUserCall getPartidosLigaUserCall =
      GetPartidosLigaUserCall();
  static SearchClubesCall searchClubesCall = SearchClubesCall();
  static FuncCanchasDispGenericoCall funcCanchasDispGenericoCall =
      FuncCanchasDispGenericoCall();
}

class FuncCanchasDispoCall {
  Future<ApiCallResponse> call({
    int? clubId,
    String? fecha = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "club_id": ${clubId},
  "fecha_reserva": "${fecha}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'funcCanchasDispo',
      apiUrl: '${baseUrl}/rpc/get_canchas_disp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? apiInicio(dynamic response) => (getJsonField(
        response,
        r'''$[:].inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiFinal(dynamic response) => (getJsonField(
        response,
        r'''$[:].fin''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? apiCanchas(dynamic response) => getJsonField(
        response,
        r'''$[:].canchas_disponibles''',
        true,
      ) as List?;
}

class FuncReservarCanchaCall {
  Future<ApiCallResponse> call({
    String? cliente = '',
    int? clubId,
    String? fecha = '',
    String? inicio = '',
    String? fin = '',
    bool? canchaTechada,
    int? partidoId,
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cliente_nombre": "${cliente}",
  "club_id": ${clubId},
  "fecha_reserva": "${fecha}",
  "hora_fin": "${fin}",
  "hora_inicio": "${inicio}",
  "cancha_techada": ${canchaTechada},
  "partido_id": ${partidoId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'funcReservarCancha',
      apiUrl: '${baseUrl}/rpc/reservar_cancha',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? numCancha(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.numCancha''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class FuncSalirPartidoCall {
  Future<ApiCallResponse> call({
    int? partidoId,
    String? playerId = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "partido_id": ${partidoId},
  "player_id": "${playerId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'funcSalirPartido',
      apiUrl: '${baseUrl}/rpc/salir_partido',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPartidosUserCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? fecha = '',
    int? clubId,
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPartidosUser',
      apiUrl:
          '${baseUrl}/VistaPartidos?select=*&or=(uidA.eq.${userId},uidB.eq.${userId},uidC.eq.${userId},uidD.eq.${userId})&fecha=lte.${fecha}&order=fecha.desc&clubId=eq.${clubId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? apiPartidoId(dynamic response) => getJsonField(
        response,
        r'''$[:].partidoId''',
        true,
      ) as List?;
  List? apiCreatedBy(dynamic response) => getJsonField(
        response,
        r'''$[:].createdBy''',
        true,
      ) as List?;
  List? apiFecha(dynamic response) => getJsonField(
        response,
        r'''$[:].fecha''',
        true,
      ) as List?;
  List? apiInicio(dynamic response) => getJsonField(
        response,
        r'''$[:].horaInicio''',
        true,
      ) as List?;
  List? apiFin(dynamic response) => getJsonField(
        response,
        r'''$[:].horaFin''',
        true,
      ) as List?;
  List? apiTipo(dynamic response) => getJsonField(
        response,
        r'''$[:].Tipo''',
        true,
      ) as List?;
  List? apiRankingA(dynamic response) => getJsonField(
        response,
        r'''$[:].RankingA''',
        true,
      ) as List?;
  List? apiNombreA(dynamic response) => getJsonField(
        response,
        r'''$[:].nombreA''',
        true,
      ) as List?;
  List? apiUidA(dynamic response) => getJsonField(
        response,
        r'''$[:].uidA''',
        true,
      ) as List?;
  List? apiAvatarA(dynamic response) => getJsonField(
        response,
        r'''$[:].avatarA''',
        true,
      ) as List?;
  List? apiHashA(dynamic response) => getJsonField(
        response,
        r'''$[:].hashA''',
        true,
      ) as List?;
  List? apiNombreB(dynamic response) => getJsonField(
        response,
        r'''$[:].nombreB''',
        true,
      ) as List?;
  List? apiUidB(dynamic response) => getJsonField(
        response,
        r'''$[:].uidB''',
        true,
      ) as List?;
  List? apiAvatarB(dynamic response) => getJsonField(
        response,
        r'''$[:].avatarB''',
        true,
      ) as List?;
  List? apiHashB(dynamic response) => getJsonField(
        response,
        r'''$[:].hashB''',
        true,
      ) as List?;
  List? apiNombreC(dynamic response) => getJsonField(
        response,
        r'''$[:].nombreC''',
        true,
      ) as List?;
  List? apiUidC(dynamic response) => getJsonField(
        response,
        r'''$[:].uidC''',
        true,
      ) as List?;
  List? apiAvatarC(dynamic response) => getJsonField(
        response,
        r'''$[:].avatarC''',
        true,
      ) as List?;
  List? apiHashC(dynamic response) => getJsonField(
        response,
        r'''$[:].hashC''',
        true,
      ) as List?;
  List? apiNombreD(dynamic response) => getJsonField(
        response,
        r'''$[:].nombreD''',
        true,
      ) as List?;
  List? apiUidD(dynamic response) => getJsonField(
        response,
        r'''$[:].uidD''',
        true,
      ) as List?;
  List? apiAvatarD(dynamic response) => getJsonField(
        response,
        r'''$[:].avatarD''',
        true,
      ) as List?;
  List? apiHashD(dynamic response) => getJsonField(
        response,
        r'''$[:].hashD''',
        true,
      ) as List?;
  List? apiPromA(dynamic response) => getJsonField(
        response,
        r'''$[:].promA''',
        true,
      ) as List?;
  List? apiPromB(dynamic response) => getJsonField(
        response,
        r'''$[:].promB''',
        true,
      ) as List?;
  List? apiResultado(dynamic response) => getJsonField(
        response,
        r'''$[:].resultado''',
        true,
      ) as List?;
}

class GetClasesCall {
  Future<ApiCallResponse> call({
    String? fecha = '',
    int? clubId,
    String? userId = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getClases',
      apiUrl:
          '${baseUrl}/VistaClases?select=*&fecha=eq.${fecha}&clubId=eq.${clubId}&profesorId=eq.${userId}&order=inicio.asc',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? apiClaseId(dynamic response) => (getJsonField(
        response,
        r'''$[:].claseId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? apiProfesorId(dynamic response) => (getJsonField(
        response,
        r'''$[:].profesorId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? apiAlumnoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].alumnoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiNombreProfe(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombreCompletoProfesor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiUserId(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiNombre(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiFecha(dynamic response) => (getJsonField(
        response,
        r'''$[:].fecha''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiInicio(dynamic response) => (getJsonField(
        response,
        r'''$[:].inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? apiCancha(dynamic response) => (getJsonField(
        response,
        r'''$[:].cancha''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? apiClubId(dynamic response) => (getJsonField(
        response,
        r'''$[:].clubId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? apiFin(dynamic response) => (getJsonField(
        response,
        r'''$[:].fin''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiEstadoClase(dynamic response) => (getJsonField(
        response,
        r'''$[:].estadoclase''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? apiPendientes(dynamic response) => (getJsonField(
        response,
        r'''$[:].pendientes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class SearchUsersCall {
  Future<ApiCallResponse> call({
    String? serachParam = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'searchUsers',
      apiUrl: '${baseUrl}/Users?nombre=ilike.%${serachParam}%&select=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? apiUserId(dynamic response) => (getJsonField(
        response,
        r'''$[:].userId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiNombre(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiApellido(dynamic response) => (getJsonField(
        response,
        r'''$[:].apellido''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiAvatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? apiHashAvatar(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarHashUrl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? apiRanking(dynamic response) => (getJsonField(
        response,
        r'''$[:].ranking''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class GetPartidosLigaUserCall {
  Future<ApiCallResponse> call({
    int? ligaId,
    String? uid = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getPartidosLigaUser',
      apiUrl:
          '${baseUrl}/VistaLigaPartidos?ligaId=eq.${ligaId}&or=(ida1.eq.${uid},ida2.eq.${uid},idb1.eq.${uid},idb2.eq.${uid})',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? partidoId(dynamic response) => (getJsonField(
        response,
        r'''$[:].partidoId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ida1(dynamic response) => (getJsonField(
        response,
        r'''$[:].ida1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? namea1(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombrea1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatara1(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarurla1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hasha1(dynamic response) => (getJsonField(
        response,
        r'''$[:].hashurla1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankinga1(dynamic response) => (getJsonField(
        response,
        r'''$[:].rankinga1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? ida2(dynamic response) => (getJsonField(
        response,
        r'''$[:].ida2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? namea2(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombrea2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatara2(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarurla2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hasha2(dynamic response) => (getJsonField(
        response,
        r'''$[:].hashurla2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankinga2(dynamic response) => (getJsonField(
        response,
        r'''$[:].rankinga2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? idb1(dynamic response) => (getJsonField(
        response,
        r'''$[:].idb1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nameb1(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombreb1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatarb1(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarurlb1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hashb1(dynamic response) => (getJsonField(
        response,
        r'''$[:].hashurlb1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankingb1(dynamic response) => (getJsonField(
        response,
        r'''$[:].rankingb1''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? idb2(dynamic response) => (getJsonField(
        response,
        r'''$[:].idb2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? nameb2(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombreb2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatarb2(dynamic response) => (getJsonField(
        response,
        r'''$[:].avatarurlb2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? hasb2(dynamic response) => (getJsonField(
        response,
        r'''$[:].hashurlb2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? rankingb2(dynamic response) => (getJsonField(
        response,
        r'''$[:].rankingb2''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? fecha(dynamic response) => (getJsonField(
        response,
        r'''$[:].fecha''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? inicio(dynamic response) => (getJsonField(
        response,
        r'''$[:].inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fin(dynamic response) => (getJsonField(
        response,
        r'''$[:].fin''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? resultado(dynamic response) => getJsonField(
        response,
        r'''$[:].resultado''',
        true,
      ) as List?;
  List<int>? ligaid(dynamic response) => (getJsonField(
        response,
        r'''$[:].ligaId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<int>? cancha(dynamic response) => (getJsonField(
        response,
        r'''$[:].cancha''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
}

class SearchClubesCall {
  Future<ApiCallResponse> call({
    String? serachParam = '',
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'searchClubes',
      apiUrl: '${baseUrl}/Clubes?nombre=ilike.%${serachParam}%&select=*',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? clubId(dynamic response) => (getJsonField(
        response,
        r'''$[:].clubId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? nombre(dynamic response) => (getJsonField(
        response,
        r'''$[:].nombre''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? ubicacion(dynamic response) => (getJsonField(
        response,
        r'''$[:].ubicacion''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? colorPrincipal(dynamic response) => (getJsonField(
        response,
        r'''$[:].colorPrincipal''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? colorSecundario(dynamic response) => (getJsonField(
        response,
        r'''$[:].colorSecundario''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? merchantCode(dynamic response) => (getJsonField(
        response,
        r'''$[:].merchantCode''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? merchantToken(dynamic response) => (getJsonField(
        response,
        r'''$[:].merchantToken''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? canchasTechadas(dynamic response) => getJsonField(
        response,
        r'''$[:].canchasTechadas''',
        true,
      ) as List?;
}

class FuncCanchasDispGenericoCall {
  Future<ApiCallResponse> call({
    int? clubId,
    String? fecha = '',
    bool? soloTechadas,
  }) async {
    final baseUrl = SupabaseDashboardGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "club_id": ${clubId},
  "fecha_reserva": "${fecha}",
  "solo_techadas": ${soloTechadas}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'funcCanchasDispGenerico',
      apiUrl: '${baseUrl}/rpc/get_canchas_disp_generico',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR0eHZvbHJhaWxsZ3Vjdmpqc2VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE0NjUzNTQsImV4cCI6MjAyNzA0MTM1NH0.fq2q6d5b6WGZ8jbQfAckJIjdACMg1gWsiff1sTHMUyk',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? inicio(dynamic response) => (getJsonField(
        response,
        r'''$[:].inicio''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fin(dynamic response) => (getJsonField(
        response,
        r'''$[:].fin''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

/// End SupabaseDashboard Group Code

/// Start MercadoPago Group Code

class MercadoPagoGroup {
  static String getBaseUrl() => 'https://api.mercadopago.com/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
  };
  static TokenCardCall tokenCardCall = TokenCardCall();
  static PaymentCall paymentCall = PaymentCall();
  static CrearCustomerCall crearCustomerCall = CrearCustomerCall();
  static BuscarCustomersCall buscarCustomersCall = BuscarCustomersCall();
  static BuscarCustomerCall buscarCustomerCall = BuscarCustomerCall();
  static GuardarTarjetaCall guardarTarjetaCall = GuardarTarjetaCall();
  static BuscarTarjetasCustomerCall buscarTarjetasCustomerCall =
      BuscarTarjetasCustomerCall();
  static BuscarTarjetaCall buscarTarjetaCall = BuscarTarjetaCall();
  static TokenCardIdCall tokenCardIdCall = TokenCardIdCall();
}

class TokenCardCall {
  Future<ApiCallResponse> call({
    String? publicKey = 'APP_USR-7f86dc47-84cf-4a48-a52b-4a1b6cf8d665',
    int? cardNumber = 4168818844447115,
    String? cardHolderName = 'Tomas Test',
    String? identificationType = '',
    String? identificationNumber = '',
    int? securityCode = 123,
    int? cardExpirationMonth = 11,
    int? cardExpirationYear = 2025,
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "card_number": "${cardNumber}",
  "cardholder": {
    "name": "${cardHolderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TokenCard',
      apiUrl: '${baseUrl}/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? cardId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? last4(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_four_digits''',
      ));
  String? fisrt6(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_six_digits''',
      ));
}

class PaymentCall {
  Future<ApiCallResponse> call({
    double? transactionAmount,
    String? token = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? description = '',
    String? uid = '',
    String? customrId = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${token}",
  "installments": 1,
  "payer": {
    "type": "customer",
    "id": "${customrId}",
    "email": "${email}",
    "first_name": "${firstName}",
    "last_name": "${lastName}"
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Payment',
      apiUrl: '${baseUrl}/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
        'Content-Type': 'application/json',
        'X-Idempotency-Key': '${uid}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? pagoStatus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class CrearCustomerCall {
  Future<ApiCallResponse> call({
    String? mail = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${mail}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CrearCustomer',
      apiUrl: '${baseUrl}/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? customerId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class BuscarCustomersCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCustomers',
      apiUrl: '${baseUrl}/customers/search',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? customersEmail(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? customersIds(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BuscarCustomerCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCustomer',
      apiUrl: '${baseUrl}/customers/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? cards(dynamic response) => getJsonField(
        response,
        r'''$.cards''',
        true,
      ) as List?;
}

class GuardarTarjetaCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? token = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GuardarTarjeta',
      apiUrl: '${baseUrl}/customers/${customerId}/cards',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? cardId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class BuscarTarjetasCustomerCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarTarjetasCustomer',
      apiUrl: '${baseUrl}/customers/${customerId}/cards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarTarjetaCall {
  Future<ApiCallResponse> call({
    String? customerId = '',
    String? id = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarTarjeta',
      apiUrl: '${baseUrl}/customers/{customer_id}/cards/{id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TokenCardIdCall {
  Future<ApiCallResponse> call({
    String? publicKey = 'APP_USR-7f86dc47-84cf-4a48-a52b-4a1b6cf8d665',
    String? cardId = '',
    String? securityCode = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "card_id": "${cardId}",
  "security_code": "${securityCode}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TokenCardId',
      apiUrl: '${baseUrl}/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-5737553057667426-060322-36cee9c8c8814dbd23f9de2329dde7b0-725570140',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

/// End MercadoPago Group Code

/// Start OneSignal Group Code

class OneSignalGroup {
  static String getBaseUrl() => 'https://onesignal.com';
  static Map<String, String> headers = {
    'Authorization': 'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
    'Content-Type': 'application/json',
  };
  static TestCall testCall = TestCall();
  static TagsCall tagsCall = TagsCall();
  static SegmentsCall segmentsCall = SegmentsCall();
  static ConfirmarPartidoCall confirmarPartidoCall = ConfirmarPartidoCall();
}

class TestCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = OneSignalGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "app_id": "8b84349d-6ad5-4bc7-8be0-081f6b3fb323",
  "external_user_ids": [
    "0f1beb62-7185-4c5a-8335-05e30cc151d6"
  ],
  "device_type": 1
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Test',
      apiUrl:
          '${baseUrl}/api/v1/players?app_id=8b84349d-6ad5-4bc7-8be0-081f6b3fb323',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TagsCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? club = '',
  }) async {
    final baseUrl = OneSignalGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "tags": {
    "${club}": "true"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Tags',
      apiUrl:
          '${baseUrl}/api/v1/apps/8b84349d-6ad5-4bc7-8be0-081f6b3fb323/users/${userId}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SegmentsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = OneSignalGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "Test",
  "filters": [
    {
      "field": "session_count",
      "relation": ">",
      "value": "1"
    },
    {
      "operator": "AND"
    },
    {
      "field": "tag",
      "relation": "!=",
      "key": "tag_key",
      "value": "1"
    },
    {
      "operator": "OR"
    },
    {
      "field": "last_session",
      "relation": "<",
      "hours_ago": "30"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Segments',
      apiUrl: '${baseUrl}/apps/8b84349d-6ad5-4bc7-8be0-081f6b3fb323/segments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ConfirmarPartidoCall {
  Future<ApiCallResponse> call({
    int? partidoId,
    List<String>? uidsList,
  }) async {
    final baseUrl = OneSignalGroup.getBaseUrl();
    final uids = _serializeList(uidsList);

    final ffApiRequestBody = '''
{
  "app_id": "8b84349d-6ad5-4bc7-8be0-081f6b3fb323",
  "include_external_user_ids": ${uids},
  "url": "clubpadelpro://clubpadelpro.com/partidoPage?partidoId=${partidoId}",
  "contents": {
    "en": "Paga tu parte para confirmar!"
  },
  "headings": {
    "en": "Partido Confirmado"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConfirmarPartido',
      apiUrl: '${baseUrl}/api/v1/notifications',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OneSignal Group Code

class EtpayCall {
  static Future<ApiCallResponse> call({
    String? merchantOrderId = '',
    double? orderAmount,
    String? customerEmail = '',
    String? merchantCode = '',
    String? merchantApiToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "merchant_code": "${merchantCode}",
  "merchant_api_token": "${merchantApiToken}",
  "merchant_order_id": "${merchantOrderId}",
  "order_amount": ${orderAmount},
  "customer_email": "${customerEmail}",
  "metadata": [
    {
      "name": "Title",
      "value": "subtitle",
      "show": false
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ETPAY',
      apiUrl: 'https://api-sandbox.etpay.com/session/initialize',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? apiToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  static String? apiSignature(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.signature_token''',
      ));
}

class OneSignalCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "app_id": "8b84349d-6ad5-4bc7-8be0-081f6b3fb323",
  "included_segments": [
    "Testers"
  ],
  "url": "clubpadelpro://clubpadelpro.com/ligaPartido?partidoId=1&anotarResultados=true",
  "contents": {
    "en": "Tienes un nuevo partido!"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'OneSignal',
      apiUrl: 'https://onesignal.com/api/v1/notifications',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ZWZhNmEzNWQtNzEyNC00ODkxLTgzOTYtNmIxMzA0ZmFkNGE4',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
