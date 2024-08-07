import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/liga/busca_partner/busca_partner_widget.dart';
import '/componentes/torneos/torneo_confirmar_inscripcion/torneo_confirmar_inscripcion_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'torneo_inscripcion_model.dart';
export 'torneo_inscripcion_model.dart';

class TorneoInscripcionWidget extends StatefulWidget {
  const TorneoInscripcionWidget({
    super.key,
    required this.paramCategorias,
    this.categoriasInscritas,
  });

  final List<TorneoCategoriasRow>? paramCategorias;
  final List<int>? categoriasInscritas;

  @override
  State<TorneoInscripcionWidget> createState() =>
      _TorneoInscripcionWidgetState();
}

class _TorneoInscripcionWidgetState extends State<TorneoInscripcionWidget>
    with TickerProviderStateMixin {
  late TorneoInscripcionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TorneoInscripcionModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            begin: 0.4,
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
            begin: 0.4,
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
            begin: 0.4,
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
            begin: 0.4,
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
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 12.0,
                        buttonSize: 36.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.chevron_left_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 18.0,
                        ),
                        onPressed: () async {
                          context.safePop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Text(
                      'Inscripción',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 1.0,
                  height: 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Selecciona tu pareja',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 20.0,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  onChanged: (_) => EasyDebounce.debounce(
                                    '_model.textController',
                                    Duration(milliseconds: 500),
                                    () async {
                                      _model.isLoading = true;
                                      setState(() {});
                                      _model.apiResultl5y =
                                          await SupabaseDashboardGroup
                                              .searchUsersCall
                                              .call(
                                        serachParam: _model
                                                        .textController.text ==
                                                    null ||
                                                _model.textController.text == ''
                                            ? 'vacio'
                                            : _model.textController.text,
                                      );

                                      if ((_model.apiResultl5y?.succeeded ??
                                          true)) {
                                        _model.isLoading = false;
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                  ),
                                  autofocus: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    alignLabelWithHint: false,
                                    hintText: 'Escribe el nombre de tu pareja.',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
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
            if (!_model.isLoading!)
              Container(
                constraints: BoxConstraints(
                  maxHeight: 180.0,
                ),
                decoration: BoxDecoration(),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final listUsers = SupabaseDashboardGroup.searchUsersCall
                              .apiUserId(
                                (_model.apiResultl5y?.jsonBody ?? ''),
                              )
                              ?.toList() ??
                          [];
                      if (listUsers.isEmpty) {
                        return Center(
                          child: BuscaPartnerWidget(),
                        );
                      }

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listUsers.length,
                        itemBuilder: (context, listUsersIndex) {
                          final listUsersItem = listUsers[listUsersIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.partnerId = SupabaseDashboardGroup
                                    .searchUsersCall
                                    .apiUserId(
                                  (_model.apiResultl5y?.jsonBody ?? ''),
                                )?[listUsersIndex];
                                _model.partnerName = SupabaseDashboardGroup
                                    .searchUsersCall
                                    .apiNombre(
                                  (_model.apiResultl5y?.jsonBody ?? ''),
                                )?[listUsersIndex];
                                setState(() {});
                              },
                              child: Container(
                                width: 100.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(32.0),
                                        child: OctoImage(
                                          placeholderBuilder: (_) =>
                                              SizedBox.expand(
                                            child: Image(
                                              image: BlurHashImage(
                                                  valueOrDefault<String>(
                                                SupabaseDashboardGroup
                                                    .searchUsersCall
                                                    .apiHashAvatar(
                                                  (_model.apiResultl5y
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[listUsersIndex],
                                                'z',
                                              )),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          image: NetworkImage(
                                            valueOrDefault<String>(
                                              SupabaseDashboardGroup
                                                  .searchUsersCall
                                                  .apiAvatar(
                                                (_model.apiResultl5y
                                                        ?.jsonBody ??
                                                    ''),
                                              )?[listUsersIndex],
                                              'z',
                                            ),
                                          ),
                                          width: 50.0,
                                          height: 50.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        SupabaseDashboardGroup
                                                            .searchUsersCall
                                                            .apiNombre(
                                                          (_model.apiResultl5y
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?[listUsersIndex],
                                                        'z',
                                                      ),
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: ' ',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        SupabaseDashboardGroup
                                                            .searchUsersCall
                                                            .apiApellido(
                                                          (_model.apiResultl5y
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?[listUsersIndex],
                                                        'z',
                                                      ),
                                                      style: TextStyle(),
                                                    )
                                                  ],
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'Ranking ${functions.rankingConvert(valueOrDefault<int>(
                                                  SupabaseDashboardGroup
                                                      .searchUsersCall
                                                      .apiRanking(
                                                    (_model.apiResultl5y
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[listUsersIndex],
                                                  1,
                                                ))}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ].divide(SizedBox(height: 4.0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            if ((SupabaseDashboardGroup
                                                    .searchUsersCall
                                                    .apiUserId(
                                                  (_model.apiResultl5y
                                                          ?.jsonBody ??
                                                      ''),
                                                )?[listUsersIndex]) ==
                                                _model.partnerId)
                                              Container(
                                                width: 15.0,
                                                height: 15.0,
                                                decoration: BoxDecoration(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().Club.colorTrue,
                                                    Colors.black,
                                                  ),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (_model.isLoading ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation1']!),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation2']!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (_model.isLoading ?? true)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  shape: BoxShape.circle,
                                ),
                              ).animateOnPageLoad(animationsMap[
                                  'containerOnPageLoadAnimation3']!),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: 200.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ).animateOnPageLoad(animationsMap[
                                    'containerOnPageLoadAnimation4']!),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 35.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Selecciona tu categoría',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final categoriaVIew = widget!.paramCategorias!.toList();

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 2.3,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: categoriaVIew.length,
                      itemBuilder: (context, categoriaVIewIndex) {
                        final categoriaVIewItem =
                            categoriaVIew[categoriaVIewIndex];
                        return Visibility(
                          visible: !widget!.categoriasInscritas!.contains(
                              widget!.paramCategorias?[categoriaVIewIndex]
                                  ?.categoriaId),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.categoriaId =
                                  categoriaVIewItem.categoriaId;
                              _model.categoria = categoriaVIewItem.nombre;
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color:
                                    categoriaVIewItem.nombre == _model.categoria
                                        ? valueOrDefault<Color>(
                                            FFAppState().Club.colorTrue,
                                            Colors.black,
                                          )
                                        : Color(0x00000000),
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    categoriaVIewItem.nombre,
                                    'a',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) => Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 40.0),
                            child: FFButtonWidget(
                              onPressed: ((_model.categoria == null ||
                                          _model.categoria == '') ||
                                      (_model.partnerId == null ||
                                          _model.partnerId == ''))
                                  ? null
                                  : () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child: WebViewAware(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(dialogContext)
                                                        .unfocus(),
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.9,
                                                  child:
                                                      TorneoConfirmarInscripcionWidget(
                                                    categoria:
                                                        _model.categoria!,
                                                    nombrePartner:
                                                        _model.partnerName!,
                                                    partnerId:
                                                        _model.partnerId!,
                                                    categoriaId:
                                                        _model.categoriaId!,
                                                    torneoId: widget!
                                                        .paramCategorias!
                                                        .first
                                                        .torneoId!,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                              text: 'Confirmar',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: valueOrDefault<Color>(
                                  FFAppState().Club.colorTrue,
                                  Colors.black,
                                ),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: (_model.categoria == null ||
                                                  _model.categoria == '') ||
                                              (_model.partnerId == null ||
                                                  _model.partnerId == '')
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryText
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
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
    );
  }
}
