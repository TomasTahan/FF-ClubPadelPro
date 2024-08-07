import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'americano_page_widget.dart' show AmericanoPageWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AmericanoPageModel extends FlutterFlowModel<AmericanoPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool isInscrito = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in AmericanoPage widget.
  List<AmericanosRow>? infoSupa;
  // Stores action output result for [Backend Call - Query Rows] action in AmericanoPage widget.
  List<AmericanoParejasRow>? parejasSupa;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
