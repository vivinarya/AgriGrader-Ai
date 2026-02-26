import 'package:flutter/material.dart';
import 'package:agrigrader_flutter/theme.dart';
import 'package:agrigrader_flutter/main_scaffold.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const AgriGraderApp());
}

class AgriGraderApp extends StatelessWidget {
  const AgriGraderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriGrader',
      theme: appTheme,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        ],
      ),
      home: const MainScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }
}
