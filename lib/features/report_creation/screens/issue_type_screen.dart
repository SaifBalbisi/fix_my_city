
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import 'image_upload_screen.dart';

class IssueTypeScreen extends StatefulWidget {
  final String selectedDepartment;

  const IssueTypeScreen({
    super.key,
    required this.selectedDepartment,
  });

  @override
  State<IssueTypeScreen> createState() => _IssueTypeScreenState();
}

class _IssueTypeScreenState extends State<IssueTypeScreen> {
  String? selectedIssue;

  final Map<String, List<String>> issueTypes = {
    'صيانة الطرق': [
      'حفرة في الشارع',
      'تلف الرصيف',
      'تشققات الطريق',
      'مشكلة أخرى',
    ],
    'الكهرباء والإنارة': [
      'عمود إنارة معطل',
      'أسلاك كهربائية مكشوفة',
      'انقطاع الإنارة',
      'مشكلة أخرى',
    ],
    'النظافة': [
      'تراكم النفايات',
      'حاوية نفايات تالفة',
      'مخلفات في الشارع',
      'مشكلة أخرى',
    ],
    'المياه والصرف الصحي': [
      'تسرب مياه',
      'انسداد الصرف الصحي',
      'طفح مياه الصرف',
      'مشكلة أخرى',
    ],
  };

  @override
  Widget build(BuildContext context) {
    final issues = issueTypes[widget.selectedDepartment] ?? [];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('نوع المشكلة'),
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
                'اختيار نوع المشكلة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'القسم: ${widget.selectedDepartment}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: issues.length,
                  itemBuilder: (context, index) {
                    final issue = issues[index];
                    final isSelected = selectedIssue == issue;

                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(issue),
                        trailing: Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.circle_outlined,
                          color: isSelected
                              ? AppColors.primary
                              : Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            selectedIssue = issue;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: selectedIssue == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ImageUploadScreen(
                                selectedDepartment:
                                    widget.selectedDepartment,
                                selectedIssue: selectedIssue!,
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
//اختيار نوع المشكلة