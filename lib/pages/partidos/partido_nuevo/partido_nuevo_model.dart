import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/componentes/partidos/confirmar_partido/confirmar_partido_widget.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'partido_nuevo_widget.dart' show PartidoNuevoWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PartidoNuevoModel extends FlutterFlowModel<PartidoNuevoWidget> {
  ///  Local state fields for this page.

  bool? isCompe;

  String? diaSeleccionado;

  String? horaSeleccionada;

  bool loading = false;

  bool is1 = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in PartidoNuevo widget.
  ApiCallResponse? apiResultbvf;
  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in Container widget.
  ApiCallResponse? apiResult3ca;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
