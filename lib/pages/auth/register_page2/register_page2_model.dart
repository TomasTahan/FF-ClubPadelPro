import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'register_page2_widget.dart' show RegisterPage2Widget;
import 'package:flutter/material.dart';

class RegisterPage2Model extends FlutterFlowModel<RegisterPage2Widget> {
  ///  Local state fields for this page.

  bool? isMacu;

  int? cat;

  bool? isReves;

  bool isUpload = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<UsersRow>? supaGet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
