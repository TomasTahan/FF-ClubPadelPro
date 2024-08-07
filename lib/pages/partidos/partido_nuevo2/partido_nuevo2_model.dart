import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/componentes/loading/horas_partido_nuevo/horas_partido_nuevo_widget.dart';
import '/componentes/partidos/confirmar_partido/confirmar_partido_widget.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'partido_nuevo2_widget.dart' show PartidoNuevo2Widget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PartidoNuevo2Model extends FlutterFlowModel<PartidoNuevo2Widget> {
  ///  Local state fields for this page.

  bool? isCompe;

  String? diaSeleccionado;

  String? horaSeleccionada;

  bool isTechada = false;

  bool? isPublico;

  bool isLoading = false;

  int state = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (funcCanchasDispGenerico)] action in PartidoNuevo2 widget.
  ApiCallResponse? apiGrid1;
  // Stores action output result for [Backend Call - API (funcCanchasDispGenerico)] action in Container widget.
  ApiCallResponse? apiGrid2;
  // Model for horasPartidoNuevo component.
  late HorasPartidoNuevoModel horasPartidoNuevoModel;
  // Stores action output result for [Backend Call - API (funcCanchasDispGenerico)] action in Container widget.
  ApiCallResponse? apiGrid3;
  // Stores action output result for [Backend Call - API (funcCanchasDispGenerico)] action in Container widget.
  ApiCallResponse? apiGrid4;

  @override
  void initState(BuildContext context) {
    horasPartidoNuevoModel =
        createModel(context, () => HorasPartidoNuevoModel());
  }

  @override
  void dispose() {
    horasPartidoNuevoModel.dispose();
  }
}
