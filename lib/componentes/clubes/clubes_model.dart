import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'clubes_widget.dart' show ClubesWidget;
import 'package:flutter/material.dart';

class ClubesModel extends FlutterFlowModel<ClubesWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  bool isVisible = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchClubes)] action in TextField widget.
  ApiCallResponse? apiResultl5y;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
