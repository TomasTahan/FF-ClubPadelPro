import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'register_page1_widget.dart' show RegisterPage1Widget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage1Model extends FlutterFlowModel<RegisterPage1Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El nombre es requerido';
    }

    if (val.length < 2) {
      return 'Minimo 2 caracteres';
    }
    if (val.length > 12) {
      return 'Máximo 12 caracteres';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El apellido es requerido';
    }

    if (val.length < 2) {
      return 'Minimo 2 caracteres';
    }
    if (val.length > 12) {
      return 'Máximo 12 caracteres';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'El correo es requerido';
    }

    if (val.length < 2) {
      return 'Minimo 2 caracteres';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Correo invalido';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? passwordTextController;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  String? _passwordTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (val.length < 6) {
      return 'Minimo 6 caracteres';
    }
    if (val.length > 15) {
      return 'Máximo 15 caracteres';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? confirmPasswordTextController;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  String? _confirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'La contraseña es requerida';
    }

    if (val.length < 6) {
      return 'Minimo 6 caracteres';
    }
    if (val.length > 15) {
      return 'Máximo 15 caracteres';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  DateTime? datePicked;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<ClubesRow>? clubInfo;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
    passwordVisibility1 = false;
    passwordTextControllerValidator = _passwordTextControllerValidator;
    passwordVisibility2 = false;
    confirmPasswordTextControllerValidator =
        _confirmPasswordTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode4?.dispose();
    passwordTextController?.dispose();

    textFieldFocusNode5?.dispose();
    confirmPasswordTextController?.dispose();

    textFieldFocusNode6?.dispose();
    textController4?.dispose();
  }
}
