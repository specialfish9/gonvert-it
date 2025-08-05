import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:rxdart/rxdart.dart';

const kKeyboardInputDebounceDuration = Duration(milliseconds: 500);

EventTransformer<Event> debounce<Event>([
  final Duration duration = kKeyboardInputDebounceDuration,
]) =>
    (final events, final mapper) =>
        Rx.switchLatest(events.debounceTime(duration).map(mapper));

extension BlocUtils<Event, State> on Bloc<Event, State> {
  void dropOn<E extends Event>(final EventHandler<E, State> handler) =>
      on<E>(handler, transformer: droppable());

  void sequentialOn<E extends Event>(final EventHandler<E, State> handler) =>
      on<E>(handler, transformer: sequential());

  void debounceOn<E extends Event>(
    final EventHandler<E, State> handler, [
    final Duration duration = kKeyboardInputDebounceDuration,
  ]) => on<E>(handler, transformer: debounce(duration));

  void restartOn<E extends Event>(final EventHandler<E, State> handler) =>
      on<E>(handler, transformer: restartable());
}
