import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../locator.dart';

GoRouterWidgetBuilder injectedBuilder<T extends BlocBase>(final Widget child) =>
    (_, final state) => BlocInjector<T>(param: state.extra, child: child);
