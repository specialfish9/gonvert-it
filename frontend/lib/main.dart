import 'package:flutter/material.dart';
import 'package:frontend/locator.dart';
import 'package:frontend/ui/app.dart';
import 'package:frontend/ui/pages/home/home_page.dart';

void main() {
  buildDependencyGraph();
  runApp(App());
}
