import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'torneo_page_widget.dart' show TorneoPageWidget;
import 'package:flutter/material.dart';

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
