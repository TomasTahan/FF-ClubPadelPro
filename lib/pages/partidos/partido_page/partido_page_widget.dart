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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'partido_page_model.dart';
export 'partido_page_model.dart';

class PartidoPageWidget extends StatefulWidget {
  const PartidoPageWidget({
    super.key,
    required this.partidoId,
  });

  final int? partidoId;

  @override
  State<PartidoPageWidget> createState() => _PartidoPageWidgetState();
}

class _PartidoPageWidgetState extends State<PartidoPageWidget>
    with TickerProviderStateMixin {
  late PartidoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidoPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.loading = true;
      setState(() {});
      _model.partidoInfo = await VistaPartidosTable().queryRows(
        queryFn: (q) => q.eq(
          'partidoId',
          widget!.partidoId,
        ),
      );
      _model.loading = false;
      _model.isOwner =
          _model.partidoInfo?.first?.createdBy == FFAppState().UserInfo.userId;
      _model.isIn = functions.isIn(
          _model.partidoInfo?.first?.uidA,
          _model.partidoInfo?.first?.uidB,
          _model.partidoInfo?.first?.uidC,
          _model.partidoInfo?.first?.uidD,
          FFAppState().UserInfo.userId);
      setState(() {});
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation6': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation7': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation8': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation9': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
      'containerOnPageLoadAnimation10': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeIn,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.135,
            end: 1.0,
          ),
        ],
      ),
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
    context.watch<FFAppState>();

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
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10.0,
                buttonSize: 36.0,
                fillColor: FlutterFlowTheme.of(context).primaryBackground,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 18.0,
                ),
                onPressed: () async {
                  context.goNamed('PartidosPage');
                },
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Partido',
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
              Builder(
                builder: (context) => FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 10.0,
                  buttonSize: 36.0,
                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                  icon: Icon(
                    Icons.share,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 18.0,
                  ),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: GestureDetector(
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 0.9,
                                child: CompartirPartidoWidget(
                                  fecha: dateTimeFormat('dd/MM',
                                      _model.partidoInfo!.first.fecha!),
                                  hora: _model.partidoInfo!.first.horaInicio!,
                                  categoria: functions.rankingConvert(
                                      _model.partidoInfo!.first.rankingA!),
                                  aa: _model.partidoInfo?.first?.nombreA,
                                  bb: _model.partidoInfo?.first?.nombreB,
                                  cc: _model.partidoInfo?.first?.nombreC,
                                  dd: _model.partidoInfo?.first?.nombreD,
                                  isTechada:
                                      _model.partidoInfo?.first?.tipoCancha ==
                                              'Techada'
                                          ? true
                                          : false,
                                  partidoId:
                                      _model.partidoInfo!.first.partidoId!,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).then((value) => setState(() {}));
                  },
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
            if (_model.loading ?? true)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 255.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'Jugadores',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 22.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'Pareja 1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          'Pareja 2',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation1']!),
                                            Container(
                                              width: 60.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation2']!),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation3']!),
                                            Container(
                                              width: 60.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation4']!),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: Container(
                                            width: 0.5,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x6395A1AC),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation5']!),
                                            Container(
                                              width: 60.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation6']!),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 50.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                shape: BoxShape.circle,
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation7']!),
                                            Container(
                                              width: 60.0,
                                              height: 14.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation8']!),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 20.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 0.5,
                                        decoration: BoxDecoration(
                                          color: Color(0x6395A1AC),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Container(
                                              height: 35.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation9']!),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Container(
                                              height: 35.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation10']!),
                                          ),
                                        ),
                                      ].divide(SizedBox(width: 20.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            if (!_model.loading!)
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Partido',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.partidoInfo?.first?.tipo,
                                          'err',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Fecha',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        '${valueOrDefault<String>(
                                          dateTimeFormat('dd/MM',
                                              _model.partidoInfo?.first?.fecha),
                                          'error',
                                        )} ${valueOrDefault<String>(
                                          _model.partidoInfo?.first?.horaInicio,
                                          'error',
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cancha',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          _model.partidoInfo?.first?.cancha == 0
                                              ? 'Sin Cancha'
                                              : _model
                                                  .partidoInfo?.first?.cancha
                                                  ?.toString(),
                                          'error',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 0.0, 15.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 270.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              'Pareja 1',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                            Text(
                                              'Pareja 2',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((_model.partidoInfo?.first
                                                                  ?.uidA ==
                                                              null ||
                                                          _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.uidA ==
                                                              '') &&
                                                      !_model.isIn) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                child:
                                                                    ConfirmarInscripcionWidget(
                                                                  partidoId: widget!
                                                                      .partidoId!,
                                                                  posisicion:
                                                                      'A',
                                                                  aa: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidA,
                                                                  bb: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidB,
                                                                  cc: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidC,
                                                                  dd: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidD,
                                                                  cliente:
                                                                      '${_model.partidoInfo?.first?.nombreA == null || _model.partidoInfo?.first?.nombreA == '' ? FFAppState().UserInfo.nombre : _model.partidoInfo?.first?.nombreA}/${_model.partidoInfo?.first?.nombreB == null || _model.partidoInfo?.first?.nombreB == '' ? FFAppState().UserInfo.nombre : _model.partidoInfo?.first?.nombreB}-${_model.partidoInfo?.first?.nombreC == null || _model.partidoInfo?.first?.nombreC == '' ? FFAppState().UserInfo.nombre : _model.partidoInfo?.first?.nombreC}/${_model.partidoInfo?.first?.nombreD == null || _model.partidoInfo?.first?.nombreD == '' ? FFAppState().UserInfo.nombre : _model.partidoInfo?.first?.nombreD}',
                                                                  inicio: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.horaInicio,
                                                                  fecha: dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      _model
                                                                          .partidoInfo
                                                                          ?.first
                                                                          ?.fecha),
                                                                  isTechada: _model
                                                                              .partidoInfo
                                                                              ?.first
                                                                              ?.tipoCancha ==
                                                                          'Techada'
                                                                      ? true
                                                                      : false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarA ==
                                                                null ||
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarA ==
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: Image.asset(
                                                              'assets/images/plus.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarA !=
                                                                null &&
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarA !=
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(_model
                                                                      .partidoInfo!
                                                                      .first
                                                                      .hashA!),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                _model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .avatarA!,
                                                              ),
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault<String>(
                                                                  _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.nombreA,
                                                                  'A',
                                                                ) ==
                                                                FFAppState()
                                                                    .UserInfo
                                                                    .nombre
                                                            ? 'Tu'
                                                            : _model
                                                                .partidoInfo
                                                                ?.first
                                                                ?.nombreA,
                                                        'Libre',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingA ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: Text(
                                                        _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.rankingA !=
                                                                null
                                                            ? functions
                                                                .rankingConvert(_model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .rankingA!)
                                                            : '0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingA ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: FaIcon(
                                                        FontAwesomeIcons.coins,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((_model.partidoInfo?.first
                                                                  ?.uidB ==
                                                              null ||
                                                          _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.uidB ==
                                                              '') &&
                                                      !_model.isIn) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                child:
                                                                    ConfirmarInscripcionWidget(
                                                                  partidoId: widget!
                                                                      .partidoId!,
                                                                  posisicion:
                                                                      'B',
                                                                  aa: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidA,
                                                                  bb: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidB,
                                                                  cc: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidC,
                                                                  dd: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidD,
                                                                  cliente:
                                                                      '${_model.partidoInfo?.first?.nombreA}/${_model.partidoInfo?.first?.nombreB}-${_model.partidoInfo?.first?.nombreC}/${_model.partidoInfo?.first?.nombreD}',
                                                                  inicio: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.horaInicio,
                                                                  fecha: dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      _model
                                                                          .partidoInfo
                                                                          ?.first
                                                                          ?.fecha),
                                                                  isTechada: _model
                                                                              .partidoInfo
                                                                              ?.first
                                                                              ?.tipoCancha ==
                                                                          'Techada'
                                                                      ? true
                                                                      : false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarB ==
                                                                null ||
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarB ==
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: Image.asset(
                                                              'assets/images/plus.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarB !=
                                                                null &&
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarB !=
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(_model
                                                                      .partidoInfo!
                                                                      .first
                                                                      .hashB!),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                _model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .avatarB!,
                                                              ),
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault<String>(
                                                                  _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.nombreB,
                                                                  'A',
                                                                ) ==
                                                                FFAppState()
                                                                    .UserInfo
                                                                    .nombre
                                                            ? 'Tu'
                                                            : _model
                                                                .partidoInfo
                                                                ?.first
                                                                ?.nombreB,
                                                        'Libre',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingB ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: Text(
                                                        _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.rankingB !=
                                                                null
                                                            ? functions
                                                                .rankingConvert(_model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .rankingB!)
                                                            : '0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingB ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: FaIcon(
                                                        FontAwesomeIcons.coins,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 70.0),
                                              child: Container(
                                                width: 0.5,
                                                height: 40.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x6395A1AC),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((_model.partidoInfo?.first
                                                                  ?.uidC ==
                                                              null ||
                                                          _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.uidC ==
                                                              '') &&
                                                      !_model.isIn) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                child:
                                                                    ConfirmarInscripcionWidget(
                                                                  partidoId: widget!
                                                                      .partidoId!,
                                                                  posisicion:
                                                                      'C',
                                                                  aa: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidA,
                                                                  bb: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidB,
                                                                  cc: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidC,
                                                                  dd: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidD,
                                                                  cliente:
                                                                      '${_model.partidoInfo?.first?.nombreA}/${_model.partidoInfo?.first?.nombreB}-${_model.partidoInfo?.first?.nombreC}/${_model.partidoInfo?.first?.nombreD}',
                                                                  inicio: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.horaInicio,
                                                                  fecha: dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      _model
                                                                          .partidoInfo
                                                                          ?.first
                                                                          ?.fecha),
                                                                  isTechada: _model
                                                                              .partidoInfo
                                                                              ?.first
                                                                              ?.tipoCancha ==
                                                                          'Techada'
                                                                      ? true
                                                                      : false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarC ==
                                                                null ||
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarC ==
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: Image.asset(
                                                              'assets/images/plus.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarC !=
                                                                null &&
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarC !=
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(_model
                                                                      .partidoInfo!
                                                                      .first
                                                                      .hashC!),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                _model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .avatarC!,
                                                              ),
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault<String>(
                                                                  _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.nombreC,
                                                                  'A',
                                                                ) ==
                                                                FFAppState()
                                                                    .UserInfo
                                                                    .nombre
                                                            ? 'Tu'
                                                            : _model
                                                                .partidoInfo
                                                                ?.first
                                                                ?.nombreC,
                                                        'Libre',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingC ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: Text(
                                                        _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.rankingC !=
                                                                null
                                                            ? functions
                                                                .rankingConvert(_model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .rankingC!)
                                                            : '0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingC ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: FaIcon(
                                                        FontAwesomeIcons.coins,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((_model.partidoInfo?.first
                                                                  ?.uidD ==
                                                              null ||
                                                          _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.uidD ==
                                                              '') &&
                                                      !_model.isIn) {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (dialogContext) {
                                                        return Dialog(
                                                          elevation: 0,
                                                          insetPadding:
                                                              EdgeInsets.zero,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          alignment: AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                          child: WebViewAware(
                                                            child:
                                                                GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.9,
                                                                child:
                                                                    ConfirmarInscripcionWidget(
                                                                  partidoId: widget!
                                                                      .partidoId!,
                                                                  posisicion:
                                                                      'D',
                                                                  aa: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidA,
                                                                  bb: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidB,
                                                                  cc: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidC,
                                                                  dd: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.uidD,
                                                                  cliente:
                                                                      '${_model.partidoInfo?.first?.nombreA}/${_model.partidoInfo?.first?.nombreB}-${_model.partidoInfo?.first?.nombreC}/${_model.partidoInfo?.first?.nombreD}',
                                                                  inicio: _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.horaInicio,
                                                                  fecha: dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      _model
                                                                          .partidoInfo
                                                                          ?.first
                                                                          ?.fecha),
                                                                  isTechada: _model
                                                                              .partidoInfo
                                                                              ?.first
                                                                              ?.tipoCancha ==
                                                                          'Techada'
                                                                      ? true
                                                                      : false,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarD ==
                                                                null ||
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarD ==
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: Image.asset(
                                                              'assets/images/plus.png',
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        if (_model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarD !=
                                                                null &&
                                                            _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.avatarD !=
                                                                '')
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        32.0),
                                                            child: OctoImage(
                                                              placeholderBuilder:
                                                                  (_) => SizedBox
                                                                      .expand(
                                                                child: Image(
                                                                  image: BlurHashImage(_model
                                                                      .partidoInfo!
                                                                      .first
                                                                      .hashD!),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                _model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .avatarD!,
                                                              ),
                                                              width: 50.0,
                                                              height: 50.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        valueOrDefault<String>(
                                                                  _model
                                                                      .partidoInfo
                                                                      ?.first
                                                                      ?.nombreD,
                                                                  'A',
                                                                ) ==
                                                                FFAppState()
                                                                    .UserInfo
                                                                    .nombre
                                                            ? 'Tu'
                                                            : _model
                                                                .partidoInfo
                                                                ?.first
                                                                ?.nombreD,
                                                        'Libre',
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingD ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: Text(
                                                        _model
                                                                    .partidoInfo
                                                                    ?.first
                                                                    ?.rankingD !=
                                                                null
                                                            ? functions
                                                                .rankingConvert(_model
                                                                    .partidoInfo!
                                                                    .first
                                                                    .rankingD!)
                                                            : '0',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity: _model
                                                                  .partidoInfo
                                                                  ?.first
                                                                  ?.rankingD ==
                                                              null
                                                          ? 0.0
                                                          : 1.0,
                                                      child: FaIcon(
                                                        FontAwesomeIcons.coins,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 16.0,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 0.5,
                                            decoration: BoxDecoration(
                                              color: Color(0x6395A1AC),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.isIn)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 18.0, 10.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) =>
                                                      FFButtonWidget(
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () => _model
                                                                        .unfocusNode
                                                                        .canRequestFocus
                                                                    ? FocusScope.of(
                                                                            context)
                                                                        .requestFocus(_model
                                                                            .unfocusNode)
                                                                    : FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.9,
                                                                  child:
                                                                      SalirPartidoWidget(
                                                                    partidoId:
                                                                        widget!
                                                                            .partidoId!,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          setState(() {}));
                                                    },
                                                    text: 'Salir del Partido',
                                                    options: FFButtonOptions(
                                                      height: 40.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              24.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      context: context,
                                                      builder: (context) {
                                                        return WebViewAware(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () => _model
                                                                    .unfocusNode
                                                                    .canRequestFocus
                                                                ? FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode)
                                                                : FocusScope.of(
                                                                        context)
                                                                    .unfocus(),
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  PaymentPartidoWidget(
                                                                packId: 0,
                                                                precio: 100.0,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        safeSetState(() {}));
                                                  },
                                                  text: 'Pagar',
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FFAppState()
                                                        .Club
                                                        .colorTrue,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
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
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if (!_model.isIn)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Text(
                                                  'Selecciona el lugar y la pareja a la que quieres unirte.',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
