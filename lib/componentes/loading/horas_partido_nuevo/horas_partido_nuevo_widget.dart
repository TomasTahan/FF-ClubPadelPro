import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'horas_partido_nuevo_model.dart';
export 'horas_partido_nuevo_model.dart';

class HorasPartidoNuevoWidget extends StatefulWidget {
  const HorasPartidoNuevoWidget({super.key});

  @override
  State<HorasPartidoNuevoWidget> createState() =>
      _HorasPartidoNuevoWidgetState();
}

class _HorasPartidoNuevoWidgetState extends State<HorasPartidoNuevoWidget>
    with TickerProviderStateMixin {
  late HorasPartidoNuevoModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HorasPartidoNuevoModel());

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
      'containerOnPageLoadAnimation5': AnimationInfo(
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
      'containerOnPageLoadAnimation6': AnimationInfo(
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
      'containerOnPageLoadAnimation7': AnimationInfo(
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
      'containerOnPageLoadAnimation8': AnimationInfo(
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
      'containerOnPageLoadAnimation9': AnimationInfo(
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(),
        child: GridView(
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 2.4,
          ),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation1']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation2']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation3']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation4']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation5']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(121.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation6']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation7']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation8']!),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 30.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation9']!),
            ),
          ],
        ),
      ),
    );
  }
}
