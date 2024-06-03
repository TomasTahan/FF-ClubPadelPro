import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'pago_page_model.dart';
export 'pago_page_model.dart';

class PagoPageWidget extends StatefulWidget {
  const PagoPageWidget({
    super.key,
    required this.url,
    required this.merchId,
  });

  final String? url;
  final String? merchId;

  @override
  State<PagoPageWidget> createState() => _PagoPageWidgetState();
}

class _PagoPageWidgetState extends State<PagoPageWidget> {
  late PagoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
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
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Pago',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ],
          ),
          actions: const [],
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
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowWebView(
                        content: widget.url!,
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.65,
                        verticalScroll: false,
                        horizontalScroll: false,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: !_model.buttonActive
                                    ? null
                                    : () async {
                                        await Future.delayed(
                                            const Duration(milliseconds: 500));
                                        _model.pago =
                                            await PagosTable().queryRows(
                                          queryFn: (q) => q.eq(
                                            'merchId',
                                            widget.merchId,
                                          ),
                                        );
                                        if (_model.pago?.first.status ==
                                            'Success') {
                                          _model.isSuccess = true;
                                          setState(() {});
                                          await Future.delayed(const Duration(
                                              milliseconds: 1500));

                                          context.pushNamed('HomePage');
                                        } else {
                                          if (_model.pago?.first.status ==
                                              'Pending') {
                                            await Future.delayed(const Duration(
                                                milliseconds: 1000));
                                            _model.pago2 =
                                                await PagosTable().queryRows(
                                              queryFn: (q) => q.eq(
                                                'merchId',
                                                widget.merchId,
                                              ),
                                            );
                                            if (_model.pago2?.first.status ==
                                                'Success') {
                                              _model.isSuccess = true;
                                              setState(() {});
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1500));

                                              context.pushNamed('HomePage');
                                            } else {
                                              if (_model.pago?.first.status ==
                                                  'Pending') {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000));
                                                _model.pago3 =
                                                    await PagosTable()
                                                        .queryRows(
                                                  queryFn: (q) => q.eq(
                                                    'merchId',
                                                    widget.merchId,
                                                  ),
                                                );
                                                if (_model
                                                        .pago3?.first.status ==
                                                    'Success') {
                                                  _model.isSuccess = true;
                                                  setState(() {});
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1500));

                                                  context.pushNamed('HomePage');
                                                } else {
                                                  _model.isSuccess = false;
                                                  setState(() {});
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 1500));

                                                  context.pushNamed('HomePage');
                                                }
                                              } else {
                                                _model.isSuccess = false;
                                                setState(() {});
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1500));

                                                context.pushNamed('HomePage');
                                              }
                                            }
                                          } else {
                                            _model.isSuccess = false;
                                            setState(() {});
                                            await Future.delayed(const Duration(
                                                milliseconds: 1500));

                                            context.pushNamed('HomePage');
                                          }
                                        }

                                        setState(() {});
                                      },
                                text: 'Continuar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
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
                  ].divide(const SizedBox(height: 44.0)),
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
                  ].divide(const SizedBox(height: 44.0)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
