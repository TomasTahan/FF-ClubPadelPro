import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partido_nuevo_widget.dart' show PartidoNuevoWidget;
import 'package:flutter/material.dart';

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
