import '/backend/api_requests/api_calls.dart';
import '/componentes/partidos/confirmar_partido/confirmar_partido_widget.dart';
import '/componentes/partidos/no_horas/no_horas_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'partido_nuevo_model.dart';
export 'partido_nuevo_model.dart';

class PartidoNuevoWidget extends StatefulWidget {
  const PartidoNuevoWidget({super.key});

  @override
  State<PartidoNuevoWidget> createState() => _PartidoNuevoWidgetState();
}

class _PartidoNuevoWidgetState extends State<PartidoNuevoWidget> {
  late PartidoNuevoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartidoNuevoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.diaSeleccionado =
          functions.getNextDays(getCurrentTimestamp).first.fechaCompleta;
      _model.horaSeleccionada = null;
      _model.loading = true;
      _model.is1 = false;
      setState(() {});
      _model.apiResultbvf =
          await SupabaseDashboardGroup.funcCanchasDispoCall.call(
        clubId: 15,
        fecha: _model.diaSeleccionado,
      );
      if ((_model.apiResultbvf?.succeeded ?? true)) {
        _model.loading = false;
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
                  alignment: const AlignmentDirectional(-0.1, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Nuevo Partido',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
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
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final listDaysw = functions
                              .getNextDays(getCurrentTimestamp)
                              .toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: listDaysw.length,
                            separatorBuilder: (_, __) => const SizedBox(width: 15.0),
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
                                  _model.loading = true;
                                  _model.is1 = true;
                                  setState(() {});
                                  _model.apiResult3ca =
                                      await SupabaseDashboardGroup
                                          .funcCanchasDispoCall
                                          .call(
                                    clubId: 15,
                                    fecha: _model.diaSeleccionado,
                                  );
                                  if ((_model.apiResult3ca?.succeeded ??
                                      true)) {
                                    _model.loading = false;
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
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 0.0, 0.0),
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
            if (!_model.loading && _model.is1)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final grid1 = SupabaseDashboardGroup.funcCanchasDispoCall
                            .apiInicio(
                              (_model.apiResult3ca?.jsonBody ?? ''),
                            )
                            ?.toList() ??
                        [];
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            _model.horaSeleccionada = SupabaseDashboardGroup
                                .funcCanchasDispoCall
                                .apiInicio(
                              (_model.apiResult3ca?.jsonBody ?? ''),
                            )?[grid1Index];
                            setState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.horaSeleccionada ==
                                      (SupabaseDashboardGroup
                                          .funcCanchasDispoCall
                                          .apiInicio(
                                        (_model.apiResult3ca?.jsonBody ?? ''),
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
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  SupabaseDashboardGroup.funcCanchasDispoCall
                                      .apiInicio(
                                    (_model.apiResult3ca?.jsonBody ?? ''),
                                  )?[grid1Index],
                                  '0',
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
            if (!_model.loading && !_model.is1)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final grid2 = SupabaseDashboardGroup.funcCanchasDispoCall
                            .apiInicio(
                              (_model.apiResultbvf?.jsonBody ?? ''),
                            )
                            ?.toList() ??
                        [];
                    if (grid2.isEmpty) {
                      return const Center(
                        child: SizedBox(
                          height: 160.0,
                          child: NoHorasWidget(),
                        ),
                      );
                    }
                    return GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            _model.horaSeleccionada = SupabaseDashboardGroup
                                .funcCanchasDispoCall
                                .apiInicio(
                              (_model.apiResultbvf?.jsonBody ?? ''),
                            )?[grid2Index];
                            setState(() {});
                          },
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: _model.horaSeleccionada ==
                                      valueOrDefault<String>(
                                        SupabaseDashboardGroup
                                            .funcCanchasDispoCall
                                            .apiInicio(
                                          (_model.apiResultbvf?.jsonBody ?? ''),
                                        )?[grid2Index],
                                        'a',
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
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  SupabaseDashboardGroup.funcCanchasDispoCall
                                      .apiInicio(
                                    (_model.apiResultbvf?.jsonBody ?? ''),
                                  )?[grid2Index],
                                  'q',
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
            if (_model.loading)
              Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(),
                child: Lottie.network(
                  'https://lottie.host/981a0767-799b-4e64-82b6-bce000e3099e/JLTy2zBIu0.json',
                  width: 150.0,
                  height: 130.0,
                  fit: BoxFit.cover,
                  animate: true,
                ),
              ),
            Align(
              alignment: const AlignmentDirectional(-1.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15.0, 40.0, 0.0, 0.0),
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
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2.0,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
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
                                          : const Color(0x00000000),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(0.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Competitivo',
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
                                          : const Color(0x00000000),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(10.0),
                                        topLeft: Radius.circular(0.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        'Amistoso',
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
                              ),
                            ].divide(const SizedBox(width: 2.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) => Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: ((_model.horaSeleccionada == null ||
                              _model.horaSeleccionada == '') ||
                          (_model.isCompe == null))
                      ? null
                      : () async {
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.9,
                                      child: ConfirmarPartidoWidget(
                                        horaInicio: _model.horaSeleccionada!,
                                        fecha: _model.diaSeleccionado!,
                                        isCompe: _model.isCompe!,
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FFAppState().Club.colorTrue,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Roboto',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
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
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
              child: Text(
                '* Ten en cuenta que la reserva se hará\nuna vez confirmado el partido *',
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
    );
  }
}
