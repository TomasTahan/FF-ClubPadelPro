import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'liga_clasificacion_widget.dart' show LigaClasificacionWidget;
import 'package:flutter/material.dart';

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

  final unfocusNode = FocusNode();
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
  void dispose() {
    unfocusNode.dispose();
  }
}
