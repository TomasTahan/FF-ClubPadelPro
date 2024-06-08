import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'transferir_creditos_widget.dart' show TransferirCreditosWidget;
import 'package:flutter/material.dart';

class TransferirCreditosModel
    extends FlutterFlowModel<TransferirCreditosWidget> {
  ///  Local state fields for this component.

  bool isError = false;

  bool isLoading = false;

  String? userId;

  int state = 1;

  String? userName;

  int montoCreditos = 0;

  bool isBigger = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? supaUser;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (searchUsers)] action in TextField widget.
  ApiCallResponse? apiResultl5y;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
