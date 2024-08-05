import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confirmar_inscripcion_model.dart';
export 'confirmar_inscripcion_model.dart';

class ConfirmarInscripcionWidget extends StatefulWidget {
  const ConfirmarInscripcionWidget({
    super.key,
    required this.partidoId,
    required this.posisicion,
    this.aa,
    this.bb,
    this.cc,
    this.dd,
    this.cliente,
    this.inicio,
    this.fecha,
    required this.isTechada,
  });

  final int? partidoId;
  final String? posisicion;
  final String? aa;
  final String? bb;
  final String? cc;
  final String? dd;
  final String? cliente;
  final String? inicio;
  final String? fecha;
  final bool? isTechada;

  @override
  State<ConfirmarInscripcionWidget> createState() =>
      _ConfirmarInscripcionWidgetState();
}

class _ConfirmarInscripcionWidgetState
    extends State<ConfirmarInscripcionWidget> {
  late ConfirmarInscripcionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmarInscripcionModel());

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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: RichText(
                    textScaler: MediaQuery.of(context).textScaler,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '¿Deseas unirte al partido?',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Open Sans',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                        )
                      ],
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Open Sans',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Text(
                          'Te podrás retirar luego si lo deseas.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        text: 'Cancelar',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).alternate,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: 'Roboto',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                          elevation: 2.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (widget!.posisicion == 'D') {
                            await PartidosTable().update(
                              data: {
                                'playerIdD': FFAppState().UserInfo.userId,
                              },
                              matchingRows: (rows) => rows.eq(
                                'partidoId',
                                widget!.partidoId,
                              ),
                            );
                          } else {
                            if (widget!.posisicion == 'C') {
                              await PartidosTable().update(
                                data: {
                                  'playerIdC': FFAppState().UserInfo.userId,
                                },
                                matchingRows: (rows) => rows.eq(
                                  'partidoId',
                                  widget!.partidoId,
                                ),
                              );
                            } else {
                              if (widget!.posisicion == 'B') {
                                await PartidosTable().update(
                                  data: {
                                    'playerIdB': FFAppState().UserInfo.userId,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'partidoId',
                                    widget!.partidoId,
                                  ),
                                );
                              } else {
                                await PartidosTable().update(
                                  data: {
                                    'playerIdA': FFAppState().UserInfo.userId,
                                  },
                                  matchingRows: (rows) => rows.eq(
                                    'partidoId',
                                    widget!.partidoId,
                                  ),
                                );
                              }
                            }
                          }

                          if (((widget!.aa != null && widget!.aa != '') &&
                                  (widget!.bb != null && widget!.bb != '') &&
                                  (widget!.cc != null && widget!.cc != '')) ||
                              ((widget!.dd != null && widget!.dd != '') &&
                                  (widget!.bb != null && widget!.bb != '') &&
                                  (widget!.cc != null && widget!.cc != '')) ||
                              ((widget!.aa != null && widget!.aa != '') &&
                                  (widget!.dd != null && widget!.dd != '') &&
                                  (widget!.cc != null && widget!.cc != '')) ||
                              ((widget!.aa != null && widget!.aa != '') &&
                                  (widget!.bb != null && widget!.bb != '') &&
                                  (widget!.dd != null && widget!.dd != ''))) {
                            _model.apiResult5zr = await SupabaseDashboardGroup
                                .funcReservarCanchaCall
                                .call(
                              cliente: widget!.cliente,
                              clubId: FFAppState().Club.clubId,
                              fecha: widget!.fecha,
                              inicio: widget!.inicio,
                              fin: functions.plusHour(widget!.inicio!),
                              canchaTechada: widget!.isTechada,
                              partidoId: widget!.partidoId,
                            );

                            if ((_model.apiResult5zr?.succeeded ?? true)) {
                              if (SupabaseDashboardGroup.funcReservarCanchaCall
                                      .status(
                                    (_model.apiResult5zr?.jsonBody ?? ''),
                                  ) ==
                                  'success') {
                                _model.apiResultk5k = await OneSignalGroup
                                    .confirmarPartidoCall
                                    .call(
                                  partidoId: widget!.partidoId,
                                  uidsList: functions.notificationMatch(
                                      widget!.aa == null || widget!.aa == ''
                                          ? currentUserUid
                                          : widget!.aa!,
                                      widget!.bb == null || widget!.bb == ''
                                          ? currentUserUid
                                          : widget!.bb!,
                                      widget!.cc == null || widget!.cc == ''
                                          ? currentUserUid
                                          : widget!.cc!,
                                      widget!.dd == null || widget!.dd == ''
                                          ? currentUserUid
                                          : widget!.dd!,
                                      currentUserUid),
                                );

                                if ((_model.apiResultk5k?.succeeded ?? true)) {
                                  await Future.delayed(
                                      const Duration(milliseconds: 10));
                                }
                              }
                            }
                          }

                          context.pushNamed(
                            'PartidoPage',
                            queryParameters: {
                              'partidoId': serializeParam(
                                widget!.partidoId,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.scale,
                                alignment: Alignment.bottomCenter,
                              ),
                            },
                          );

                          setState(() {});
                        },
                        text: 'Unir',
                        options: FFButtonOptions(
                          width: 130.0,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FFAppState().Club.colorTrue,
                          textStyle:
                              FlutterFlowTheme.of(context).labelLarge.override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 2.0,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 24.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
