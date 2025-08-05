import 'package:flutter/material.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/ui/app.dart';

void main() {
  buildDependencyGraph();
  runApp(App());
}