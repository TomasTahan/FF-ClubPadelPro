import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/componentes/liga/anotar_resultados_liga/anotar_resultados_liga_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'liga_partidos_model.dart';
export 'liga_partidos_model.dart';

class LigaPartidosWidget extends StatefulWidget {
  const LigaPartidosWidget({
    super.key,
    required this.ligaId,
    required this.anotarResultados,
  });

  final int? ligaId;
  final bool? anotarResultados;

  @override
  State<LigaPartidosWidget> createState() => _LigaPartidosWidgetState();
}

class _LigaPartidosWidgetState extends State<LigaPartidosWidget> {
  late LigaPartidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LigaPartidosModel());

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
          title: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
            child: Row(
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
                    context.pushNamed('LigaPage');
                  },
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(-0.1, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 25.0, 0.0),
                      child: Text(
                        'Partidos',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 22.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                child: FutureBuilder<ApiCallResponse>(
                  future: SupabaseDashboardGroup.getPartidosLigaUserCall.call(
                    ligaId: widget!.ligaId,
                    uid: currentUserUid,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: SpinKitFadingFour(
                            color: FlutterFlowTheme.of(context).primary,
                            size: 40.0,
                          ),
                        ),
                      );
                    }
                    final listViewGetPartidosLigaUserResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final partidosView =
                            SupabaseDashboardGroup.getPartidosLigaUserCall
                                    .partidoId(
                                      listViewGetPartidosLigaUserResponse
                                          .jsonBody,
                                    )
                                    ?.toList() ??
                                [];

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: partidosView.length,
                          itemBuilder: (context, partidosViewIndex) {
                            final partidosViewItem =
                                partidosView[partidosViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 15.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                    'LigaPartido',
                                    queryParameters: {
                                      'partidoId': serializeParam(
                                        SupabaseDashboardGroup
                                            .getPartidosLigaUserCall
                                            .partidoId(
                                          listViewGetPartidosLigaUserResponse
                                              .jsonBody,
                                        )?[partidosViewIndex],
                                        ParamType.int,
                                      ),
                                      'anotarResultados': serializeParam(
                                        widget!.anotarResultados,
                                        ParamType.bool,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: Color(0x6395A1AC),
                                      width: 0.5,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 15.0, 15.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Partido ${(partidosViewIndex + 1).toString()}',
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
                                              ],
                                            ),
                                            if (valueOrDefault<String>(
                                                      SupabaseDashboardGroup
                                                          .getPartidosLigaUserCall
                                                          .fecha(
                                                        listViewGetPartidosLigaUserResponse
                                                            .jsonBody,
                                                      )?[partidosViewIndex],
                                                      'a',
                                                    ) ==
                                                    null ||
                                                valueOrDefault<String>(
                                                      SupabaseDashboardGroup
                                                          .getPartidosLigaUserCall
                                                          .fecha(
                                                        listViewGetPartidosLigaUserResponse
                                                            .jsonBody,
                                                      )?[partidosViewIndex],
                                                      'a',
                                                    ) ==
                                                    '')
                                              FaIcon(
                                                FontAwesomeIcons.angleRight,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 20.0,
                                              ),
                                            if (valueOrDefault<String>(
                                                      SupabaseDashboardGroup
                                                          .getPartidosLigaUserCall
                                                          .fecha(
                                                        listViewGetPartidosLigaUserResponse
                                                            .jsonBody,
                                                      )?[partidosViewIndex],
                                                      'a',
                                                    ) !=
                                                    null &&
                                                valueOrDefault<String>(
                                                      SupabaseDashboardGroup
                                                          .getPartidosLigaUserCall
                                                          .fecha(
                                                        listViewGetPartidosLigaUserResponse
                                                            .jsonBody,
                                                      )?[partidosViewIndex],
                                                      'a',
                                                    ) !=
                                                    '')
                                              RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: functions.newDate(
                                                          valueOrDefault<
                                                              String>(
                                                        SupabaseDashboardGroup
                                                            .getPartidosLigaUserCall
                                                            .fecha(
                                                          listViewGetPartidosLigaUserResponse
                                                              .jsonBody,
                                                        )?[partidosViewIndex],
                                                        'a',
                                                      )),
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: ' cancha ',
                                                      style: TextStyle(),
                                                    ),
                                                    TextSpan(
                                                      text: valueOrDefault<
                                                          String>(
                                                        (SupabaseDashboardGroup
                                                                .getPartidosLigaUserCall
                                                                .cancha(
                                                          listViewGetPartidosLigaUserResponse
                                                              .jsonBody,
                                                        )?[partidosViewIndex])
                                                            ?.toString(),
                                                        'a',
                                                      ),
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
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
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 0.5,
                                          decoration: BoxDecoration(
                                            color: Color(0x6395A1AC),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Container(
                                                        width: 0.5,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x6395A1AC),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    25.0,
                                                                    0.0,
                                                                    25.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x6395A1AC),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.75, 0.0),
                                                      child: Container(
                                                        width: 0.5,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x6395A1AC),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.75, 0.0),
                                                      child: Container(
                                                        width: 0.5,
                                                        height: 200.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x6395A1AC),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
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
                                                                  image: BlurHashImage(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .hasha1(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex]),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              image:
                                                                  NetworkImage(
                                                                SupabaseDashboardGroup
                                                                    .getPartidosLigaUserCall
                                                                    .avatara1(
                                                                  listViewGetPartidosLigaUserResponse
                                                                      .jsonBody,
                                                                )![partidosViewIndex],
                                                              ),
                                                              width: 35.0,
                                                              height: 35.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        15.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                SupabaseDashboardGroup
                                                                    .getPartidosLigaUserCall
                                                                    .namea1(
                                                                  listViewGetPartidosLigaUserResponse
                                                                      .jsonBody,
                                                                )?[partidosViewIndex],
                                                                'a',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.rankingConvert(
                                                                    SupabaseDashboardGroup
                                                                        .getPartidosLigaUserCall
                                                                        .rankinga1(
                                                                  listViewGetPartidosLigaUserResponse
                                                                      .jsonBody,
                                                                )![partidosViewIndex]),
                                                                'N.A',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
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
                                                                    image: BlurHashImage(SupabaseDashboardGroup
                                                                        .getPartidosLigaUserCall
                                                                        .hasha2(
                                                                      listViewGetPartidosLigaUserResponse
                                                                          .jsonBody,
                                                                    )![partidosViewIndex]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                image:
                                                                    NetworkImage(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .avatara2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex],
                                                                ),
                                                                width: 35.0,
                                                                height: 35.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          15.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .namea2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex],
                                                                  'a',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.rankingConvert(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .rankinga2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex]),
                                                                  'N.A',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.rankingConvert(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .rankingb1(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex]),
                                                                  'N.A',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .nameb1(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex],
                                                                  'a',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
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
                                                                    image: BlurHashImage(SupabaseDashboardGroup
                                                                        .getPartidosLigaUserCall
                                                                        .hashb1(
                                                                      listViewGetPartidosLigaUserResponse
                                                                          .jsonBody,
                                                                    )![partidosViewIndex]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                image:
                                                                    NetworkImage(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .avatarb1(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex],
                                                                ),
                                                                width: 35.0,
                                                                height: 35.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    20.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  functions.rankingConvert(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .rankingb2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex]),
                                                                  'N.A',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .nameb2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex],
                                                                  'a',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
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
                                                                    image: BlurHashImage(
                                                                        SupabaseDashboardGroup
                                                                            .getPartidosLigaUserCall
                                                                            .hasb2(
                                                                      listViewGetPartidosLigaUserResponse
                                                                          .jsonBody,
                                                                    )![partidosViewIndex]),
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                image:
                                                                    NetworkImage(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .avatarb2(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )![partidosViewIndex],
                                                                ),
                                                                width: 35.0,
                                                                height: 35.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (((SupabaseDashboardGroup
                                                                    .getPartidosLigaUserCall
                                                                    .resultado(
                                                              listViewGetPartidosLigaUserResponse
                                                                  .jsonBody,
                                                            )?[
                                                                partidosViewIndex]) ==
                                                            null) &&
                                                        (valueOrDefault<String>(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .fecha(
                                                                        listViewGetPartidosLigaUserResponse
                                                                            .jsonBody,
                                                                      )?[partidosViewIndex],
                                                                      'a',
                                                                    ) !=
                                                                    null &&
                                                                valueOrDefault<
                                                                        String>(
                                                                      SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .fecha(
                                                                        listViewGetPartidosLigaUserResponse
                                                                            .jsonBody,
                                                                      )?[partidosViewIndex],
                                                                      'a',
                                                                    ) !=
                                                                    ''
                                                            ? functions.isNow(
                                                                valueOrDefault<
                                                                    String>(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .inicio(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex],
                                                                  'a',
                                                                ),
                                                                valueOrDefault<
                                                                    String>(
                                                                  SupabaseDashboardGroup
                                                                      .getPartidosLigaUserCall
                                                                      .fecha(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex],
                                                                  'a',
                                                                ),
                                                                getCurrentTimestamp)
                                                            : false) &&
                                                        widget!
                                                            .anotarResultados!)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Builder(
                                                              builder: (context) =>
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap: () => _model.unfocusNode.canRequestFocus
                                                                                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                                : FocusScope.of(context).unfocus(),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 0.95,
                                                                              child: AnotarResultadosLigaWidget(
                                                                                partidoId: SupabaseDashboardGroup.getPartidosLigaUserCall.partidoId(
                                                                                  listViewGetPartidosLigaUserResponse.jsonBody,
                                                                                )![partidosViewIndex],
                                                                                aa: SupabaseDashboardGroup.getPartidosLigaUserCall.namea1(
                                                                                  listViewGetPartidosLigaUserResponse.jsonBody,
                                                                                )![partidosViewIndex],
                                                                                bb: SupabaseDashboardGroup.getPartidosLigaUserCall.namea2(
                                                                                  listViewGetPartidosLigaUserResponse.jsonBody,
                                                                                )![partidosViewIndex],
                                                                                cc: SupabaseDashboardGroup.getPartidosLigaUserCall.nameb1(
                                                                                  listViewGetPartidosLigaUserResponse.jsonBody,
                                                                                )![partidosViewIndex],
                                                                                dd: SupabaseDashboardGroup.getPartidosLigaUserCall.nameb2(
                                                                                  listViewGetPartidosLigaUserResponse.jsonBody,
                                                                                )![partidosViewIndex],
                                                                                ligaId: widget!.ligaId!,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      setState(
                                                                          () {}));
                                                                },
                                                                text:
                                                                    'Anotar Resultado',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 30.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w300,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    if (((SupabaseDashboardGroup
                                                                    .getPartidosLigaUserCall
                                                                    .resultado(
                                                              listViewGetPartidosLigaUserResponse
                                                                  .jsonBody,
                                                            )?[
                                                                partidosViewIndex]) !=
                                                            null) &&
                                                        (functions
                                                                .numSets(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  (SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .resultado(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex])
                                                                      ?.toString(),
                                                                  'a',
                                                                ))
                                                                .toString() ==
                                                            '2'))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              width: 40.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  functions
                                                                      .returnResultado(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            (SupabaseDashboardGroup.getPartidosLigaUserCall.resultado(
                                                                              listViewGetPartidosLigaUserResponse.jsonBody,
                                                                            )?[partidosViewIndex])
                                                                                ?.toString(),
                                                                            'a',
                                                                          ),
                                                                          1),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions
                                                                        .returnResultado(
                                                                            valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosLigaUserCall.resultado(
                                                                                listViewGetPartidosLigaUserResponse.jsonBody,
                                                                              )?[partidosViewIndex])
                                                                                  ?.toString(),
                                                                              'a',
                                                                            ),
                                                                            2),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 5.0)),
                                                        ),
                                                      ),
                                                    if (((SupabaseDashboardGroup
                                                                    .getPartidosLigaUserCall
                                                                    .resultado(
                                                              listViewGetPartidosLigaUserResponse
                                                                  .jsonBody,
                                                            )?[
                                                                partidosViewIndex]) !=
                                                            null) &&
                                                        (functions
                                                                .numSets(
                                                                    valueOrDefault<
                                                                        String>(
                                                                  (SupabaseDashboardGroup
                                                                          .getPartidosLigaUserCall
                                                                          .resultado(
                                                                    listViewGetPartidosLigaUserResponse
                                                                        .jsonBody,
                                                                  )?[partidosViewIndex])
                                                                      ?.toString(),
                                                                  'a',
                                                                ))
                                                                .toString() ==
                                                            '3'))
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Container(
                                                              width: 40.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  functions
                                                                      .returnResultado(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            (SupabaseDashboardGroup.getPartidosLigaUserCall.resultado(
                                                                              listViewGetPartidosLigaUserResponse.jsonBody,
                                                                            )?[partidosViewIndex])
                                                                                ?.toString(),
                                                                            'a',
                                                                          ),
                                                                          1),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Container(
                                                                width: 40.0,
                                                                height: 35.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    functions
                                                                        .returnResultado(
                                                                            valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosLigaUserCall.resultado(
                                                                                listViewGetPartidosLigaUserResponse.jsonBody,
                                                                              )?[partidosViewIndex])
                                                                                  ?.toString(),
                                                                              'a',
                                                                            ),
                                                                            2),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 40.0,
                                                              height: 35.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  functions
                                                                      .returnResultado(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            (SupabaseDashboardGroup.getPartidosLigaUserCall.resultado(
                                                                              listViewGetPartidosLigaUserResponse.jsonBody,
                                                                            )?[partidosViewIndex])
                                                                                ?.toString(),
                                                                            'a',
                                                                          ),
                                                                          3),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 5.0)),
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
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
