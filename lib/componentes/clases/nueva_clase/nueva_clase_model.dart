import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'nueva_clase_widget.dart' show NuevaClaseWidget;
import 'package:flutter/material.dart';

class NuevaClaseModel extends FlutterFlowModel<NuevaClaseWidget> {
  ///  Local state fields for this component.

  String? alumnoId;

  bool isLoading = false;

  bool erorr = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (searchUsers)] action in TextField widget.
  ApiCallResponse? apiResultl5y;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
