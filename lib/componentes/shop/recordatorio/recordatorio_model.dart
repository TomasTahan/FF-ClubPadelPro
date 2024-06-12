import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/shop/payment_creditos/payment_creditos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'recordatorio_widget.dart' show RecordatorioWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RecordatorioModel extends FlutterFlowModel<RecordatorioWidget> {
  ///  Local state fields for this component.

  String? merchantId;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (ETPAY)] action in ETPAY widget.
  ApiCallResponse? apiResultcng;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
