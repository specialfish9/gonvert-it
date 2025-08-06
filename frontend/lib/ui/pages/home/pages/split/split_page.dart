import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ui/router/base_route.dart';
import 'package:frontend/ui/router/injected_builder.dart';
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

    return BlocBuilder<SplitBloc, SplitState>(
      buildWhen: (final prev, final curr) {
        return true;
      },
      builder: (context, state) {
        return Scaffold(
          headers: [AppBar(title: const Text('Split a file'))],
          child: UploadBox(
            onTap: () => bloc.add(SplitEvent.dropAreaTapped()),
            onFileDropped: (details) =>
                bloc.add(SplitEvent.fileDropped(details.files.first)),
          ),
        );
      },
    );
  }
}
