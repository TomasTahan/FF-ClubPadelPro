import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'payment_creditos_widget.dart' show PaymentCreditosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PaymentCreditosModel extends FlutterFlowModel<PaymentCreditosWidget> {
  ///  Local state fields for this component.

  String? metodoPago;

  String? customerId;

  String? last4;

  int? csv;

  int estado = 1;

  int? cardId;

  bool isValid = true;

  double? uuid;

  String? merchId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (TokenCardId)] action in Button widget.
  ApiCallResponse? apiResult4c1;
  // Stores action output result for [Backend Call - API (Payment)] action in Button widget.
  ApiCallResponse? apiResultuez;
  // Stores action output result for [Backend Call - API (Payment)] action in Button widget.
  ApiCallResponse? apiResult2;
  // Stores action output result for [Backend Call - API (Payment)] action in Button widget.
  ApiCallResponse? apiResult3;
  // Stores action output result for [Backend Call - API (ETPAY)] action in Button widget.
  ApiCallResponse? etpay;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<CustomerCardRow>? supaCard;
  // Stores action output result for [Backend Call - API (TokenCardId)] action in Button widget.
  ApiCallResponse? apiCard;
  // Stores action output result for [Backend Call - API (Payment)] action in Button widget.
  ApiCallResponse? apiPayment;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
