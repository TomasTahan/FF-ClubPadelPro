import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'aadir_tarjeta_widget.dart' show AadirTarjetaWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AadirTarjetaModel extends FlutterFlowModel<AadirTarjetaWidget> {
  ///  Local state fields for this page.

  String? previousDate;

  String? cardNumbers;

  String? cardName;

  bool isValid = true;

  int cardType = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    if (val.length < 3) {
      return 'Minimo 3 caracterres';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El numero es requerido';
    }

    if (val.length < 19) {
      return 'Tarjeta incompleta';
    }
    if (val.length > 19) {
      return 'Tarjeta incompleta';
    }

    return null;
  }

  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  String? _dateTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La fecha es requerida';
    }

    if (val.length < 5) {
      return 'Fecha Incompleta';
    }
    if (val.length > 5) {
      return 'Fecha Incompleta';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  String? _textController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El CVV es requerido';
    }

    if (val.length < 3) {
      return 'CVV Incompleto';
    }
    if (val.length > 3) {
      return 'CVV Incompleto';
    }

    return null;
  }

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CustomersRow>? supaCustomer;
  // Stores action output result for [Backend Call - API (TokenCard)] action in Button widget.
  ApiCallResponse? apiToken;
  // Stores action output result for [Backend Call - API (GuardarTarjeta)] action in Button widget.
  ApiCallResponse? apiGuardarTarjeta;
  // Stores action output result for [Backend Call - API (TokenCard)] action in Button widget.
  ApiCallResponse? apiToken2;
  // Stores action output result for [Backend Call - API (CrearCustomer)] action in Button widget.
  ApiCallResponse? apiCrearCustomer;
  // Stores action output result for [Backend Call - API (GuardarTarjeta)] action in Button widget.
  ApiCallResponse? apiGuardarTarjeta2;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  CustomerCardRow? supaCrearCustomer;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    dateTextControllerValidator = _dateTextControllerValidator;
    textController4Validator = _textController4Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }
}
