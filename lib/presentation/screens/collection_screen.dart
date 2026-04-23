import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'main_shell.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  // Đường dẫn Proxy PHP để lấy ảnh từ folder images
  static const String _imageProxy = 'http://localhost/barber_api/db.php?path=';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> collections = [
      {
        'title': 'The Neo-Classic',
        'image': '${_imageProxy}col1.jpg',
        'desc': 'Sự kết hợp giữa nét cổ điển và hiện đại.'
      },
      {
        'title': 'Urban Texture',
        'image': '${_imageProxy}col2.jpg',
        'desc': 'Phong cách đường phố năng động.'
      },
      {
        'title': 'Executive Flow',
        'image': '${_imageProxy}col3.jpg',
        'desc': 'Lịch lãm cho những buổi họp quan trọng.'
      },
      {
        'title': 'Midnight Fade',
        'image': '${_imageProxy}col4.jpg',
        'desc': 'Đường cắt sắc nét dưới ánh đèn đêm.'
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'BỘ SƯU TẬP 2026', 
          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 16, fontFamily: 'Noto Serif')
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.primary, size: 20), 
          onPressed: () => Navigator.pop(context)
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        itemCount: collections.length,
        itemBuilder: (context, index) {
          final item = collections[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    item['image']!, 
                    height: 450, 
                    width: double.infinity, 
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 450,
                      width: double.infinity,
                      color: Colors.grey[900],
                      child: const Center(child: Icon(Icons.image_not_supported, color: Colors.white10, size: 50)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  item['title']!, 
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Noto Serif')
                ),
                const SizedBox(height: 8),
                Text(
                  item['desc']!, 
                  style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 15, height: 1.5)
                ),
                const SizedBox(height: 20),
                Divider(color: Colors.white.withOpacity(0.05)),
              ],
            ),
          );
        },
      ),
    );
  }
}
