import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:flutter/material.dart' show InkWell;
import 'package:frontend/repository/models/json_operation.dart';

class OperationTile extends StatelessWidget {
  final JsonOperation op;
  final VoidCallback? onTap;

  const OperationTile({super.key, required this.op, this.onTap});

  Widget _matchIcon(JsonOperationCode code) => switch (code) {
    JsonOperationCode.merge => const Icon(LucideIcons.merge),
    JsonOperationCode.split => const Icon(LucideIcons.split),
  };

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.zinc[800],
                border: Border.all(color: Colors.zinc[700]),
                borderRadius: theme.borderRadiusMd,
              ),
              child: _matchIcon(op.code),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    op.name,
                    style: theme.typography.medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    op.description,
                    style: theme.typography.small,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
