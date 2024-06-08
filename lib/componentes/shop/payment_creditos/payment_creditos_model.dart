import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'payment_creditos_widget.dart' show PaymentCreditosWidget;
import 'package:flutter/material.dart';

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
