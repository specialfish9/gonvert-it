import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:webui/repository/operation.dart';

class Operation extends StatelessWidget {
  final JsonOperation op;

  const Operation({super.key, required this.op});

  Widget _matchIcon(JsonOperationCode code) => switch (code) {
    JsonOperationCode.merge => const Icon(LucideIcons.merge),
    JsonOperationCode.split => const Icon(LucideIcons.split),
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Card(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.zinc[800],
              border: Border.all(color: Colors.zinc[700]!),
              borderRadius: theme.borderRadiusMd,
            ),
            child: _matchIcon(op.code),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                op.name,
                style: theme.typography.medium,
              ),
              Text(op.description, style: theme.typography.small),
            ],
          ),
        ],
      ),
    );
  }
}
