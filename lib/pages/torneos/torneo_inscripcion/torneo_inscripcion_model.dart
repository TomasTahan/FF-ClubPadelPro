import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'torneo_inscripcion_widget.dart' show TorneoInscripcionWidget;
import 'package:flutter/material.dart';

class TorneoInscripcionModel extends FlutterFlowModel<TorneoInscripcionWidget> {
  ///  Local state fields for this page.

  bool? isLoading = false;

  String? partnerId;

  String? partnerName;

  int? categoriaId;

  String? categoria;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchUsers)] action in TextField widget.
  ApiCallResponse? apiResultl5y;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
