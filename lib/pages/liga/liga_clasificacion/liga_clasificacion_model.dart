import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'liga_clasificacion_widget.dart' show LigaClasificacionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LigaClasificacionModel extends FlutterFlowModel<LigaClasificacionWidget> {
  ///  Local state fields for this page.

  bool isGrupo1 = true;

  bool isLoading = true;

  List<VistaLigaClasificacionRow> ligaClasificacion = [];
  void addToLigaClasificacion(VistaLigaClasificacionRow item) =>
      ligaClasificacion.add(item);
  void removeFromLigaClasificacion(VistaLigaClasificacionRow item) =>
      ligaClasificacion.remove(item);
  void removeAtIndexFromLigaClasificacion(int index) =>
      ligaClasificacion.removeAt(index);
  void insertAtIndexInLigaClasificacion(
          int index, VistaLigaClasificacionRow item) =>
      ligaClasificacion.insert(index, item);
  void updateLigaClasificacionAtIndex(
          int index, Function(VistaLigaClasificacionRow) updateFn) =>
      ligaClasificacion[index] = updateFn(ligaClasificacion[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in LigaClasificacion widget.
  List<VistaLigaClasificacionRow>? supaJugadores;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<VistaLigaClasificacionRow>? supaJugadores2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
