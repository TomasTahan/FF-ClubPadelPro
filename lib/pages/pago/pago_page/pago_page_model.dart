import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'pago_page_widget.dart' show PagoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PagoPageModel extends FlutterFlowModel<PagoPageWidget> {
  ///  Local state fields for this page.

  bool? isSuccess;

  bool buttonActive = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TransferenciasRow>? pago;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TransferenciasRow>? pago2;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<TransferenciasRow>? pago3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
