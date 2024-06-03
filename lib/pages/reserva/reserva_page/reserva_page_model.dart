import '/flutter_flow/flutter_flow_util.dart';
import 'reserva_page_widget.dart' show ReservaPageWidget;
import 'package:flutter/material.dart';

class ReservaPageModel extends FlutterFlowModel<ReservaPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
