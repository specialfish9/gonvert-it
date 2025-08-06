import 'package:flutter/foundation.dart';
import 'package:frontend/ui/pages/home/home_page.dart';
import 'package:injectable/injectable.dart';
import 'package:go_router/go_router.dart';

import '../../repository/models/json_operation.dart';
import '../pages/home/pages/split/split_page.dart';

@singleton
class AppRouter extends GoRouter {
  static String buildLocation(
    final String? parent,
    final String path,
    final Map<String, dynamic> pathParams,
  ) {
    assert(pathParams.isNotEmpty, 'parsing a path with empty params');

    final parsed = Uri.parse(parent == null ? path : '$parent/$path');
    return parsed
        .replace(
          pathSegments: parsed.pathSegments.map(
            (final param) => pathParams[param] ?? param,
          ),
        )
        .toString();
  }

  AppRouter()
    : super.routingConfig(
        routingConfig: _RoutingConfigProvider(
          RoutingConfig(routes: [HomeRoute()]),
        ),
        initialLocation: HomeRoute.buildLocation(),
      );

  void pushOperationRoute(JsonOperation op) => push(op.route);
}

class _RoutingConfigProvider extends ValueListenable<RoutingConfig> {
  @override
  final RoutingConfig value;

  const _RoutingConfigProvider(this.value);

  @override
  void addListener(final VoidCallback listener) {}

  @override
  void removeListener(final VoidCallback listener) {}
}
