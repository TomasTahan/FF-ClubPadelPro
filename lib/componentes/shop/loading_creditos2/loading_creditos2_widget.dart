import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_creditos2_model.dart';
export 'loading_creditos2_model.dart';

class LoadingCreditos2Widget extends StatefulWidget {
  const LoadingCreditos2Widget({super.key});

  @override
  State<LoadingCreditos2Widget> createState() => _LoadingCreditos2WidgetState();
}

class _LoadingCreditos2WidgetState extends State<LoadingCreditos2Widget>
    with TickerProviderStateMixin {
  late LoadingCreditos2Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCreditos2Model());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: const Color(0xFF242B2B),
              borderRadius: BorderRadius.circular(24.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
