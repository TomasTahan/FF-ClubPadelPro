import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'loading_creditos3_model.dart';
export 'loading_creditos3_model.dart';

class LoadingCreditos3Widget extends StatefulWidget {
  const LoadingCreditos3Widget({super.key});

  @override
  State<LoadingCreditos3Widget> createState() => _LoadingCreditos3WidgetState();
}

class _LoadingCreditos3WidgetState extends State<LoadingCreditos3Widget>
    with TickerProviderStateMixin {
  late LoadingCreditos3Model _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingCreditos3Model());

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
            width: 100.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: const Color(0xFF242B2B),
              borderRadius: BorderRadius.circular(32.0),
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
