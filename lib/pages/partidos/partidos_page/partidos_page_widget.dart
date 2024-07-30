import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/partidos/anotar_resultados/anotar_resultados_widget.dart';
import '/componentes/partidos/no_historial/no_historial_widget.dart';
import '/componentes/partidos/no_partidos/no_partidos_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'partidos_page_model.dart';
export 'partidos_page_model.dart';

class PartidosPageWidget extends StatefulWidget {
  const PartidosPageWidget({super.key});

  @override
  State<PartidosPageWidget> createState() => _PartidosPageWidgetState();
}

class _PartidosPageWidgetState extends State<PartidosPageWidget>
    with TickerProviderStateMixin {
  late PartidosPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidosPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 910.0.ms,
            begin: Offset(0.6, 0.6),
            end: Offset(1.0, 1.0),
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
                  context.pushNamed('HomePage');
                },
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-0.1, 0.0),
                  child: Text(
                    'Partidos',
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
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 10.0,
                buttonSize: 36.0,
                fillColor: FFAppState().Club.colorTrue,
                icon: FaIcon(
                  FontAwesomeIcons.plus,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 18.0,
                ),
                onPressed: () async {
                  context.pushNamed(
                    'PartidoNuevo',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                      ),
                    },
                  );
                },
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
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0),
                    child: TabBar(
                      labelColor: FlutterFlowTheme.of(context).primaryText,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Roboto',
                                letterSpacing: 0.0,
                              ),
                      unselectedLabelStyle: TextStyle(),
                      indicatorColor: FFAppState().Club.colorTrue,
                      padding: EdgeInsets.all(4.0),
                      tabs: [
                        Tab(
                          text: 'Próximos',
                        ),
                        Tab(
                          text: 'Historial',
                        ),
                      ],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FutureBuilder<List<VistaPartidosRow>>(
                            future: VistaPartidosTable().queryRows(
                              queryFn: (q) => q
                                  .gte(
                                    'fecha',
                                    supaSerialize<DateTime>(
                                        getCurrentTimestamp),
                                  )
                                  .eq(
                                    'clubId',
                                    FFAppState().Club.clubId,
                                  )
                                  .order('fecha', ascending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).alternate,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<VistaPartidosRow>
                                  listViewVistaPartidosRowList = snapshot.data!;

                              if (listViewVistaPartidosRowList.isEmpty) {
                                return NoPartidosWidget();
                              }

                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewVistaPartidosRowList.length,
                                separatorBuilder: (_, __) =>
                                    SizedBox(height: 15.0),
                                itemBuilder: (context, listViewIndex) {
                                  final listViewVistaPartidosRow =
                                      listViewVistaPartidosRowList[
                                          listViewIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 15.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'PartidoPage',
                                          queryParameters: {
                                            'partidoId': serializeParam(
                                              listViewVistaPartidosRow
                                                  .partidoId,
                                              ParamType.int,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        width: 100.0,
                                        height: 150.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Color(0x6395A1AC),
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCalendar,
                                                    color: FFAppState()
                                                        .Club
                                                        .colorTrue,
                                                    size: 14.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: functions.newDate(
                                                                  dateTimeFormat(
                                                                      'yyyy-MM-dd',
                                                                      listViewVistaPartidosRow
                                                                          .fecha!)),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: ' de ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewVistaPartidosRow
                                                                    .horaInicio,
                                                                'a',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: ' a ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                listViewVistaPartidosRow
                                                                    .horaFin,
                                                                'a',
                                                              ),
                                                              style:
                                                                  TextStyle(),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  Text(
                                                    valueOrDefault<String>(
                                                      listViewVistaPartidosRow
                                                          .tipo,
                                                      'a',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    functions.cuposDisponibles(
                                                                        listViewVistaPartidosRow
                                                                            .uidA,
                                                                        listViewVistaPartidosRow
                                                                            .uidB,
                                                                        listViewVistaPartidosRow
                                                                            .uidC,
                                                                        listViewVistaPartidosRow
                                                                            .uidD),
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
                                                                  Text(
                                                                    listViewVistaPartidosRow.cancha ==
                                                                            0
                                                                        ? 'Sin cancha'
                                                                        : 'Cancha ${listViewVistaPartidosRow.cancha?.toString()}',
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Stack(
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.8,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (listViewVistaPartidosRow.uidB == null || listViewVistaPartidosRow.uidB == '')
                                                                                  Container(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/plus.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                if (listViewVistaPartidosRow.uidB != null && listViewVistaPartidosRow.uidB != '')
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(32.0),
                                                                                    child: OctoImage(
                                                                                      placeholderBuilder: (_) => SizedBox.expand(
                                                                                        child: Image(
                                                                                          image: BlurHashImage(listViewVistaPartidosRow.hashB!),
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      image: NetworkImage(
                                                                                        listViewVistaPartidosRow.avatarB!,
                                                                                      ),
                                                                                      width: 35.0,
                                                                                      height: 35.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              if (listViewVistaPartidosRow.uidA != null && listViewVistaPartidosRow.uidA != '')
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(32.0),
                                                                                  child: OctoImage(
                                                                                    placeholderBuilder: (_) => SizedBox.expand(
                                                                                      child: Image(
                                                                                        image: BlurHashImage(listViewVistaPartidosRow.hashA!),
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    image: NetworkImage(
                                                                                      listViewVistaPartidosRow.avatarA!,
                                                                                    ),
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              if (listViewVistaPartidosRow.uidA == null || listViewVistaPartidosRow.uidA == '')
                                                                                Container(
                                                                                  width: 35.0,
                                                                                  height: 35.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.asset(
                                                                                    'assets/images/plus.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.5,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              0.5,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x6395A1AC),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.1,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              2.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                40.0,
                                                                            height:
                                                                                40.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (listViewVistaPartidosRow.uidD == null || listViewVistaPartidosRow.uidD == '')
                                                                                  Container(
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/plus.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                if (listViewVistaPartidosRow.uidD != null && listViewVistaPartidosRow.uidD != '')
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(32.0),
                                                                                    child: OctoImage(
                                                                                      placeholderBuilder: (_) => SizedBox.expand(
                                                                                        child: Image(
                                                                                          image: BlurHashImage(listViewVistaPartidosRow.hashD!),
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                      image: NetworkImage(
                                                                                        listViewVistaPartidosRow.avatarD!,
                                                                                      ),
                                                                                      width: 35.0,
                                                                                      height: 35.0,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.3,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              40.0,
                                                                          height:
                                                                              40.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              if (listViewVistaPartidosRow.uidC == null || listViewVistaPartidosRow.uidC == '')
                                                                                Container(
                                                                                  width: 35.0,
                                                                                  height: 35.0,
                                                                                  clipBehavior: Clip.antiAlias,
                                                                                  decoration: BoxDecoration(
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                  child: Image.asset(
                                                                                    'assets/images/plus.png',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              if (listViewVistaPartidosRow.uidC != null && listViewVistaPartidosRow.uidC != '')
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(32.0),
                                                                                  child: OctoImage(
                                                                                    placeholderBuilder: (_) => SizedBox.expand(
                                                                                      child: Image(
                                                                                        image: BlurHashImage(listViewVistaPartidosRow.hashC!),
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    image: NetworkImage(
                                                                                      listViewVistaPartidosRow.avatarC!,
                                                                                    ),
                                                                                    width: 35.0,
                                                                                    height: 35.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.end,
                                                                          children: [
                                                                            Text(
                                                                              'Categoria',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w300,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                functions.rankingConvert(valueOrDefault<int>(
                                                                                  listViewVistaPartidosRow.rankingA,
                                                                                  200,
                                                                                )),
                                                                                '5.0',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Roboto',
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
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
                                    ).animateOnPageLoad(animationsMap[
                                        'containerOnPageLoadAnimation1']!),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 20.0, 15.0, 0.0),
                          child: FutureBuilder<ApiCallResponse>(
                            future:
                                SupabaseDashboardGroup.getPartidosUserCall.call(
                              userId: FFAppState().UserInfo.userId,
                              fecha: dateTimeFormat(
                                  'yyyy-MM-dd', getCurrentTimestamp),
                              clubId: FFAppState().Club.clubId,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40.0,
                                    height: 40.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).alternate,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              final listViewGetPartidosUserResponse =
                                  snapshot.data!;

                              return Builder(
                                builder: (context) {
                                  final historialView =
                                      SupabaseDashboardGroup.getPartidosUserCall
                                              .apiPartidoId(
                                                listViewGetPartidosUserResponse
                                                    .jsonBody,
                                              )
                                              ?.toList() ??
                                          [];
                                  if (historialView.isEmpty) {
                                    return NoHistorialWidget();
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.vertical,
                                    itemCount: historialView.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 24.0),
                                    itemBuilder: (context, historialViewIndex) {
                                      final historialViewItem =
                                          historialView[historialViewIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: Color(0x6395A1AC),
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 15.0, 15.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FaIcon(
                                                    FontAwesomeIcons
                                                        .solidCalendar,
                                                    color: FFAppState()
                                                        .Club
                                                        .colorTrue,
                                                    size: 14.0,
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: functions.oldDate(
                                                                  (SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiFecha(
                                                                listViewGetPartidosUserResponse
                                                                    .jsonBody,
                                                              )![historialViewIndex])
                                                                      .toString()),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                            TextSpan(
                                                              text: ' de ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                (SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiInicio(
                                                                  listViewGetPartidosUserResponse
                                                                      .jsonBody,
                                                                )?[historialViewIndex])
                                                                    ?.toString(),
                                                                'a',
                                                              ),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' a ',
                                                              style:
                                                                  TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text:
                                                                  valueOrDefault<
                                                                      String>(
                                                                (SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiFin(
                                                                  listViewGetPartidosUserResponse
                                                                      .jsonBody,
                                                                )?[historialViewIndex])
                                                                    ?.toString(),
                                                                'b',
                                                              ),
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                  Text(
                                                    valueOrDefault<String>(
                                                      (SupabaseDashboardGroup
                                                              .getPartidosUserCall
                                                              .apiTipo(
                                                        listViewGetPartidosUserResponse
                                                            .jsonBody,
                                                      )?[historialViewIndex])
                                                          ?.toString(),
                                                      'tipo',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
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
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
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
                                                                color: Color(
                                                                    0x6395A1AC),
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
                                                                width: double
                                                                    .infinity,
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
                                                                color: Color(
                                                                    0x6395A1AC),
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
                                                                color: Color(
                                                                    0x6395A1AC),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        25.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if ((SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiNombreA(
                                                                      listViewGetPartidosUserResponse
                                                                          .jsonBody,
                                                                    )?[historialViewIndex]) !=
                                                                    null)
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            32.0),
                                                                    child:
                                                                        OctoImage(
                                                                      placeholderBuilder:
                                                                          (_) =>
                                                                              SizedBox.expand(
                                                                        child:
                                                                            Image(
                                                                          image: BlurHashImage((SupabaseDashboardGroup.getPartidosUserCall.apiHashA(
                                                                            listViewGetPartidosUserResponse.jsonBody,
                                                                          )![historialViewIndex])
                                                                              .toString()),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      image:
                                                                          NetworkImage(
                                                                        (SupabaseDashboardGroup.getPartidosUserCall.apiAvatarA(
                                                                          listViewGetPartidosUserResponse
                                                                              .jsonBody,
                                                                        )![historialViewIndex])
                                                                            .toString(),
                                                                      ),
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          30.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                if ((SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiNombreA(
                                                                      listViewGetPartidosUserResponse
                                                                          .jsonBody,
                                                                    )?[historialViewIndex]) !=
                                                                    null)
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      (SupabaseDashboardGroup
                                                                              .getPartidosUserCall
                                                                              .apiNombreA(
                                                                        listViewGetPartidosUserResponse
                                                                            .jsonBody,
                                                                      )?[historialViewIndex])
                                                                          ?.toString(),
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
                                                              ].divide(SizedBox(
                                                                  width: 25.0)),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        75.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                if ((SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiNombreB(
                                                                      listViewGetPartidosUserResponse
                                                                          .jsonBody,
                                                                    )?[historialViewIndex]) !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            25.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              32.0),
                                                                      child:
                                                                          OctoImage(
                                                                        placeholderBuilder:
                                                                            (_) =>
                                                                                SizedBox.expand(
                                                                          child:
                                                                              Image(
                                                                            image: BlurHashImage((SupabaseDashboardGroup.getPartidosUserCall.apiHashB(
                                                                              listViewGetPartidosUserResponse.jsonBody,
                                                                            )![historialViewIndex])
                                                                                .toString()),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        image:
                                                                            NetworkImage(
                                                                          (SupabaseDashboardGroup.getPartidosUserCall.apiAvatarB(
                                                                            listViewGetPartidosUserResponse.jsonBody,
                                                                          )![historialViewIndex])
                                                                              .toString(),
                                                                        ),
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                if ((SupabaseDashboardGroup
                                                                        .getPartidosUserCall
                                                                        .apiNombreB(
                                                                      listViewGetPartidosUserResponse
                                                                          .jsonBody,
                                                                    )?[historialViewIndex]) !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (SupabaseDashboardGroup.getPartidosUserCall.apiNombreB(
                                                                          listViewGetPartidosUserResponse
                                                                              .jsonBody,
                                                                        )?[historialViewIndex])
                                                                            ?.toString(),
                                                                        'b',
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
                                                              ].divide(SizedBox(
                                                                  width: 25.0)),
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
                                                                          25.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if ((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiNombreC(
                                                                        listViewGetPartidosUserResponse
                                                                            .jsonBody,
                                                                      )?[historialViewIndex]) !=
                                                                      null)
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (SupabaseDashboardGroup.getPartidosUserCall.apiNombreC(
                                                                          listViewGetPartidosUserResponse
                                                                              .jsonBody,
                                                                        )?[historialViewIndex])
                                                                            ?.toString(),
                                                                        'c',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    ),
                                                                  if ((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiNombreC(
                                                                        listViewGetPartidosUserResponse
                                                                            .jsonBody,
                                                                      )?[historialViewIndex]) !=
                                                                      null)
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              32.0),
                                                                      child:
                                                                          OctoImage(
                                                                        placeholderBuilder:
                                                                            (_) =>
                                                                                SizedBox.expand(
                                                                          child:
                                                                              Image(
                                                                            image:
                                                                                BlurHashImage(valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiHashC(
                                                                                listViewGetPartidosUserResponse.jsonBody,
                                                                              )?[historialViewIndex])
                                                                                  ?.toString(),
                                                                              'a',
                                                                            )),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        image:
                                                                            NetworkImage(
                                                                          (SupabaseDashboardGroup.getPartidosUserCall.apiAvatarC(
                                                                            listViewGetPartidosUserResponse.jsonBody,
                                                                          )![historialViewIndex])
                                                                              .toString(),
                                                                        ),
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        25.0)),
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
                                                                          75.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  if ((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiNombreD(
                                                                        listViewGetPartidosUserResponse
                                                                            .jsonBody,
                                                                      )?[historialViewIndex]) !=
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          (SupabaseDashboardGroup.getPartidosUserCall.apiNombreD(
                                                                            listViewGetPartidosUserResponse.jsonBody,
                                                                          )?[historialViewIndex])
                                                                              ?.toString(),
                                                                          'd',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  if ((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiNombreD(
                                                                        listViewGetPartidosUserResponse
                                                                            .jsonBody,
                                                                      )?[historialViewIndex]) !=
                                                                      null)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          25.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(32.0),
                                                                        child:
                                                                            OctoImage(
                                                                          placeholderBuilder: (_) =>
                                                                              SizedBox.expand(
                                                                            child:
                                                                                Image(
                                                                              image: BlurHashImage((SupabaseDashboardGroup.getPartidosUserCall.apiHashD(
                                                                                listViewGetPartidosUserResponse.jsonBody,
                                                                              )![historialViewIndex])
                                                                                  .toString()),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          image:
                                                                              NetworkImage(
                                                                            (SupabaseDashboardGroup.getPartidosUserCall.apiAvatarD(
                                                                              listViewGetPartidosUserResponse.jsonBody,
                                                                            )![historialViewIndex])
                                                                                .toString(),
                                                                          ),
                                                                          width:
                                                                              30.0,
                                                                          height:
                                                                              30.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        25.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          if (((SupabaseDashboardGroup
                                                                      .getPartidosUserCall
                                                                      .apiResultado(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex]) !=
                                                                  null) &&
                                                              (functions
                                                                      .numSets(valueOrDefault<String>(
                                                                        (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                          listViewGetPartidosUserResponse
                                                                              .jsonBody,
                                                                        )?[historialViewIndex])
                                                                            ?.toString(),
                                                                        '5',
                                                                      ))
                                                                      .toString() ==
                                                                  '3') &&
                                                              functions.isMatchComplete(
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidA(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidB(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidC(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidD(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString()))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.returnResultado(
                                                                            valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                                listViewGetPartidosUserResponse.jsonBody,
                                                                              )?[historialViewIndex])
                                                                                  ?.toString(),
                                                                              '5',
                                                                            ),
                                                                            1),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          35.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.returnResultado(
                                                                              valueOrDefault<String>(
                                                                                (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                                  listViewGetPartidosUserResponse.jsonBody,
                                                                                )?[historialViewIndex])
                                                                                    ?.toString(),
                                                                                '5',
                                                                              ),
                                                                              2),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.returnResultado(
                                                                            valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                                listViewGetPartidosUserResponse.jsonBody,
                                                                              )?[historialViewIndex])
                                                                                  ?.toString(),
                                                                              '5',
                                                                            ),
                                                                            3),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          if (functions.isNow(
                                                                  (SupabaseDashboardGroup
                                                                              .getPartidosUserCall
                                                                              .apiInicio(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )![
                                                                          historialViewIndex])
                                                                      .toString(),
                                                                  (SupabaseDashboardGroup
                                                                              .getPartidosUserCall
                                                                              .apiFecha(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )![
                                                                          historialViewIndex])
                                                                      .toString(),
                                                                  getCurrentTimestamp) &&
                                                              ((SupabaseDashboardGroup
                                                                      .getPartidosUserCall
                                                                      .apiResultado(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex]) ==
                                                                  null) &&
                                                              functions.isMatchComplete(
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidA(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidB(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidC(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidD(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString()))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Builder(
                                                                    builder:
                                                                        (context) =>
                                                                            FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (dialogContext) {
                                                                            return Dialog(
                                                                              elevation: 0,
                                                                              insetPadding: EdgeInsets.zero,
                                                                              backgroundColor: Colors.transparent,
                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                              child: WebViewAware(
                                                                                child: GestureDetector(
                                                                                  onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.95,
                                                                                    child: AnotarResultadosWidget(
                                                                                      partidoId: SupabaseDashboardGroup.getPartidosUserCall.apiPartidoId(
                                                                                        listViewGetPartidosUserResponse.jsonBody,
                                                                                      )![historialViewIndex],
                                                                                      aa: (SupabaseDashboardGroup.getPartidosUserCall.apiNombreA(
                                                                                        listViewGetPartidosUserResponse.jsonBody,
                                                                                      )![historialViewIndex])
                                                                                          .toString(),
                                                                                      bb: (SupabaseDashboardGroup.getPartidosUserCall.apiNombreB(
                                                                                        listViewGetPartidosUserResponse.jsonBody,
                                                                                      )![historialViewIndex])
                                                                                          .toString(),
                                                                                      cc: (SupabaseDashboardGroup.getPartidosUserCall.apiNombreC(
                                                                                        listViewGetPartidosUserResponse.jsonBody,
                                                                                      )![historialViewIndex])
                                                                                          .toString(),
                                                                                      dd: (SupabaseDashboardGroup.getPartidosUserCall.apiNombreD(
                                                                                        listViewGetPartidosUserResponse.jsonBody,
                                                                                      )![historialViewIndex])
                                                                                          .toString(),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            setState(() {}));
                                                                      },
                                                                      text:
                                                                          'Anotar Resultado',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        height:
                                                                            30.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          if (((SupabaseDashboardGroup
                                                                      .getPartidosUserCall
                                                                      .apiResultado(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex]) !=
                                                                  null) &&
                                                              (functions
                                                                      .numSets(valueOrDefault<String>(
                                                                        (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                          listViewGetPartidosUserResponse
                                                                              .jsonBody,
                                                                        )?[historialViewIndex])
                                                                            ?.toString(),
                                                                        '5',
                                                                      ))
                                                                      .toString() ==
                                                                  '2') &&
                                                              functions.isMatchComplete(
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidA(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidB(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidC(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString(),
                                                                  (SupabaseDashboardGroup.getPartidosUserCall.apiUidD(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString()))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        35.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        functions.returnResultado(
                                                                            valueOrDefault<String>(
                                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                                listViewGetPartidosUserResponse.jsonBody,
                                                                              )?[historialViewIndex])
                                                                                  ?.toString(),
                                                                              '5',
                                                                            ),
                                                                            1),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          40.0,
                                                                      height:
                                                                          35.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          functions.returnResultado(
                                                                              valueOrDefault<String>(
                                                                                (SupabaseDashboardGroup.getPartidosUserCall.apiResultado(
                                                                                  listViewGetPartidosUserResponse.jsonBody,
                                                                                )?[historialViewIndex])
                                                                                    ?.toString(),
                                                                                '5',
                                                                              ),
                                                                              2),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Roboto',
                                                                                letterSpacing: 0.0,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          if (!functions.isMatchComplete(
                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiUidA(
                                                                listViewGetPartidosUserResponse
                                                                    .jsonBody,
                                                              )?[historialViewIndex])
                                                                  ?.toString(),
                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiUidB(
                                                                listViewGetPartidosUserResponse
                                                                    .jsonBody,
                                                              )?[historialViewIndex])
                                                                  ?.toString(),
                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiUidC(
                                                                listViewGetPartidosUserResponse
                                                                    .jsonBody,
                                                              )?[historialViewIndex])
                                                                  ?.toString(),
                                                              (SupabaseDashboardGroup.getPartidosUserCall.apiUidD(
                                                                listViewGetPartidosUserResponse
                                                                    .jsonBody,
                                                              )?[historialViewIndex])
                                                                  ?.toString()))
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        180.0,
                                                                    height:
                                                                        30.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                        width:
                                                                            2.0,
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        'Partido no completado',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w300,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        5.0)),
                                                              ),
                                                            ),
                                                          if (functions
                                                                  .is2win((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiResultado(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString())
                                                                  .toString() ==
                                                              '2')
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.99,
                                                                            -0.82),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .crown,
                                                                      color: Color(
                                                                          0xFFFFD906),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.99,
                                                                            -0.9),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .crown,
                                                                      color: Color(
                                                                          0xFFFFD906),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          if (functions
                                                                  .is2win((SupabaseDashboardGroup
                                                                          .getPartidosUserCall
                                                                          .apiResultado(
                                                                    listViewGetPartidosUserResponse
                                                                        .jsonBody,
                                                                  )?[historialViewIndex])
                                                                      ?.toString())
                                                                  .toString() ==
                                                              '1')
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.99,
                                                                            -0.8),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .crown,
                                                                      color: Color(
                                                                          0xFFFFD906),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -0.99,
                                                                            -0.9),
                                                                    child:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .crown,
                                                                      color: Color(
                                                                          0xFFFFD906),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
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
                                      ).animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
