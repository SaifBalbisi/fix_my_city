import 'report_summary_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ProblemDescriptionScreen extends StatefulWidget {
  final String selectedDepartment;
  final String selectedIssue;
  final String? imagePath;

  const ProblemDescriptionScreen({
    super.key,
    required this.selectedDepartment,
    required this.selectedIssue,
    this.imagePath,
  });

  @override
  State<ProblemDescriptionScreen> createState() =>
      _ProblemDescriptionScreenState();
}

class _ProblemDescriptionScreenState
    extends State<ProblemDescriptionScreen> {
  final TextEditingController descriptionController =
      TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('وصف المشكلة'),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'إضافة وصف للمشكلة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'يمكنك إضافة تفاصيل تساعد الجهة المسؤولة على فهم المشكلة.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              const Text(
                'هذا الحقل اختياري',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: descriptionController,
                maxLines: 6,
                maxLength: 500,
                decoration: InputDecoration(
                  hintText: 'مثال: توجد حفرة كبيرة في الشارع...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ReportSummaryScreen(
        selectedDepartment: widget.selectedDepartment,
        selectedIssue: widget.selectedIssue,
        imagePath: widget.imagePath,
        description: descriptionController.text.trim(),
      ),
    ),
  );
},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('التالي'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//وصف المشكلة