import 'package:shadcn_flutter/shadcn_flutter.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController controller;
  const SearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      placeholder: const Text('Search operations...'),
      controller: controller,
      features: [
        InputFeature.leading(
          StatedWidget.builder(
            builder: (context, states) {
              if (states.hovered) {
                return const Icon(Icons.search);
              } else {
                return const Icon(Icons.search).iconMutedForeground();
              }
            },
          ),
          visibility: InputFeatureVisibility.textEmpty,
        ),
        InputFeature.clear(
          visibility:
              (InputFeatureVisibility.textNotEmpty &
                  InputFeatureVisibility.focused) |
              InputFeatureVisibility.hovered,
        ),
      ],
    );
  }
}
