import 'package:flutter/material.dart' hide Card, Colors, Theme;
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
    return Card(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.zinc[800],
              border: Border.all(color: Colors.zinc[700]!),
              borderRadius: Theme.of(context).borderRadiusMd,
            ),
            child: _matchIcon(op.code),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(op.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(op.description, style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
