import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/ui/pages/home/bloc/home_bloc.dart';
import 'package:frontend/ui/router/base_route.dart';
import 'package:frontend/ui/router/injected_builder.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:frontend/ui/widgets/operation.dart';
import 'package:frontend/ui/widgets/search_bar.dart';

class HomeRoute extends BaseRoute {
  static const String _path = '/';

  static String buildLocation() => _path;

  HomeRoute()
    : super(path: _path, builder: injectedBuilder<HomeBloc>(const HomePage()));
}

class HomePage extends StatelessWidget {
  static const _padding = 16.0;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (final prev, final curr) {
        return !const DeepCollectionEquality().equals(
              prev.operations,
              curr.operations,
            ) ||
            prev.filteredOperations != curr.filteredOperations;
      },
      builder: (context, state) {
        if (state.operations == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          headers: [AppBar(title: const Text('GonvertIt'))],
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(_padding),
                  child: SearchBar(controller: state.searchController),
                ),
              ),

              state.filteredOperations == null ||
                      state.filteredOperations!.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: _padding),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400, // Maximum width per card
                              mainAxisSpacing: _padding,
                              crossAxisSpacing: _padding,
                              mainAxisExtent: 80, // Fixed height for each card
                            ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) =>
                              Operation(op: state.filteredOperations![index]),
                          childCount: state.filteredOperations!.length,
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(child: Text('No operation found')),
            ],
          ),
        );
      },
    );
  }
}
