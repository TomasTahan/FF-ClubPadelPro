import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'compartir_partido_model.dart';
export 'compartir_partido_model.dart';

class CompartirPartidoWidget extends StatefulWidget {
  const CompartirPartidoWidget({
    super.key,
    required this.fecha,
    required this.hora,
    required this.categoria,
    this.aa,
    this.bb,
    this.cc,
    this.dd,
    required this.isTechada,
    required this.partidoId,
  });

  final String? fecha;
  final String? hora;
  final String? categoria;
  final String? aa;
  final String? bb;
  final String? cc;
  final String? dd;
  final bool? isTechada;
  final int? partidoId;

  @override
  State<CompartirPartidoWidget> createState() => _CompartirPartidoWidgetState();
}

class _CompartirPartidoWidgetState extends State<CompartirPartidoWidget> {
  late CompartirPartidoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompartirPartidoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              'Compartir Partido',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: BarcodeWidget(
                  data:
                      'clubpadelpro://clubpadelpro.com/partidoPage?partidoId=${widget!.partidoId?.toString()}',
                  barcode: Barcode.qrCode(),
                  width: 90.0,
                  height: 90.0,
                  color: FlutterFlowTheme.of(context).primaryText,
                  backgroundColor: Colors.transparent,
                  errorBuilder: (_context, _error) => SizedBox(
                    width: 90.0,
                    height: 90.0,
                  ),
                  drawText: false,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Text(
              '* Escanee el QR desde otro dispositivo *',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              'Mensaje predefinido',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: 150.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                        child: Text(
                          functions.alertaMatch(
                              widget!.fecha!,
                              widget!.hora!,
                              widget!.categoria!,
                              widget!.aa,
                              widget!.bb,
                              widget!.cc,
                              widget!.dd,
                              'https://www.clubpadelpro.cl/partidos?id=${widget!.partidoId?.toString()}',
                              widget!.isTechada!),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if (!_model.isCopy)
                  FFButtonWidget(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(
                          text: functions.alertaMatch(
                              widget!.fecha!,
                              widget!.hora!,
                              widget!.categoria!,
                              widget!.aa,
                              widget!.bb,
                              widget!.cc,
                              widget!.dd,
                              'https://www.clubpadelpro.cl/partidos?id=${widget!.partidoId?.toString()}',
                              false)));
                      _model.isCopy = true;
                      setState(() {});
                    },
                    text: 'Copiar',
                    icon: FaIcon(
                      FontAwesomeIcons.solidCopy,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).alternate,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                if (_model.isCopy)
                  FFButtonWidget(
                    onPressed: () async {
                      await Clipboard.setData(ClipboardData(
                          text: functions.alertaMatch(
                              widget!.fecha!,
                              widget!.hora!,
                              widget!.categoria!,
                              widget!.aa,
                              widget!.bb,
                              widget!.cc,
                              widget!.dd,
                              'clubpadelpro://clubpadelpro.com${GoRouterState.of(context).uri.toString()}',
                              widget!.isTechada!)));
                      _model.isCopy = true;
                      setState(() {});
                    },
                    text: 'Copiado',
                    icon: FaIcon(
                      FontAwesomeIcons.check,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF22D477),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                Builder(
                  builder: (context) => FFButtonWidget(
                    onPressed: () async {
                      await Share.share(
                        functions.alertaMatch(
                            widget!.fecha!,
                            widget!.hora!,
                            widget!.categoria!,
                            widget!.aa,
                            widget!.bb,
                            widget!.cc,
                            widget!.dd,
                            'https://www.clubpadelpro.cl/partidos?id=${widget!.partidoId?.toString()}',
                            widget!.isTechada!),
                        sharePositionOrigin: getWidgetBoundingBox(context),
                      );
                    },
                    text: 'Compartir',
                    icon: FaIcon(
                      FontAwesomeIcons.shareSquare,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 150.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FFAppState().Club.colorTrue,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Roboto',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
