import '/flutter_flow/flutter_flow_util.dart';
import 'liga_partidos_widget.dart' show LigaPartidosWidget;
import 'package:flutter/material.dart';

class LigaPartidosModel extends FlutterFlowModel<LigaPartidosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
