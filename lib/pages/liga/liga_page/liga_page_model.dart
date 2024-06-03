import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'liga_page_widget.dart' show LigaPageWidget;
import 'package:flutter/material.dart';

class LigaPageModel extends FlutterFlowModel<LigaPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  String? estado;

  bool isInscrito = false;

  List<int> inscritoEn = [];
  void addToInscritoEn(int item) => inscritoEn.add(item);
  void removeFromInscritoEn(int item) => inscritoEn.remove(item);
  void removeAtIndexFromInscritoEn(int index) => inscritoEn.removeAt(index);
  void insertAtIndexInInscritoEn(int index, int item) =>
      inscritoEn.insert(index, item);
  void updateInscritoEnAtIndex(int index, Function(int) updateFn) =>
      inscritoEn[index] = updateFn(inscritoEn[index]);

  bool anotarResultados = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaRow>? liga;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaCategoriaRow>? categoriasSupa;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaParejasRow>? ligaParejas;
  // Stores action output result for [Backend Call - Query Rows] action in LigaPage widget.
  List<LigaCategoriaRow>? categoriasSupa2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
