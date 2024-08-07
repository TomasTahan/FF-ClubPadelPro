import '/backend/supabase/supabase.dart';
import '/componentes/partidos/compartir_partido/compartir_partido_widget.dart';
import '/componentes/partidos/confirmar_inscripcion/confirmar_inscripcion_widget.dart';
import '/componentes/partidos/salir_partido/salir_partido_widget.dart';
import '/componentes/shop/payment_partido/payment_partido_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'partido_page_widget.dart' show PartidoPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PartidoPageModel extends FlutterFlowModel<PartidoPageWidget> {
  ///  Local state fields for this page.

  bool? loading;

  bool? isOwner;

  bool isIn = false;

  bool isArrendando = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in PartidoPage widget.
  List<VistaPartidosRow>? partidoInfo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
