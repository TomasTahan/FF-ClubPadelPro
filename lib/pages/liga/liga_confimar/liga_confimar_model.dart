import '/flutter_flow/flutter_flow_util.dart';
import 'liga_confimar_widget.dart' show LigaConfimarWidget;
import 'package:flutter/material.dart';

class LigaConfimarModel extends FlutterFlowModel<LigaConfimarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
