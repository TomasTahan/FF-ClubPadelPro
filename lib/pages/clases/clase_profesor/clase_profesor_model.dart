import '/flutter_flow/flutter_flow_util.dart';
import 'clase_profesor_widget.dart' show ClaseProfesorWidget;
import 'package:flutter/material.dart';

class ClaseProfesorModel extends FlutterFlowModel<ClaseProfesorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
