import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/liga/pagar_liga/pagar_liga_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'liga_page_widget.dart' show LigaPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LigaPageModel extends FlutterFlowModel<LigaPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String? estado;

  bool isInscrito = false;

  List<int> inscritoEn = [];
  void addToInscritoEn(int item) => inscritoEn.add(item);
  void removeFromInscritoEn(int item) => inscritoEn.remove(item);
  void removeAtIndexFromInscritoEn(int index) => inscritoEn.removeAt(index);
  void insertAtIndexInInscritoEn(int index, int item) =>
      inscritoEn.insert(index, item);
  void updateInscritoEnAtIndex(int index, Function(int) updateFn) =>
      inscritoEn[index] = updateFn(inscritoEn[index]);

  bool anotarResultados = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaRow>? liga;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaCategoriaRow>? categoriasSupa;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaParejasRow>? ligaParejas;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaCategoriaRow>? categoriasSupa2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
