
import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'features/report_creation/screens/department_selection_screen.dart';

void main() {
  runApp(const FixMyCityApp());
}

class FixMyCityApp extends StatelessWidget {
  const FixMyCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fix My City',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
        ),
      ),
      home: const DepartmentSelectionScreen(),
    );
  }
}
