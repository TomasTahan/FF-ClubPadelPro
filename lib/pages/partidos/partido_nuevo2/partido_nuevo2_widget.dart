import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/componentes/loading/horas_partido_nuevo/horas_partido_nuevo_widget.dart';
import '/componentes/partidos/confirmar_partido/confirmar_partido_widget.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'partido_nuevo2_model.dart';
export 'partido_nuevo2_model.dart';

class PartidoNuevo2Widget extends StatefulWidget {
  const PartidoNuevo2Widget({super.key});

  @override
  State<PartidoNuevo2Widget> createState() => _PartidoNuevo2WidgetState();
}

class _PartidoNuevo2WidgetState extends State<PartidoNuevo2Widget> {
  late PartidoNuevo2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidoNuevo2Model());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.diaSeleccionado =
          functions.getNextDays(getCurrentTimestamp).first.fechaCompleta;
      _model.horaSeleccionada = null;
      _model.isLoading = true;
      setState(() {});
      _model.apiGrid1 =
          await SupabaseDashboardGroup.funcCanchasDispGenericoCall.call(
        clubId: FFAppState().Club.clubId,
        fecha: _model.diaSeleccionado,
        soloTechadas: false,
      );

      if ((_model.apiGrid1?.succeeded ?? true)) {
        _model.isLoading = false;
        _model.state = 1;
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
                  context.safePop();
                },
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-0.1, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Nuevo Partido',
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
        body: SingleChildScrollView(
          child: Column(
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
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: listDaysw.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(width: 15.0),
                              itemBuilder: (context, listDayswIndex) {
                                final listDayswItem = listDaysw[listDayswIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.diaSeleccionado =
                                        listDayswItem.fechaCompleta;
                                    _model.isLoading = true;
                                    _model.state = 2;
                                    setState(() {});
                                    _model.apiGrid2 =
                                        await SupabaseDashboardGroup
                                            .funcCanchasDispGenericoCall
                                            .call(
                                      clubId: FFAppState().Club.clubId,
                                      fecha: _model.diaSeleccionado,
                                      soloTechadas: _model.isTechada,
                                    );

                                    if ((_model.apiGrid2?.succeeded ?? true)) {
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
                                              _model.diaSeleccionado
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
                                                color: listDayswItem
                                                            .fechaCompleta ==
                                                        _model.diaSeleccionado
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
                                                color: listDayswItem
                                                            .fechaCompleta ==
                                                        _model.diaSeleccionado
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
                                                color: listDayswItem
                                                            .fechaCompleta ==
                                                        _model.diaSeleccionado
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
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
              if ((_model.state == 1) && !_model.isLoading)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final grid1 =
                          SupabaseDashboardGroup.funcCanchasDispGenericoCall
                                  .inicio(
                                    (_model.apiGrid1?.jsonBody ?? ''),
                                  )
                                  ?.toList() ??
                              [];
                      if (grid1.isEmpty) {
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
                        itemCount: grid1.length,
                        itemBuilder: (context, grid1Index) {
                          final grid1Item = grid1[grid1Index];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.horaSeleccionada = valueOrDefault<String>(
                                SupabaseDashboardGroup
                                    .funcCanchasDispGenericoCall
                                    .inicio(
                                  (_model.apiGrid1?.jsonBody ?? ''),
                                )?[grid1Index],
                                'err',
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: _model.horaSeleccionada ==
                                        (SupabaseDashboardGroup
                                            .funcCanchasDispGenericoCall
                                            .inicio(
                                          (_model.apiGrid1?.jsonBody ?? ''),
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
                                    SupabaseDashboardGroup
                                        .funcCanchasDispGenericoCall
                                        .inicio(
                                      (_model.apiGrid1?.jsonBody ?? ''),
                                    )?[grid1Index],
                                    'err',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.horaSeleccionada ==
                                                (SupabaseDashboardGroup
                                                    .funcCanchasDispGenericoCall
                                                    .inicio(
                                                  (_model.apiGrid1?.jsonBody ??
                                                      ''),
                                                )?[grid1Index])
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
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
              if ((_model.state == 2) && !_model.isLoading)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final grid2 =
                          SupabaseDashboardGroup.funcCanchasDispGenericoCall
                                  .inicio(
                                    (_model.apiGrid2?.jsonBody ?? ''),
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
                              _model.horaSeleccionada = valueOrDefault<String>(
                                SupabaseDashboardGroup
                                    .funcCanchasDispGenericoCall
                                    .inicio(
                                  (_model.apiGrid2?.jsonBody ?? ''),
                                )?[grid2Index],
                                'err',
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: _model.horaSeleccionada ==
                                        valueOrDefault<String>(
                                          SupabaseDashboardGroup
                                              .funcCanchasDispGenericoCall
                                              .inicio(
                                            (_model.apiGrid2?.jsonBody ?? ''),
                                          )?[grid2Index],
                                          'err',
                                        )
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
                                    SupabaseDashboardGroup
                                        .funcCanchasDispGenericoCall
                                        .inicio(
                                      (_model.apiGrid2?.jsonBody ?? ''),
                                    )?[grid2Index],
                                    'err',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.horaSeleccionada ==
                                                (SupabaseDashboardGroup
                                                    .funcCanchasDispGenericoCall
                                                    .inicio(
                                                  (_model.apiGrid2?.jsonBody ??
                                                      ''),
                                                )?[grid2Index])
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
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
              if ((_model.state == 3) && !_model.isLoading)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final grid3 =
                          SupabaseDashboardGroup.funcCanchasDispGenericoCall
                                  .inicio(
                                    (_model.apiGrid3?.jsonBody ?? ''),
                                  )
                                  ?.toList() ??
                              [];
                      if (grid3.isEmpty) {
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
                        itemCount: grid3.length,
                        itemBuilder: (context, grid3Index) {
                          final grid3Item = grid3[grid3Index];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.horaSeleccionada = valueOrDefault<String>(
                                SupabaseDashboardGroup
                                    .funcCanchasDispGenericoCall
                                    .inicio(
                                  (_model.apiGrid3?.jsonBody ?? ''),
                                )?[grid3Index],
                                'err',
                              );
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: _model.horaSeleccionada ==
                                        valueOrDefault<String>(
                                          SupabaseDashboardGroup
                                              .funcCanchasDispGenericoCall
                                              .inicio(
                                            (_model.apiGrid3?.jsonBody ?? ''),
                                          )?[grid3Index],
                                          'err',
                                        )
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
                                    SupabaseDashboardGroup
                                        .funcCanchasDispGenericoCall
                                        .inicio(
                                      (_model.apiGrid3?.jsonBody ?? ''),
                                    )?[grid3Index],
                                    'err',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.horaSeleccionada ==
                                                (SupabaseDashboardGroup
                                                    .funcCanchasDispGenericoCall
                                                    .inicio(
                                                  (_model.apiGrid3?.jsonBody ??
                                                      ''),
                                                )?[grid3Index])
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
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
              if ((_model.state == 4) && !_model.isLoading)
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final grid4 =
                          SupabaseDashboardGroup.funcCanchasDispGenericoCall
                                  .inicio(
                                    (_model.apiGrid4?.jsonBody ?? ''),
                                  )
                                  ?.toList() ??
                              [];
                      if (grid4.isEmpty) {
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
                        itemCount: grid4.length,
                        itemBuilder: (context, grid4Index) {
                          final grid4Item = grid4[grid4Index];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.horaSeleccionada = SupabaseDashboardGroup
                                  .funcCanchasDispGenericoCall
                                  .inicio(
                                (_model.apiGrid4?.jsonBody ?? ''),
                              )?[grid4Index];
                              setState(() {});
                            },
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: _model.horaSeleccionada ==
                                        (SupabaseDashboardGroup
                                            .funcCanchasDispGenericoCall
                                            .inicio(
                                          (_model.apiGrid4?.jsonBody ?? ''),
                                        )?[grid4Index])
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
                                    SupabaseDashboardGroup
                                        .funcCanchasDispGenericoCall
                                        .inicio(
                                      (_model.apiGrid4?.jsonBody ?? ''),
                                    )?[grid4Index],
                                    'err',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: _model.horaSeleccionada ==
                                                (SupabaseDashboardGroup
                                                    .funcCanchasDispGenericoCall
                                                    .inicio(
                                                  (_model.apiGrid4?.jsonBody ??
                                                      ''),
                                                )?[grid4Index])
                                            ? Colors.white
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
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
              if (_model.isLoading)
                Container(
                  width: double.infinity,
                  height: 190.0,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: wrapWithModel(
                      model: _model.horasPartidoNuevoModel,
                      updateCallback: () => setState(() {}),
                      child: HorasPartidoNuevoWidget(),
                    ),
                  ),
                ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 0.0, 0.0),
                  child: Text(
                    'Cancha',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 2.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isTechada = false;
                                      _model.isLoading = true;
                                      _model.state = 3;
                                      setState(() {});
                                      _model.apiGrid3 =
                                          await SupabaseDashboardGroup
                                              .funcCanchasDispGenericoCall
                                              .call(
                                        clubId: FFAppState().Club.clubId,
                                        fecha: _model.diaSeleccionado,
                                        soloTechadas: _model.isTechada,
                                      );

                                      if ((_model.apiGrid3?.succeeded ??
                                          true)) {
                                        _model.isLoading = false;
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isTechada == false
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Aire Libre',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isTechada == false
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isTechada = true;
                                      _model.isLoading = true;
                                      _model.state = 4;
                                      setState(() {});
                                      _model.apiGrid4 =
                                          await SupabaseDashboardGroup
                                              .funcCanchasDispGenericoCall
                                              .call(
                                        clubId: FFAppState().Club.clubId,
                                        fecha: _model.diaSeleccionado,
                                        soloTechadas: true,
                                      );

                                      if ((_model.apiGrid4?.succeeded ??
                                          true)) {
                                        _model.isLoading = false;
                                        setState(() {});
                                      }

                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isTechada == true
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Techada',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isTechada == true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 2.0)),
                            ),
                          ],
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
                    'Tipo de partido',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 2.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isCompe = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isCompe == true
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Competitivo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isCompe == true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isCompe = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isCompe == false
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Amistoso',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isCompe == false
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 2.0)),
                            ),
                          ],
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
                    'Visibilidad',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Ubuntu',
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: 100.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 2.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isPublico = true;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isPublico == true
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(10.0),
                                          topRight: Radius.circular(0.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Publico',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isPublico == true
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.isPublico = false;
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 100.0,
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                        color: _model.isPublico == false
                                            ? FFAppState().Club.colorTrue
                                            : Color(0x00000000),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(10.0),
                                          topLeft: Radius.circular(0.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Privado',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color: _model.isPublico == false
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 2.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 0.0),
                child: Text(
                  '* Si es privado, tendrás que compartir el partido para que se puedan unir. Publico quedará visible para todos *',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (context) => FFButtonWidget(
                        onPressed: ((_model.horaSeleccionada == null ||
                                    _model.horaSeleccionada == '') ||
                                (_model.isCompe == null) ||
                                (_model.isPublico == null))
                            ? null
                            : () async {
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
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.9,
                                            child: ConfirmarPartidoWidget(
                                              horaInicio:
                                                  _model.horaSeleccionada!,
                                              fecha: _model.diaSeleccionado!,
                                              isCompe: _model.isCompe!,
                                              isPublico: _model.isPublico!,
                                              isTechada: _model.isTechada,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => setState(() {}));
                              },
                        text: 'Crear Partido',
                        options: FFButtonOptions(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
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
                          borderRadius: BorderRadius.circular(20.0),
                          disabledColor: FFAppState().Club.colorTrue,
                          disabledTextColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Text(
                        '* Ten en cuenta que la reserva se hará\nuna vez se haga el primer pago *',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Roboto',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
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
    );
  }
}
