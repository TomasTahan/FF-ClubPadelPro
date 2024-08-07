import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'pago_page_model.dart';
export 'pago_page_model.dart';

class PagoPageWidget extends StatefulWidget {
  const PagoPageWidget({
    super.key,
    required this.url,
    required this.merchId,
    this.partidoId,
    this.position,
    this.precio,
    this.productoId,
  });

  final String? url;
  final String? merchId;
  final int? partidoId;
  final String? position;
  final int? precio;
  final int? productoId;

  @override
  State<PagoPageWidget> createState() => _PagoPageWidgetState();
}

class _PagoPageWidgetState extends State<PagoPageWidget> {
  late PagoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 100000));
      _model.buttonActive = true;
      setState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Transferencia',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (_model.isSuccess == null)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowWebView(
                        content: widget!.url!,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.65,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                    if (!(isWeb
                        ? MediaQuery.viewInsetsOf(context).bottom > 0
                        : _isKeyboardVisible))
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '*Cuando se confirme el pago, presione continuar*',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.isSuccess = false;
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 1500));

                                          context.pushNamed('HomePage');
                                        },
                                        text: 'Cancelar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: !_model.buttonActive
                                            ? null
                                            : () async {
                                                _model.pago =
                                                    await TransferenciasTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'merchId',
                                                    widget!.merchId,
                                                  ),
                                                );
                                                if (_model
                                                        .pago?.first?.status ==
                                                    'Success') {
                                                  _model.isSuccess = true;
                                                  setState(() {});
                                                  if (widget!.partidoId !=
                                                      null) {
                                                    await PagosTable().insert({
                                                      'userId': currentUserUid,
                                                      'precioFinal': widget!
                                                          .precio
                                                          ?.toDouble(),
                                                      'status': 'Success',
                                                      'Tipo': 'Transferencia',
                                                      'productoId':
                                                          widget!.productoId,
                                                    });
                                                    await PartidosTable()
                                                        .update(
                                                      data: {
                                                        'pagos':
                                                            widget!.position,
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'partidoId',
                                                        widget!.partidoId,
                                                      ),
                                                    );
                                                  }
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 2000));

                                                  context.pushNamed('HomePage');
                                                } else {
                                                  if (_model.pago?.first
                                                          ?.status ==
                                                      'Pendiente') {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                1000));
                                                    _model.pago2 =
                                                        await TransferenciasTable()
                                                            .queryRows(
                                                      queryFn: (q) => q.eq(
                                                        'merchId',
                                                        widget!.merchId,
                                                      ),
                                                    );
                                                    if (_model.pago2?.first
                                                            ?.status ==
                                                        'Success') {
                                                      _model.isSuccess = true;
                                                      setState(() {});
                                                      if (widget!.partidoId !=
                                                          null) {
                                                        await PagosTable()
                                                            .insert({
                                                          'userId':
                                                              currentUserUid,
                                                          'precioFinal': widget!
                                                              .precio
                                                              ?.toDouble(),
                                                          'status': 'Success',
                                                          'Tipo':
                                                              'Transferencia',
                                                          'productoId': widget!
                                                              .productoId,
                                                        });
                                                        await PartidosTable()
                                                            .update(
                                                          data: {
                                                            'pagos': widget!
                                                                .position,
                                                          },
                                                          matchingRows:
                                                              (rows) => rows.eq(
                                                            'partidoId',
                                                            widget!.partidoId,
                                                          ),
                                                        );
                                                      }
                                                      await Future.delayed(
                                                          const Duration(
                                                              milliseconds:
                                                                  2000));

                                                      context.pushNamed(
                                                          'HomePage');
                                                    } else {
                                                      if (_model.pago?.first
                                                              ?.status ==
                                                          'Pending') {
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    1000));
                                                        _model.pago3 =
                                                            await TransferenciasTable()
                                                                .queryRows(
                                                          queryFn: (q) => q.eq(
                                                            'merchId',
                                                            widget!.merchId,
                                                          ),
                                                        );
                                                        if (_model.pago3?.first
                                                                ?.status ==
                                                            'Success') {
                                                          _model.isSuccess =
                                                              true;
                                                          setState(() {});
                                                          if (widget!
                                                                  .partidoId !=
                                                              null) {
                                                            await PagosTable()
                                                                .insert({
                                                              'userId':
                                                                  currentUserUid,
                                                              'precioFinal':
                                                                  widget!.precio
                                                                      ?.toDouble(),
                                                              'status':
                                                                  'Success',
                                                              'Tipo':
                                                                  'Transferencia',
                                                              'productoId':
                                                                  widget!
                                                                      .productoId,
                                                            });
                                                            await PartidosTable()
                                                                .update(
                                                              data: {
                                                                'pagos': widget!
                                                                    .position,
                                                              },
                                                              matchingRows:
                                                                  (rows) =>
                                                                      rows.eq(
                                                                'partidoId',
                                                                widget!
                                                                    .partidoId,
                                                              ),
                                                            );
                                                          }
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000));

                                                          context.pushNamed(
                                                              'HomePage');
                                                        } else {
                                                          _model.isSuccess =
                                                              false;
                                                          setState(() {});
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      2000));

                                                          context.pushNamed(
                                                              'HomePage');
                                                        }
                                                      } else {
                                                        _model.isSuccess =
                                                            false;
                                                        setState(() {});
                                                        await Future.delayed(
                                                            const Duration(
                                                                milliseconds:
                                                                    2000));

                                                        context.pushNamed(
                                                            'HomePage');
                                                      }
                                                    }
                                                  } else {
                                                    _model.isSuccess = false;
                                                    setState(() {});
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                2000));

                                                    context
                                                        .pushNamed('HomePage');
                                                  }
                                                }

                                                setState(() {});
                                              },
                                        text: 'Continuar',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FFAppState().Club.colorTrue,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 3.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            if ((_model.isSuccess != null) && _model.isSuccess!)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Lottie.network(
                            'https://lottie.host/cf5b8e38-894d-4a4d-b03c-5ffc057ddb8b/JPRO7K8nx4.json',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Pago  Realizado',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(height: 44.0)),
                ),
              ),
            if ((_model.isSuccess != null) && !_model.isSuccess!)
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Lottie.network(
                            'https://lottie.host/8c8271bd-fe49-4042-9818-45884e4af87d/LXHMwIhBcn.json',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                            repeat: false,
                            animate: true,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Pago  Rechazado',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ].divide(SizedBox(height: 44.0)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
