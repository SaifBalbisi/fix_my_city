import 'location_confirmation_screen.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class DepartmentSelectionScreen extends StatefulWidget {
  const DepartmentSelectionScreen({super.key});

  @override
  State<DepartmentSelectionScreen> createState() =>
      _DepartmentSelectionScreenState();
}

class _DepartmentSelectionScreenState
    extends State<DepartmentSelectionScreen> {
  String? selectedDepartment;

  final List<Map<String, String>> departments = [
    {
      'name': 'صيانة الطرق',
      'description': 'الحفر وتلف الشوارع والأرصفة',
    },
    {
      'name': 'الكهرباء والإنارة',
      'description': 'أعطال الإنارة والكهرباء العامة',
    },
    {
      'name': 'النظافة',
      'description': 'تراكم النفايات ومشاكل النظافة',
    },
    {
      'name': 'المياه والصرف الصحي',
      'description': 'تسرب المياه ومشاكل الصرف الصحي',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إنشاء بلاغ جديد'),
          centerTitle: true,
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'اختيار القسم المسؤول',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'اختر القسم المسؤول عن المشكلة التي تريد الإبلاغ عنها.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    final department = departments[index];
                    final isSelected =
                        selectedDepartment == department['name'];

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: AppColors.white,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          department['name']!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(department['description']!),
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
                            selectedDepartment = department['name'];
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
                 
                      onPressed: selectedDepartment == null
                             ? null
                             : () {
                             Navigator.push(
                              context,
                             MaterialPageRoute(
                              builder: (context) => LocationConfirmationScreen(
                             selectedDepartment: selectedDepartment!,
                             ),
                             ),
                             );
                             },
         

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
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
//اختيار القسم المسؤول