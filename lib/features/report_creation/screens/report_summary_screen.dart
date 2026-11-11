import 'submission_success_screen.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ReportSummaryScreen extends StatelessWidget {
  final String selectedDepartment;
  final String selectedIssue;
  final String? imagePath;
  final String description;

  const ReportSummaryScreen({
    super.key,
    required this.selectedDepartment,
    required this.selectedIssue,
    this.imagePath,
    required this.description,
  });

  Widget buildInfoCard(String title, String value) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.heading,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('مراجعة البلاغ'),
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
                'مراجعة تفاصيل البلاغ',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'تأكد من صحة المعلومات قبل إرسال البلاغ.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    buildInfoCard(
                      'القسم المسؤول',
                      selectedDepartment,
                    ),
                    buildInfoCard(
                      'نوع المشكلة',
                      selectedIssue,
                    ),
                    buildInfoCard(
                      'الموقع',
                      'موقع تجريبي - لم يتم تحديد GPS بعد',
                    ),
                    buildInfoCard(
                      'وصف المشكلة',
                      description.isEmpty
                          ? 'لم تتم إضافة وصف'
                          : description,
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      'صورة المشكلة',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    if (imagePath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(imagePath!),
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      )
                    else
                      const Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('لم تتم إضافة صورة'),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                 
onPressed: () {
  final reportNumber =
      'DEMO-${DateTime.now().millisecondsSinceEpoch}';

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SubmissionSuccessScreen(
        reportNumber: reportNumber,
      ),
    ),
  );
},
//هذا الكود بيعمل رقم بلاغ تجريبي، وبنقلك لشاشة النجاح. ما بحفظ البلاغ بقاعدة بيانات ولا برسل طلب للـ API حالياً.
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('إرسال البلاغ'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//مراجعة البلاغ