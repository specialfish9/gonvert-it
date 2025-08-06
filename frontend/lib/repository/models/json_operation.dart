enum JsonOperationCode {
  merge,
  split
}

/// Operation that can be performed on a file.
class JsonOperation {
  /// Name of the operation, used for display purposes.
  final String name;

  /// Unique code for the operation, used for identification.
  final JsonOperationCode code;

  /// Details of what the operation does, used for display purposes.
  final String description;

  /// Route to the operation, used for navigation.
  final String route;

  const JsonOperation({
    required this.name,
    required this.code,
    required this.description,
    required this.route,
  });
}
