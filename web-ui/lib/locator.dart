import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

Completer<GetIt>? _buildGraphCompleter;

@injectableInit
Future<void> buildDependencyGraph() =>
    (_buildGraphCompleter ??= Completer()..complete(locator.init())).future;

class BlocInjector<T extends StateStreamableSource<Object?>>
    extends BlocProvider<T> {
  BlocInjector({super.key, super.child, final param})
    : super(create: (_) => locator(param1: param), lazy: false);
}
