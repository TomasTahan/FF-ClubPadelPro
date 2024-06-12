import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'payment_creditos_model.dart';
export 'payment_creditos_model.dart';

class PaymentCreditosWidget extends StatefulWidget {
  const PaymentCreditosWidget({
    super.key,
    required this.packId,
    required this.precio,
  });

  final int? packId;
  final double? precio;

  @override
  State<PaymentCreditosWidget> createState() => _PaymentCreditosWidgetState();
}

class _PaymentCreditosWidgetState extends State<PaymentCreditosWidget> {
  late PaymentCreditosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentCreditosModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = true;
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 4.0,
            color: Color(0x25090F13),
            offset: Offset(
              0.0,
              2.0,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          if (_model.estado == 1)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Checkout',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Text(
                                  'Confirma que la información debajo es correcta.',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
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
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Total',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 36.0,
                                    icon: Icon(
                                      Icons.info_outlined,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 18.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                                ],
                              ),
                              Text(
                                formatNumber(
                                  widget.precio,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.commaDecimal,
                                  currency: '',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Open Sans',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(21.0, 0.0, 0.0, 10.0),
                    child: Text(
                      'Métodos de pago',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  if (false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.metodoPago = 'Tarjeta';
                              setState(() {});
                            },
                            child: Container(
                              width: 160.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: valueOrDefault<Color>(
                                    _model.metodoPago == 'Tarjeta'
                                        ? FFAppState().Club.colorTrue
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  width: 4.0,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Pago con tarjeta',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Icon(
                                        Icons.credit_card,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 1.0),
                                        child: Text(
                                          'Instantaneo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.metodoPago = 'Transferencia';
                                setState(() {});
                              },
                              child: Container(
                                width: 160.0,
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: valueOrDefault<Color>(
                                      _model.metodoPago == 'Transferencia'
                                          ? FFAppState().Club.colorTrue
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      FlutterFlowTheme.of(context).alternate,
                                    ),
                                    width: 4.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Transferencia',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.send,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 28.0,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Text(
                                            '2 min. aprox.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FutureBuilder<List<VistaCustomerCardRow>>(
                            future: VistaCustomerCardTable().queryRows(
                              queryFn: (q) => q.eq(
                                'userId',
                                currentUserUid,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<VistaCustomerCardRow>
                                  rowVistaCustomerCardRowList = snapshot.data!;
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    rowVistaCustomerCardRowList.length,
                                    (rowIndex) {
                                  final rowVistaCustomerCardRow =
                                      rowVistaCustomerCardRowList[rowIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        _model.customerId =
                                            rowVistaCustomerCardRow.customerId;
                                        _model.metodoPago = 'Tarjeta';
                                        _model.last4 =
                                            rowVistaCustomerCardRow.last4;
                                        _model.csv =
                                            rowVistaCustomerCardRow.cvv;
                                        _model.cardId =
                                            rowVistaCustomerCardRow.cardId;
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 130.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Color(0xFF0BB3F7),
                                              Color(0xFF0B67F7)
                                            ],
                                            stops: [0.2, 0.9],
                                            begin:
                                                AlignmentDirectional(-1.0, 0.0),
                                            end: AlignmentDirectional(1.0, 0),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 10.0, 0.0, 0.0),
                                                child: Text(
                                                  '**** **** **** ${rowVistaCustomerCardRow.last4}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (rowVistaCustomerCardRow
                                                    .cardType ==
                                                'Mastercard')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.85, 0.85),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/master-sin-fondo.png',
                                                    width: 33.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            if (rowVistaCustomerCardRow
                                                    .cardType ==
                                                'Visa')
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.85, 0.84),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.asset(
                                                    'assets/images/visa-sin-fondo.png',
                                                    width: 35.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            if (rowVistaCustomerCardRow.last4 ==
                                                _model.last4)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.88, -0.8),
                                                child: Container(
                                                  width: 12.0,
                                                  height: 12.0,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF0A31FF),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            },
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              _model.metodoPago = 'Transferencia';
                              _model.last4 = null;
                              setState(() {});
                            },
                            child: Container(
                              width: 130.0,
                              height: 90.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFF70BBE),
                                    Color(0xFFED3E7C)
                                  ],
                                  stops: [0.2, 0.8],
                                  begin: AlignmentDirectional(-1.0, 0.0),
                                  end: AlignmentDirectional(1.0, 0),
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 10.0),
                                      child: Text(
                                        '2 min. aprox.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w300,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 0.0, 0.0),
                                    child: Text(
                                      'Transferencia',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  if (_model.metodoPago == 'Transferencia')
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.88, -0.8),
                                      child: Container(
                                        width: 12.0,
                                        height: 12.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFA70AFF),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.metodoPago = 'Transferencia';
                                setState(() {});
                                _model.customerId = null;
                                setState(() {});
                              },
                              child: Container(
                                width: 130.0,
                                height: 90.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 10.0),
                                        child: Text(
                                          'Instantaneo',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Icon(
                                        Icons.add_card_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Añadir Tarjeta',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 15.0)),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 20.0),
                            child: FFButtonWidget(
                              onPressed: (_model.metodoPago == null ||
                                      _model.metodoPago == '')
                                  ? null
                                  : () async {
                                      var _shouldSetState = false;
                                      if (_model.metodoPago == 'Tarjeta') {
                                        if (_model.csv != null) {
                                          _model.apiResult4c1 =
                                              await MercadoPagoGroup
                                                  .tokenCardIdCall
                                                  .call(
                                            cardId: _model.cardId?.toString(),
                                            securityCode:
                                                _model.csv?.toString(),
                                          );
                                          _shouldSetState = true;
                                          if ((_model.apiResult4c1?.succeeded ??
                                              true)) {
                                            _model.uuid = random_data
                                                .randomDouble(0.0001, 100.0001);
                                            _model.merchId =
                                                '${widget.packId?.toString()}-${FFAppState().Club.clubId.toString()}-${getCurrentTimestamp.toString()}';
                                            setState(() {});
                                            _model.apiResultuez =
                                                await MercadoPagoGroup
                                                    .paymentCall
                                                    .call(
                                              transactionAmount: widget.precio,
                                              token: MercadoPagoGroup
                                                  .tokenCardIdCall
                                                  .token(
                                                (_model.apiResult4c1
                                                        ?.jsonBody ??
                                                    ''),
                                              ),
                                              email: currentUserEmail,
                                              uid: _model.uuid?.toString(),
                                              description: 'Compra Creditos',
                                              customrId: _model.customerId,
                                              firstName:
                                                  FFAppState().UserInfo.nombre,
                                              lastName: FFAppState()
                                                  .UserInfo
                                                  .apellido,
                                            );
                                            _shouldSetState = true;
                                            if (MercadoPagoGroup.paymentCall
                                                    .pagoStatus(
                                                  (_model.apiResultuez
                                                          ?.jsonBody ??
                                                      ''),
                                                ) ==
                                                'approved') {
                                              _model.estado = 3;
                                              setState(() {});
                                              await PagosTable().insert({
                                                'userId': currentUserUid,
                                                'precioInicial': widget.precio,
                                                'precioFinal': widget.precio,
                                                'status': 'Pendiente',
                                                'merchId': _model.merchId,
                                                'Tipo': 'Creditos',
                                              });
                                              await PagosTable().update(
                                                data: {
                                                  'status': 'Success',
                                                },
                                                matchingRows: (rows) => rows.eq(
                                                  'merchId',
                                                  _model.merchId,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            } else {
                                              if (MercadoPagoGroup.paymentCall
                                                      .pagoStatus(
                                                    (_model.apiResultuez
                                                            ?.jsonBody ??
                                                        ''),
                                                  ) ==
                                                  'in_process') {
                                                await Future.delayed(
                                                    const Duration(
                                                        milliseconds: 1000));
                                                _model.apiResult2 =
                                                    await MercadoPagoGroup
                                                        .paymentCall
                                                        .call(
                                                  transactionAmount:
                                                      widget.precio,
                                                  token: MercadoPagoGroup
                                                      .tokenCardIdCall
                                                      .token(
                                                    (_model.apiResult4c1
                                                            ?.jsonBody ??
                                                        ''),
                                                  ),
                                                  email: currentUserEmail,
                                                  uid: _model.uuid?.toString(),
                                                  description:
                                                      'Compra Creditos',
                                                  customrId: _model.customerId,
                                                  firstName: FFAppState()
                                                      .UserInfo
                                                      .nombre,
                                                  lastName: FFAppState()
                                                      .UserInfo
                                                      .apellido,
                                                );
                                                _shouldSetState = true;
                                                if (MercadoPagoGroup.paymentCall
                                                        .pagoStatus(
                                                      (_model.apiResult2
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    'in_process') {
                                                  await Future.delayed(
                                                      const Duration(
                                                          milliseconds: 2000));
                                                  _model.apiResult3 =
                                                      await MercadoPagoGroup
                                                          .paymentCall
                                                          .call(
                                                    transactionAmount:
                                                        widget.precio,
                                                    token: MercadoPagoGroup
                                                        .tokenCardIdCall
                                                        .token(
                                                      (_model.apiResult4c1
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    email: currentUserEmail,
                                                    uid:
                                                        _model.uuid?.toString(),
                                                    description:
                                                        'Compra Creditos',
                                                    customrId:
                                                        _model.customerId,
                                                    firstName: FFAppState()
                                                        .UserInfo
                                                        .nombre,
                                                    lastName: FFAppState()
                                                        .UserInfo
                                                        .apellido,
                                                  );
                                                  _shouldSetState = true;
                                                  if (MercadoPagoGroup
                                                          .paymentCall
                                                          .pagoStatus(
                                                        (_model.apiResult3
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      'in_process') {
                                                    _model.estado = 4;
                                                    setState(() {});
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    if (MercadoPagoGroup
                                                            .paymentCall
                                                            .pagoStatus(
                                                          (_model.apiResult2
                                                                  ?.jsonBody ??
                                                              ''),
                                                        ) ==
                                                        'approved') {
                                                      _model.estado = 3;
                                                      setState(() {});
                                                      await PagosTable()
                                                          .insert({
                                                        'userId':
                                                            currentUserUid,
                                                        'precioInicial':
                                                            widget.precio,
                                                        'precioFinal':
                                                            widget.precio,
                                                        'status': 'Pendiente',
                                                        'merchId':
                                                            _model.merchId,
                                                        'Tipo': 'Creditos',
                                                      });
                                                      await PagosTable().update(
                                                        data: {
                                                          'status': 'Success',
                                                        },
                                                        matchingRows: (rows) =>
                                                            rows.eq(
                                                          'merchId',
                                                          _model.merchId,
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    } else {
                                                      _model.estado = 4;
                                                      setState(() {});
                                                      if (_shouldSetState)
                                                        setState(() {});
                                                      return;
                                                    }
                                                  }
                                                } else {
                                                  if (MercadoPagoGroup
                                                          .paymentCall
                                                          .pagoStatus(
                                                        (_model.apiResult2
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      'approved') {
                                                    _model.estado = 3;
                                                    setState(() {});
                                                    await PagosTable().insert({
                                                      'userId': currentUserUid,
                                                      'precioInicial':
                                                          widget.precio,
                                                      'precioFinal':
                                                          widget.precio,
                                                      'status': 'Pendiente',
                                                      'merchId': _model.merchId,
                                                      'Tipo': 'Creditos',
                                                    });
                                                    await PagosTable().update(
                                                      data: {
                                                        'status': 'Success',
                                                      },
                                                      matchingRows: (rows) =>
                                                          rows.eq(
                                                        'merchId',
                                                        _model.merchId,
                                                      ),
                                                    );
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  } else {
                                                    _model.estado = 4;
                                                    setState(() {});
                                                    if (_shouldSetState)
                                                      setState(() {});
                                                    return;
                                                  }
                                                }
                                              } else {
                                                _model.estado = 4;
                                                setState(() {});
                                                if (_shouldSetState)
                                                  setState(() {});
                                                return;
                                              }
                                            }
                                          } else {
                                            _model.estado = 4;
                                            setState(() {});
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        } else {
                                          _model.estado = 2;
                                          setState(() {});
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        _model.merchId =
                                            '${widget.packId?.toString()}-${FFAppState().Club.clubId.toString()}-${getCurrentTimestamp.toString()}';
                                        setState(() {});
                                        _model.etpay = await EtpayCall.call(
                                          merchantOrderId: _model.merchId,
                                          orderAmount: widget.precio,
                                          customerEmail: currentUserEmail,
                                          merchantCode:
                                              FFAppState().Club.merchantCode,
                                          merchantApiToken:
                                              FFAppState().Club.merchantToken,
                                        );
                                        _shouldSetState = true;
                                        if ((_model.etpay?.succeeded ?? true)) {
                                          await PagosTable().insert({
                                            'userId': currentUserUid,
                                            'precioInicial': widget.precio,
                                            'precioFinal': widget.precio,
                                            'status': 'Pendiente',
                                            'sigantureToken':
                                                EtpayCall.apiSignature(
                                              (_model.etpay?.jsonBody ?? ''),
                                            ),
                                            'merchId': _model.merchId,
                                            'Tipo': 'Creditos',
                                          });

                                          context.pushNamed(
                                            'PagoPage',
                                            queryParameters: {
                                              'url': serializeParam(
                                                'https://pmt-sandbox.etpay.com/session/${EtpayCall.apiToken(
                                                  (_model.etpay?.jsonBody ??
                                                      ''),
                                                )}',
                                                ParamType.String,
                                              ),
                                              'merchId': serializeParam(
                                                _model.merchId,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        } else {
                                          _model.estado = 4;
                                          setState(() {});
                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                              text: 'Pagar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().Club.colorTrue,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(32.0),
                                disabledColor:
                                    FFAppState().Club.colorSecundario,
                                disabledTextColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (_model.estado == 2)
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Text(
                      'Por seguridad se le solicitará el CVV de la tarjeta',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Roboto',
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'CVV',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                width: 100.0,
                                child: TextFormField(
                                  controller: _model.textController,
                                  focusNode: _model.textFieldFocusNode,
                                  autofocus: false,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 19.0,
                                        ),
                                    hintText: '***',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 19.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 19.0,
                                      ),
                                  maxLength: 3,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                            if (!_model.isValid)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 0.0),
                                child: Text(
                                  'CVV Incorreto',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Solicitar CVV al comprar',
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'No',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: _model.switchValue!
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Switch.adaptive(
                                    value: _model.switchValue!,
                                    onChanged: (newValue) async {
                                      setState(
                                          () => _model.switchValue = newValue!);
                                    },
                                    activeColor: FFAppState().Club.colorTrue,
                                    activeTrackColor:
                                        FFAppState().Club.colorSecundario,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  Text(
                                    'Si',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: !_model.switchValue!
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryText
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                          ],
                        ),
                      ].divide(SizedBox(width: 24.0)),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 40.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              text: 'Cancelar',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.isValid = true;
                                setState(() {});
                                _model.supaCard =
                                    await CustomerCardTable().queryRows(
                                  queryFn: (q) => q.eq(
                                    'cardId',
                                    _model.cardId,
                                  ),
                                );
                                _shouldSetState = true;
                                if (functions
                                        .textToNumber(_model
                                            .supaCard!.first.cvv!
                                            .toString())
                                        .toString() ==
                                    _model.textController.text) {
                                  if (!_model.switchValue!) {
                                    await CustomerCardTable().update(
                                      data: {
                                        'CVV': int.tryParse(
                                            _model.textController.text),
                                      },
                                      matchingRows: (rows) => rows.eq(
                                        'cardId',
                                        _model.cardId,
                                      ),
                                    );
                                  }
                                  _model.apiCard = await MercadoPagoGroup
                                      .tokenCardIdCall
                                      .call(
                                    cardId: _model.cardId?.toString(),
                                    securityCode: _model.textController.text,
                                  );
                                  _shouldSetState = true;
                                  if ((_model.apiCard?.succeeded ?? true)) {
                                    _model.apiPayment =
                                        await MercadoPagoGroup.paymentCall.call(
                                      transactionAmount: 1200.0,
                                      token: MercadoPagoGroup.tokenCardIdCall
                                          .token(
                                        (_model.apiCard?.jsonBody ?? ''),
                                      ),
                                      email: currentUserEmail,
                                      uid: random_data
                                          .randomDouble(0.0001, 100.0001)
                                          .toString(),
                                      description: 'Compra Creditos',
                                      customrId: _model.customerId,
                                      firstName: FFAppState().UserInfo.nombre,
                                      lastName: FFAppState().UserInfo.apellido,
                                    );
                                    _shouldSetState = true;
                                    if ((_model.apiPayment?.succeeded ??
                                        true)) {
                                      _model.estado = 3;
                                      setState(() {});
                                    } else {
                                      _model.estado = 4;
                                      setState(() {});
                                    }
                                  } else {
                                    _model.estado = 4;
                                    setState(() {});
                                  }
                                } else {
                                  _model.isValid = false;
                                  setState(() {});
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: 'Validar',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FFAppState().Club.colorTrue,
                                textStyle: FlutterFlowTheme.of(context)
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
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (_model.estado == 3)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                  child: Row(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Pago  Realizado',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          if (_model.estado == 4)
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                  child: Row(
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Text(
                    'Pago  Rechazado',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
