import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'liga_asignar_fecha_widget.dart' show LigaAsignarFechaWidget;
import 'package:flutter/material.dart';

class LigaAsignarFechaModel extends FlutterFlowModel<LigaAsignarFechaWidget> {
  ///  Local state fields for this page.

  String? fecha;

  String? hora;

  bool? isLoading;

  bool is1 = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in LigaAsignarFecha widget.
  ApiCallResponse? apiResultvum;
  // Stores action output result for [Backend Call - API (funcCanchasDispo)] action in Container widget.
  ApiCallResponse? apiResult3ca;
  // Stores action output result for [Backend Call - Update Row(s)] action in Button widget.
  List<LigaPartidosRow>? insertPArtido;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
