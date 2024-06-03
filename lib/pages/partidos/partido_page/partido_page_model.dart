import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'partido_page_widget.dart' show PartidoPageWidget;
import 'package:flutter/material.dart';

class PartidoPageModel extends FlutterFlowModel<PartidoPageWidget> {
  ///  Local state fields for this page.

  bool? loading;

  bool? isOwner;

  bool isIn = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in PartidoPage widget.
  List<VistaPartidosRow>? partidoInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
