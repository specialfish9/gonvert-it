import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


/// [SideEffect] adds side effects feature to a closeable object.
mixin SideEffect<S> on Closable {
  final _controller = StreamController<S>.broadcast();

  /// Stream emitting side effects.
  Stream<S> get sideEffect => _controller.stream;

  /// Emits a new side effect.
  @protected
  void emitSideEffect(final S item) => _controller.add(item);

  @override
  @mustCallSuper
  Future<void> close() async {
    await _controller.close();
    await super.close();
  }
}

/// Signature for the `listener` function which takes the `BuildContext` along
/// with the `state` and is responsible for executing in response to side
/// effects.
typedef SideEffectWidgetListener<S> = void Function(
    BuildContext context, S sideEffect);

class SideEffectListener<B extends SideEffect<S>, S> extends StatefulWidget {
  /// The widget which will be rendered as a descendant of the
  /// [SideEffectListener].
  final Widget child;

  /// The [emitter] whose `side effects` will be listened to. If not specified
  /// it will be searched in widget tree.
  final B? emitter;

  /// The [SideEffectWidgetListener] which will be called on every new
  /// `side effect` change.
  final SideEffectWidgetListener<S> listener;

  const SideEffectListener({
    required this.listener,
    required this.child,
    this.emitter,
    super.key,
  });

  @override
  State<SideEffectListener<B, S>> createState() =>
      _SideEffectListenerState<B, S>();
}

class _SideEffectListenerState<B extends SideEffect<S>, S>
    extends State<SideEffectListener<B, S>> {
  StreamSubscription<S>? _subscription;
  late B _emitter;

  @override
  void initState() {
    super.initState();
    _emitter = widget.emitter ?? context.read<B>();
    _subscribe();
  }

  @override
  Widget build(final BuildContext context) {
    if (widget.emitter == null) {
      context.select<B, bool>((final bloc) => identical(_emitter, bloc));
    }
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant final SideEffectListener<B, S> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldEmitter = oldWidget.emitter ?? context.read<B>();
    final emitter = widget.emitter ?? oldEmitter;
    if (oldEmitter != emitter) {
      if (_subscription != null) {
        _unsubscribe();
        _emitter = emitter;
      }
      _subscribe();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final emitter = widget.emitter ?? context.read<B>();
    if (_emitter != emitter) {
      if (_subscription != null) {
        _unsubscribe();
        _emitter = emitter;
      }
      _subscribe();
    }
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _subscribe() {
    _subscription = _emitter.sideEffect.listen((final sideEffect) {
      final context = this.context;
      if (context.mounted) {
        widget.listener(context, sideEffect);
      }
    });
  }

  void _unsubscribe() {
    unawaited(_subscription?.cancel());
    _subscription = null;
  }
}
