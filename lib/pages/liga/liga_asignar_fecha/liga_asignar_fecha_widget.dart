import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'liga_asignar_fecha_model.dart';
export 'liga_asignar_fecha_model.dart';

class LigaAsignarFechaWidget extends StatefulWidget {
  const LigaAsignarFechaWidget({
    super.key,
    required this.partidoId,
    required this.anotarResultados,
  });

  final int? partidoId;
  final bool? anotarResultados;

  @override
  State<LigaAsignarFechaWidget> createState() => _LigaAsignarFechaWidgetState();
}

class _LigaAsignarFechaWidgetState extends State<LigaAsignarFechaWidget> {
  late LigaAsignarFechaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LigaAsignarFechaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.fecha =
          functions.getNextDays(getCurrentTimestamp).first.fechaCompleta;
      _model.hora = null;
      _model.isLoading = true;
      _model.is1 = true;
      setState(() {});
      _model.apiResultvum =
          await SupabaseDashboardGroup.funcCanchasDispoCall.call(
        clubId: FFAppState().Club.clubId,
        fecha: _model.fecha,
      );

      if ((_model.apiResultvum?.succeeded ?? true)) {
        _model.isLoading = false;
        setState(() {});
      }
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
                  context.pushNamed(
                    'LigaPartido',
                    queryParameters: {
                      'partidoId': serializeParam(
                        widget!.partidoId,
                        ParamType.int,
                      ),
                      'anotarResultados': serializeParam(
                        widget!.anotarResultados,
                        ParamType.bool,
                      ),
                    }.withoutNulls,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.rightToLeft,
                      ),
                    },
                  );
                },
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-0.1, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Asignar Fecha',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
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
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final listDaysw = functions
                              .getNextDays(getCurrentTimestamp)
                              .toList();

                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: listDaysw.length,
                            separatorBuilder: (_, __) => SizedBox(width: 15.0),
                            itemBuilder: (context, listDayswIndex) {
                              final listDayswItem = listDaysw[listDayswIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.fecha = listDayswItem.fechaCompleta;
                                  _model.isLoading = true;
                                  _model.is1 = false;
                                  setState(() {});
                                  _model.apiResult3ca =
                                      await SupabaseDashboardGroup
                                          .funcCanchasDispoCall
                                          .call(
                                    clubId: FFAppState().Club.clubId,
                                    fecha: _model.fecha,
                                  );

                                  if ((_model.apiResult3ca?.succeeded ??
                                      true)) {
                                    _model.isLoading = false;
                                    setState(() {});
                                  }

                                  setState(() {});
                                },
                                child: Container(
                                  width: 75.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: listDayswItem.fechaCompleta ==
                                            _model.fecha
                                        ? FFAppState().Club.colorTrue
                                        : FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        listDayswItem.diaAbreviado,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                      Text(
                                        listDayswItem.diaNumero.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Text(
                                        listDayswItem.mesAbreviado,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
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
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 0.0, 0.0),
                child: Text(
                  'Seleccióna la hora',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Ubuntu',
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            if (!_model.isLoading! && _model.is1)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final grid1 = SupabaseDashboardGroup.funcCanchasDispoCall
                            .apiInicio(
                              (_model.apiResultvum?.jsonBody ?? ''),
                            )
                            ?.toList() ??
                        [];

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 2.4,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: grid1.length,
                      itemBuilder: (context, grid1Index) {
                        final grid1Item = grid1[grid1Index];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.hora = valueOrDefault<String>(
                              SupabaseDashboardGroup.funcCanchasDispoCall
                                  .apiInicio(
                                (_model.apiResultvum?.jsonBody ?? ''),
                              )?[grid1Index],
                              'error',
                            );
                            setState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.hora ==
                                      (SupabaseDashboardGroup
                                          .funcCanchasDispoCall
                                          .apiInicio(
                                        (_model.apiResultvum?.jsonBody ?? ''),
                                      )?[grid1Index])
                                  ? FFAppState().Club.colorTrue
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                  SupabaseDashboardGroup.funcCanchasDispoCall
                                      .apiInicio(
                                    (_model.apiResultvum?.jsonBody ?? ''),
                                  )?[grid1Index],
                                  'error',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
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
            if (!_model.isLoading! && !_model.is1)
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final grid2 = SupabaseDashboardGroup.funcCanchasDispoCall
                            .apiInicio(
                              (_model.apiResult3ca?.jsonBody ?? ''),
                            )
                            ?.toList() ??
                        [];
                    if (grid2.isEmpty) {
                      return Center(
                        child: Container(
                          height: 160.0,
                          child: NoHorasWidget(),
                        ),
                      );
                    }

                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 2.4,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: grid2.length,
                      itemBuilder: (context, grid2Index) {
                        final grid2Item = grid2[grid2Index];
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.hora = valueOrDefault<String>(
                              SupabaseDashboardGroup.funcCanchasDispoCall
                                  .apiInicio(
                                (_model.apiResult3ca?.jsonBody ?? ''),
                              )?[grid2Index],
                              'error',
                            );
                            setState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.hora ==
                                      (SupabaseDashboardGroup
                                          .funcCanchasDispoCall
                                          .apiInicio(
                                        (_model.apiResult3ca?.jsonBody ?? ''),
                                      )?[grid2Index])
                                  ? FFAppState().Club.colorTrue
                                  : FlutterFlowTheme.of(context)
                                      .secondaryBackground,
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
                                  SupabaseDashboardGroup.funcCanchasDispoCall
                                      .apiInicio(
                                    (_model.apiResult3ca?.jsonBody ?? ''),
                                  )?[grid2Index],
                                  'error',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
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
            if (_model.isLoading ?? true)
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(),
                child: Lottie.network(
                  'https://lottie.host/981a0767-799b-4e64-82b6-bce000e3099e/JLTy2zBIu0.json',
                  width: 150.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: (_model.hora == null || _model.hora == '')
                    ? null
                    : () async {
                        await LigaPartidosTable().update(
                          data: {
                            'fecha': supaSerialize<DateTime>(
                                functions.convertDate(_model.fecha!)),
                            'inicio': _model.hora,
                            'fin': functions.plusHour(_model.hora!),
                          },
                          matchingRows: (rows) => rows.eq(
                            'partidoId',
                            widget!.partidoId,
                          ),
                        );
                        context.safePop();

                        setState(() {});
                      },
                text: 'Confirmar',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FFAppState().Club.colorTrue,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  disabledColor: FFAppState().Club.colorTrue,
                  disabledTextColor: FlutterFlowTheme.of(context).secondaryText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
