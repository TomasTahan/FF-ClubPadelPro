import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'confirmar_inscripcion_widget.dart' show ConfirmarInscripcionWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ConfirmarInscripcionModel
    extends FlutterFlowModel<ConfirmarInscripcionWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (funcReservarCancha)] action in Button widget.
  ApiCallResponse? apiResult5zr;
  // Stores action output result for [Backend Call - API (ConfirmarPartido)] action in Button widget.
  ApiCallResponse? apiResultk5k;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
