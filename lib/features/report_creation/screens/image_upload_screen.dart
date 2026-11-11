



import 'problem_description_screen.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';

class ImageUploadScreen extends StatefulWidget {
  final String selectedDepartment;
  final String selectedIssue;

  const ImageUploadScreen({
    super.key,
    required this.selectedDepartment,
    required this.selectedIssue,
  });

  @override
  State<ImageUploadScreen> createState() =>
      _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? selectedImage;
  bool isLoading = false;

  Future<void> pickImage(ImageSource source) async {
    try {
      setState(() {
        isLoading = true;
      });

      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 80,
      );

      if (!mounted) return;

      setState(() {
        selectedImage = image;
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء اختيار الصورة: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('صورة المشكلة'),
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
                'إضافة صورة المشكلة',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.heading,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'قم بتصوير المشكلة أو اختيار صورة من المعرض.',
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCEBEA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : selectedImage == null
                          ? const Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  size: 65,
                                  color: AppColors.primary,
                                ),
                                SizedBox(height: 12),
                                Text('لم يتم اختيار صورة بعد'),
                              ],
                            )
                          : ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(16),
                              child: Image.file(
                                File(selectedImage!.path),
                                fit: BoxFit.contain,
                              ),
                            ),
                ),
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          pickImage(ImageSource.camera),
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('الكاميرا'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () =>
                          pickImage(ImageSource.gallery),
                      icon: const Icon(Icons.photo_library),
                      label: const Text('المعرض'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              if (selectedImage != null)
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.smart_toy_outlined,
                      color: AppColors.primary,
                    ),
                    title: Text('تحليل الصورة بالذكاء الاصطناعي'),
                    subtitle: Text(
                      'سيتم ربط تحليل AI لاحقاً',
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProblemDescriptionScreen(
        selectedDepartment: widget.selectedDepartment,
        selectedIssue: widget.selectedIssue,
        imagePath: selectedImage?.path,
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
//رفع صورة المشكلة