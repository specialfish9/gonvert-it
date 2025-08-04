import 'package:flutter/material.dart'
    hide Scaffold, AppBar, ThemeData, Theme, Card;
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:webui/repository/operation.dart';
import 'package:webui/ui/widgets/operation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var ops = [
      JsonOperation(
        name: 'Merge',
        description: 'Merge files together',
        code: JsonOperationCode.merge
      ),
      JsonOperation(
          name: 'Split',
          description: 'Split a file into multiple parts',
          code: JsonOperationCode.split
      ),
      JsonOperation(
          name: 'Merge',
          description: 'Merge files together',
          code: JsonOperationCode.merge
      ),
      JsonOperation(
          name: 'Merge',
          description: 'Merge files together',
          code: JsonOperationCode.merge
      ),
    ];

    return ShadcnApp(
      debugShowCheckedModeBanner: false,
      title: 'GonvertIt',
      home: Scaffold(
        headers: [AppBar(title: const Text('GonvertIt'))],
        child: Center(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400, // Maximum width per card
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 80, // Fixed height for each card
            ),
            itemCount: ops.length,
            itemBuilder: (context, index) => Operation(op: ops[index]),
          ),
        ),
      ),
      theme: ThemeData(colorScheme: ColorSchemes.darkZinc(), radius: 0.5),
    );
  }
}
