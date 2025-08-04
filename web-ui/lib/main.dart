import 'package:flutter/material.dart';
import 'package:webui/locator.dart';
import 'package:webui/ui/app.dart';

void main() {
  buildDependencyGraph();
  runApp(App());
}