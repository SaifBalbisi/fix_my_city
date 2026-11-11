
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'department_selection_screen.dart';

class SubmissionSuccessScreen extends StatelessWidget {
  final String reportNumber;

  const SubmissionSuccessScreen({
    super.key,
    required this.reportNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تأكيد البلاغ'),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: Color(0xFF247348),
              ),
              const SizedBox(height: 24),

              const Text(
                'تم تسجيل البلاغ التجريبي بنجاح!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'تم إكمال خطوات إنشاء البلاغ. '
                'سيتم ربط الإرسال الفعلي بالجهة المسؤولة لاحقاً.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const Text('رقم البلاغ التجريبي'),
                      const SizedBox(height: 8),
                      Text(
                        reportNumber,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DepartmentSelectionScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('إنشاء بلاغ جديد'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//تعرض رسالة نجاح ورقم بلاغ تجريبي بعد إكمال الخطوات. وتسمح للمواطن بالعودة للشاشة الأولى لإنشاء بلاغ جديد. لا يتم حفظ البلاغ فعلياً في قاعدة البيانات بعد.