import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clase_calendario_widget.dart' show ClaseCalendarioWidget;
import 'package:flutter/material.dart';

class ClaseCalendarioModel extends FlutterFlowModel<ClaseCalendarioWidget> {
  ///  Local state fields for this page.

  String? fechaSeleccionada;

  bool isLoading = false;

  bool is1 = true;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getClases)] action in ClaseCalendario widget.
  ApiCallResponse? apiResultjsp;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // Stores action output result for [Backend Call - API (getClases)] action in Calendar widget.
  ApiCallResponse? apiResult2;

  @override
  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
