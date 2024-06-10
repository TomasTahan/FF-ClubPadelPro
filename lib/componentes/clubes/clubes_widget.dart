import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'clubes_model.dart';
export 'clubes_model.dart';

class ClubesWidget extends StatefulWidget {
  const ClubesWidget({super.key});

  @override
  State<ClubesWidget> createState() => _ClubesWidgetState();
}

class _ClubesWidgetState extends State<ClubesWidget> {
  late ClubesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ClubesModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
      height: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Container(
                      width: 60.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Seleccióna un club',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
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
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.search,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      const Duration(milliseconds: 500),
                                      () async {
                                        _model.isLoading = true;
                                        setState(() {});
                                        _model.apiResultl5y =
                                            await SupabaseDashboardGroup
                                                .searchClubesCall
                                                .call(
                                          serachParam: _model.textController.text ==
                                                      ''
                                              ? 'vacio'
                                              : _model.textController.text,
                                        );
                                        if ((_model.apiResultl5y?.succeeded ??
                                            true)) {
                                          _model.isLoading = false;
                                          setState(() {});
                                          _model.isVisible = true;
                                          setState(() {});
                                        } else {
                                          _model.isLoading = false;
                                          setState(() {});
                                          _model.isVisible = true;
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
                                      hintText: 'Escribe el nombre del club.',
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
                                          const EdgeInsetsDirectional.fromSTEB(
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
              if (FFAppState().ClubesFavoritos.isNotEmpty)
                Builder(
                  builder: (context) {
                    final viewClubesFav = FFAppState().ClubesFavoritos.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(viewClubesFav.length,
                            (viewClubesFavIndex) {
                          final viewClubesFavItem =
                              viewClubesFav[viewClubesFavIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().Club = ClubStruct(
                                      clubId: viewClubesFavItem.clubId,
                                      nombre: viewClubesFavItem.nombre,
                                      ubicacion: viewClubesFavItem.ubicacion,
                                      colorTrue: viewClubesFavItem.colorTrue,
                                      colorSecundario:
                                          viewClubesFavItem.colorSecundario,
                                      merchantCode:
                                          viewClubesFavItem.merchantCode,
                                      merchantToken:
                                          viewClubesFavItem.merchantToken,
                                    );
                                    _model.updatePage(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: viewClubesFavItem.colorTrue,
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            child: Text(
                                              viewClubesFavItem.nombre,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  FFAppState().removeAtIndexFromClubesFavoritos(
                                      viewClubesFavIndex);
                                  setState(() {});
                                },
                                child: Container(
                                  width: 50.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: const Align(
                                    alignment: AlignmentDirectional(1.0, 0.0),
                                    child: Icon(
                                      Icons.star_rate,
                                      color: Color(0xFFFFD302),
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }).divide(const SizedBox(height: 12.0)),
                      ),
                    );
                  },
                ),
              if (!_model.isLoading && _model.isVisible)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                  child: Builder(
                    builder: (context) {
                      final viewSearch = SupabaseDashboardGroup.searchClubesCall
                              .clubId(
                                (_model.apiResultl5y?.jsonBody ?? ''),
                              )
                              ?.toList() ??
                          [];
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: List.generate(viewSearch.length,
                              (viewSearchIndex) {
                            final viewSearchItem = viewSearch[viewSearchIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().Club = ClubStruct(
                                        clubId: SupabaseDashboardGroup
                                            .searchClubesCall
                                            .clubId(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )?[viewSearchIndex],
                                        nombre: SupabaseDashboardGroup
                                            .searchClubesCall
                                            .nombre(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )?[viewSearchIndex],
                                        ubicacion: SupabaseDashboardGroup
                                            .searchClubesCall
                                            .ubicacion(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )?[viewSearchIndex],
                                        colorTrue: colorFromCssString(
                                          SupabaseDashboardGroup
                                              .searchClubesCall
                                              .colorPrincipal(
                                            (_model.apiResultl5y?.jsonBody ??
                                                ''),
                                          )![viewSearchIndex],
                                          defaultColor: Colors.black,
                                        ),
                                        colorSecundario: colorFromCssString(
                                          SupabaseDashboardGroup
                                              .searchClubesCall
                                              .colorSecundario(
                                            (_model.apiResultl5y?.jsonBody ??
                                                ''),
                                          )![viewSearchIndex],
                                          defaultColor: Colors.black,
                                        ),
                                        merchantCode: SupabaseDashboardGroup
                                            .searchClubesCall
                                            .merchantCode(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )?[viewSearchIndex],
                                        merchantToken: SupabaseDashboardGroup
                                            .searchClubesCall
                                            .merchantToken(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )?[viewSearchIndex],
                                      );
                                      _model.updatePage(() {});
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            color: colorFromCssString(
                                              SupabaseDashboardGroup
                                                  .searchClubesCall
                                                  .colorPrincipal(
                                                (_model.apiResultl5y
                                                        ?.jsonBody ??
                                                    ''),
                                              )![viewSearchIndex],
                                              defaultColor: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  SupabaseDashboardGroup
                                                      .searchClubesCall
                                                      .nombre(
                                                    (_model.apiResultl5y
                                                            ?.jsonBody ??
                                                        ''),
                                                  )?[viewSearchIndex],
                                                  'err',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 15.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      _model.textController?.clear();
                                    });
                                    FFAppState().addToClubesFavoritos(
                                        ClubesFavoritosStruct(
                                      clubId: SupabaseDashboardGroup
                                          .searchClubesCall
                                          .clubId(
                                        (_model.apiResultl5y?.jsonBody ?? ''),
                                      )?[viewSearchIndex],
                                      nombre: SupabaseDashboardGroup
                                          .searchClubesCall
                                          .nombre(
                                        (_model.apiResultl5y?.jsonBody ?? ''),
                                      )?[viewSearchIndex],
                                      ubicacion: SupabaseDashboardGroup
                                          .searchClubesCall
                                          .ubicacion(
                                        (_model.apiResultl5y?.jsonBody ?? ''),
                                      )?[viewSearchIndex],
                                      colorTrue: colorFromCssString(
                                        SupabaseDashboardGroup.searchClubesCall
                                            .colorPrincipal(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )![viewSearchIndex],
                                        defaultColor: Colors.black,
                                      ),
                                      colorSecundario: colorFromCssString(
                                        SupabaseDashboardGroup.searchClubesCall
                                            .colorSecundario(
                                          (_model.apiResultl5y?.jsonBody ?? ''),
                                        )![viewSearchIndex],
                                        defaultColor: Colors.black,
                                      ),
                                      merchantCode: SupabaseDashboardGroup
                                          .searchClubesCall
                                          .merchantCode(
                                        (_model.apiResultl5y?.jsonBody ?? ''),
                                      )?[viewSearchIndex],
                                      merchantToken: SupabaseDashboardGroup
                                          .searchClubesCall
                                          .merchantToken(
                                        (_model.apiResultl5y?.jsonBody ?? ''),
                                      )?[viewSearchIndex],
                                    ));
                                    setState(() {});
                                    _model.isVisible = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 50.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: const Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child: Icon(
                                        Icons.star_border,
                                        color: Color(0xFFFFD302),
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).divide(const SizedBox(height: 12.0)),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
