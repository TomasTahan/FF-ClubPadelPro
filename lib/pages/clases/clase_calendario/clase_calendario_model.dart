import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/componentes/clases/eliminar_clase/eliminar_clase_widget.dart';
import '/componentes/clases/nueva_clase/nueva_clase_widget.dart';
import '/componentes/clases/sin_clases/sin_clases_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'clase_calendario_widget.dart' show ClaseCalendarioWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ClaseCalendarioModel extends FlutterFlowModel<ClaseCalendarioWidget> {
  ///  Local state fields for this page.

  String? fechaSeleccionada;

  bool isLoading = false;

  bool is1 = true;

  DateTime? date;

  ///  State fields for stateful widgets in this page.

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
  void dispose() {}
}
