import 'package:frontend/ui/router/router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../locator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: locator<AppRouter>(),
      theme: ThemeData(colorScheme: ColorSchemes.darkZinc(), radius: 0.5),
    );
  }
}
