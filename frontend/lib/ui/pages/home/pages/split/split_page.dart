import 'package:flutter/material.dart' show SnackBar, ScaffoldMessenger;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ui/pages/home/pages/split/bloc/split_side_effect.dart';
import 'package:frontend/ui/router/base_route.dart';
import 'package:frontend/ui/router/injected_builder.dart';
import 'package:frontend/ui/side_effect.dart';
import 'package:frontend/ui/widgets/file_summary.dart';
import 'package:frontend/ui/widgets/upload_box.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'bloc/split_bloc.dart';

class SplitRoute extends BaseRoute {
  static const String _path = '/split';

  static String buildLocation() => _path;

  SplitRoute()
    : super(
        path: _path,
        builder: injectedBuilder<SplitBloc>(const SplitPage()),
      );
}

class SplitPage extends StatelessWidget {
  const SplitPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SplitBloc>();

    return Scaffold(
      headers: [AppBar(title: const Text('Split a file'))],
      child: SideEffectListener<SplitBloc, SplitSideEffect>(
        listener: (final context, final sideEffect) async {
          if (sideEffect is OnError) {
            final snackBar = SnackBar(content: Text(sideEffect.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (sideEffect is Downloaded) {
            final snackBar = SnackBar(
              content: Text('File downloaded: ${sideEffect.fileName}'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<SplitBloc, SplitState>(
          buildWhen: (final prev, final curr) => prev.file != curr.file,
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return state.file == null
                ? UploadBox(
                    onTap: () => bloc.add(SplitEvent.dropAreaTapped()),
                    onFileDropped: (details) =>
                        bloc.add(SplitEvent.fileDropped(details.files.first)),
                  )
                : FileSummary(
                    files: [state.file!],
                    actionText: 'Split',
                    showZipMessage: true,
                    onActionPressed: () => bloc.add(SplitEvent.onSubmit()),
                  );
          },
        ),
      ),
    );
  }
}
