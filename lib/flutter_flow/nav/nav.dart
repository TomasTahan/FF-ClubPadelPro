import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';

import '/backend/supabase/supabase.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const LoginWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          requireAuth: true,
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'RegisterPage1',
          path: '/registerPage1',
          builder: (context, params) => const RegisterPage1Widget(),
        ),
        FFRoute(
          name: 'RegisterPage2',
          path: '/registerPage2',
          builder: (context, params) => const RegisterPage2Widget(),
        ),
        FFRoute(
          name: 'profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => const ProfileWidget(),
        ),
        FFRoute(
          name: 'LigaInscripcion',
          path: '/ligaInscripcion',
          builder: (context, params) => LigaInscripcionWidget(
            paramCategorias: params.getParam<LigaCategoriaRow>(
              'paramCategorias',
              ParamType.SupabaseRow,
              isList: true,
            ),
            cateogiras: params.getParam<int>(
              'cateogiras',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'PartidosPage',
          path: '/partidosPage',
          builder: (context, params) => const PartidosPageWidget(),
        ),
        FFRoute(
          name: 'PartidoNuevo',
          path: '/partidoNuevo',
          builder: (context, params) => const PartidoNuevoWidget(),
        ),
        FFRoute(
          name: 'PartidoPage',
          path: '/partidoPage',
          builder: (context, params) => PartidoPageWidget(
            partidoId: params.getParam(
              'partidoId',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'ReservaPage',
          path: '/reservaPage',
          builder: (context, params) => const ReservaPageWidget(),
        ),
        FFRoute(
          name: 'ClasesPage',
          path: '/clasesPage',
          builder: (context, params) => const ClasesPageWidget(),
        ),
        FFRoute(
          name: 'ClaseProfesor',
          path: '/claseProfesor',
          builder: (context, params) => ClaseProfesorWidget(
            profesorId: params.getParam(
              'profesorId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ClasePerfil',
          path: '/clasePerfil',
          builder: (context, params) => const ClasePerfilWidget(),
        ),
        FFRoute(
          name: 'ClaseCalendario',
          path: '/claseCalendario',
          builder: (context, params) => ClaseCalendarioWidget(
            fecha: params.getParam(
              'fecha',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'LigaPage',
          path: '/ligaPage',
          builder: (context, params) => const LigaPageWidget(),
        ),
        FFRoute(
          name: 'LigaClasificacion',
          path: '/ligaClasificacion',
          builder: (context, params) => LigaClasificacionWidget(
            paramCategorias: params.getParam<LigaCategoriaRow>(
              'paramCategorias',
              ParamType.SupabaseRow,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'LigaPartidos',
          path: '/ligaPartidos',
          builder: (context, params) => LigaPartidosWidget(
            ligaId: params.getParam(
              'ligaId',
              ParamType.int,
            ),
            anotarResultados: params.getParam(
              'anotarResultados',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'LigaPartido',
          path: '/ligaPartido',
          builder: (context, params) => LigaPartidoWidget(
            partidoId: params.getParam(
              'partidoId',
              ParamType.int,
            ),
            anotarResultados: params.getParam(
              'anotarResultados',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'LigaAsignarFecha',
          path: '/ligaAsignarFecha',
          builder: (context, params) => LigaAsignarFechaWidget(
            partidoId: params.getParam(
              'partidoId',
              ParamType.int,
            ),
            anotarResultados: params.getParam(
              'anotarResultados',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'Progreso',
          path: '/progreso',
          builder: (context, params) => const ProgresoWidget(),
        ),
        FFRoute(
          name: 'LigaPlayoffs',
          path: '/ligaPlayoffs',
          builder: (context, params) => const LigaPlayoffsWidget(),
        ),
        FFRoute(
          name: 'TorneosPage',
          path: '/torneosPage',
          builder: (context, params) => const TorneosPageWidget(),
        ),
        FFRoute(
          name: 'TorneoPage',
          path: '/torneoPage',
          builder: (context, params) => TorneoPageWidget(
            torneoId: params.getParam(
              'torneoId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TorneoInscripcion',
          path: '/torneoInscripcion',
          builder: (context, params) => TorneoInscripcionWidget(
            paramCategorias: params.getParam<TorneoCategoriasRow>(
              'paramCategorias',
              ParamType.SupabaseRow,
              isList: true,
            ),
            categoriasInscritas: params.getParam<int>(
              'categoriasInscritas',
              ParamType.int,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: 'PagoPage',
          path: '/pagoPage',
          builder: (context, params) => PagoPageWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            merchId: params.getParam(
              'merchId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ShopPage',
          path: '/shopPage',
          requireAuth: true,
          builder: (context, params) => const ShopPageWidget(),
        ),
        FFRoute(
          name: 'Test',
          path: '/test',
          builder: (context, params) => const TestWidget(),
        ),
        FFRoute(
          name: 'MetodoPago',
          path: '/metodoPago',
          builder: (context, params) => const MetodoPagoWidget(),
        ),
        FFRoute(
          name: 'AadirTarjeta',
          path: '/aadirTarjeta',
          builder: (context, params) => const AadirTarjetaWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.transparent,
                      child: Image.asset(
                        'assets/images/PadelTeam.png',
                        fit: BoxFit.cover,
                      ),
                    )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
