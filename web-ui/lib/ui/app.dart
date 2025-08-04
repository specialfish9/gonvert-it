import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:webui/repository/operation.dart';
import 'package:webui/ui/widgets/operation.dart';
import 'package:webui/ui/widgets/search_bar.dart';

class App extends StatelessWidget {

  static const _padding = 16.0;
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var ops = [
      JsonOperation(
        name: 'Merge',
        description: 'Merge files together',
        code: JsonOperationCode.merge,
      ),
      JsonOperation(
        name: 'Split',
        description: 'Split a file into multiple parts',
        code: JsonOperationCode.split,
      ),
      JsonOperation(
        name: 'Merge',
        description: 'Merge files together',
        code: JsonOperationCode.merge,
      ),
      JsonOperation(
        name: 'Merge',
        description: 'Merge files together',
        code: JsonOperationCode.merge,
      ),
    ];
    

    return ShadcnApp(
      debugShowCheckedModeBanner: false,
      title: 'GonvertIt',
      home: Scaffold(
        headers: [AppBar(title: const Text('GonvertIt'))],
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(_padding),
                child: SearchBar(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: _padding),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400, // Maximum width per card
                  mainAxisSpacing: _padding,
                  crossAxisSpacing: _padding,
                  mainAxisExtent: 80, // Fixed height for each card
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Operation(op: ops[index]),
                  childCount: ops.length,
                ),
              ),
            ),
          ],
        ),
      ),
      theme: ThemeData(colorScheme: ColorSchemes.darkZinc(), radius: 0.5),
    );
  }
}
