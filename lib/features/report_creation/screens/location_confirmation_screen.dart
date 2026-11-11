
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'issue_type_screen.dart';

class LocationConfirmationScreen extends StatefulWidget {
  final String selectedDepartment;

  const LocationConfirmationScreen({
    super.key,
    required this.selectedDepartment,
  });

  @override
  State<LocationConfirmationScreen> createState() =>
      _LocationConfirmationScreenState();
}

class _LocationConfirmationScreenState
    extends State<LocationConfirmationScreen> {

  bool isLocationConfirmed = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تحديد موقع المشكلة'),
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
                'تأكيد موقع المشكلة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'تأكد من موقع المشكلة قبل المتابعة.',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // خريطة تجريبية - سنضيف GPS لاحقاً
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCEBEA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 65,
                        color: AppColors.primary,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'مكان الخريطة',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'سيتم ربط GPS والخريطة لاحقاً',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // تأكيد الموقع
              Card(
                color: Colors.white,
                child: CheckboxListTile(
                  title: const Text('أؤكد موقع المشكلة'),
                  subtitle: const Text(
                    'هذا الموقع تجريبي حالياً',
                  ),
                  value: isLocationConfirmed,
                  activeColor: AppColors.primary,
                  onChanged: (value) {
                    setState(() {
                      isLocationConfirmed = value ?? false;
                    });
                  },
                ),
              ),

              const SizedBox(height: 20),

              // الانتقال للشاشة الثالثة
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: isLocationConfirmed
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => IssueTypeScreen(
                                selectedDepartment:
                                    widget.selectedDepartment,
                              ),
                            ),
                          );
                        }
                      : null,

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
\\تأكيد الموقع