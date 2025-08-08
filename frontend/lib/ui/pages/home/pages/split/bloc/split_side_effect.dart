sealed class SplitSideEffect {
  const SplitSideEffect();

  const factory SplitSideEffect.error(final String error) = OnError._;

  const factory SplitSideEffect.downloaded(final String fileName) = Downloaded._;
}

final class OnError extends SplitSideEffect {
  final String error;

  const OnError._(this.error);
}

final class Downloaded extends SplitSideEffect {
  final String fileName;
  const Downloaded._(this.fileName);
}
