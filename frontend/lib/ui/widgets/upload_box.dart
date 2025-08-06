import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart' show InkWell;
import 'package:shadcn_flutter/shadcn_flutter.dart';

class UploadBox extends StatelessWidget {
  final void Function(DropDoneDetails)? onFileDropped;
  final void Function(DropEventDetails)? onDragEntered;
  final void Function(DropEventDetails)? onDragExited;
  final VoidCallback? onTap;

  const UploadBox({
    super.key,
    this.onFileDropped,
    this.onDragEntered,
    this.onDragExited,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FractionallySizedBox(
      widthFactor: 0.4,
      heightFactor: 0.4,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          child: DropTarget(
            onDragDone: onFileDropped,
            onDragEntered: onDragEntered,
            onDragExited: onDragExited,
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: theme.borderRadiusMd.bottomLeft,
                strokeWidth: 2,
                color: Colors.zinc[500],
                dashPattern: const [10, 5],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 48, color: Colors.zinc[500]),
                    const SizedBox(height: 8),
                    Text(
                      'Drop a file here or click to upload',
                      style: theme.typography.medium.copyWith(
                        color: Colors.zinc[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
