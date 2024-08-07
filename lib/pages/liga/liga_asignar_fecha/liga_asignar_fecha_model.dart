import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'liga_asignar_fecha_widget.dart' show LigaAsignarFechaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LigaAsignarFechaModel extends FlutterFlowModel<LigaAsignarFechaWidget> {
  ///  Local state fields for this page.

  String? fecha;

  String? hora;

  bool? isLoading;

  bool is1 = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in LigaAsignarFecha widget.
  ApiCallResponse? apiResultvum;
  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in Container widget.
  ApiCallResponse? apiResult3ca;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<LigaPartidosRow>? insertPArtido;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
