import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Route with a fade in animation applied.
abstract class BaseRoute extends GoRoute {
  BaseRoute({
    required super.path,
    required final GoRouterWidgetBuilder builder,
    final bool? opaque,
    final bool? fullscreenDialog,
    final bool? barrierDismissible,
    super.onExit,
    super.routes,
  }) : super(
         pageBuilder: (final context, final state) {
           return CustomTransitionPage(
             opaque: opaque ?? true,
             fullscreenDialog: fullscreenDialog ?? false,
             child: builder(context, state),
             barrierDismissible: barrierDismissible ?? false,
             transitionsBuilder:
                 (
                   final context,
                   final animation,
                   final secondaryAnimation,
                   final child,
                 ) => SlideTransition(
                   position: animation.drive(
                     Tween(
                       begin: const Offset(1.0, 0.0),
                       end: Offset.zero,
                     ).chain(CurveTween(curve: Curves.fastOutSlowIn)),
                   ),
                   child: child,
                 ),
           );
         },
       );
}
