import '/flutter_flow/flutter_flow_util.dart';
import 'progreso_widget.dart' show ProgresoWidget;
import 'package:flutter/material.dart';

class ProgresoModel extends FlutterFlowModel<ProgresoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
