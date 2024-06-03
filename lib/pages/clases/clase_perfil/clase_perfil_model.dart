import '/flutter_flow/flutter_flow_util.dart';
import 'clase_perfil_widget.dart' show ClasePerfilWidget;
import 'package:flutter/material.dart';

class ClasePerfilModel extends FlutterFlowModel<ClasePerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
