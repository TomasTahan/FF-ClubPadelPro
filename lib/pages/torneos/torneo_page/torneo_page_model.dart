import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'torneo_page_widget.dart' show TorneoPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TorneoPageModel extends FlutterFlowModel<TorneoPageWidget> {
  ///  Local state fields for this page.

  bool? isLoading;

  bool isInscrito = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in TorneoPage widget.
  List<TorneosRow>? supaTorneo;
  // Stores action output result for [Backend Call - Query Rows] action in TorneoPage widget.
  List<TorneoCategoriasRow>? supaCategorias;
  // Stores action output result for [Backend Call - Query Rows] action in TorneoPage widget.
  List<TorneoParejasRow>? supaParejas;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
