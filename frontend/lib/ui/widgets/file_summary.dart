import 'dart:io';

import 'package:frontend/ui/utils.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class FileSummary extends StatelessWidget {
  final List<File> files;
  final String actionText;
  final bool? showZipMessage;
  final VoidCallback? onActionPressed;

  const FileSummary({
    super.key,
    required this.files,
    required this.actionText,
    this.onActionPressed,
    this.showZipMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 1,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery
                  .of(context)
                  .size
                  .height * 0.4,
            ),
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: files.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final file = files[index];
                return _File(file: file);
              },
            ),
          ),
        ),
        if (showZipMessage == true) ...[
          const SizedBox(height: 24),
          Text(
            'A zip file will be created with the processed files.',
            style: Theme
                .of(context)
                .typography
                .small,
          ),
        ],
        const SizedBox(height: 16),
        Button.primary(
          onPressed: onActionPressed,
          child: Text(actionText),
        ),
      ],
    );
  }
}

class _File extends StatelessWidget {
  final File file;

  const _File({required this.file});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: FractionallySizedBox(
        widthFactor: 0.4,
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
                child: Icon(BootstrapIcons.fileEarmarkPdf),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  file.name,
                  style: theme.typography.medium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
