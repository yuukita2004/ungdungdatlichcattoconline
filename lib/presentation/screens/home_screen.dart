import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/booking_provider.dart';
import 'collection_screen.dart';
import 'main_shell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Tự động nhận diện đường dẫn ảnh theo môi trường chạy
  static String get _imageProxy {
    const String path = '/barber_api/db.php?path=';
    if (kIsWeb) {
      return 'http://localhost$path';
    } else {
      return 'http://10.0.2.2$path';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryContainer),
          onPressed: () => MainShell.of(context)?.openDrawer(),
        ),
        title: const Text(
          'THE MODERN APOTHECARY',
          style: TextStyle(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 16,
            fontFamily: 'Noto Serif',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Consumer<BookingProvider>(
              builder: (context, provider, child) {
                final avatarUrl = provider.userProfile?.avatarUrl;
                return GestureDetector(
                  onTap: () => MainShell.of(context)?.setIndex(3),
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColors.surfaceContainerHigh,
                    backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
                        ? NetworkImage(avatarUrl)
                        : null,
                    child: (avatarUrl == null || avatarUrl.isEmpty)
                        ? const Icon(Icons.person, color: AppColors.primaryContainer, size: 20)
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            _buildIntroSection(),
            _buildBarbersSection(),
            _buildCTASection(context),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Stack(
      children: [
        SizedBox(
          height: 650, 
          width: double.infinity,
          child: Image.network(
            '${_imageProxy}hero.jpg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[900],
              child: const Icon(Icons.wallpaper, color: Colors.white10, size: 100),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  AppColors.background.withOpacity(0.4),
                  AppColors.background,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 60,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'KIẾN TẠO SỰ HOÀN HẢO',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 12,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    height: 1.1,
                    fontFamily: 'Noto Serif',
                  ),
                  children: [
                    TextSpan(text: 'Nơi Sự Chính Xác\n', style: TextStyle(color: Colors.white)),
                    TextSpan(
                      text: 'Gặp Gỡ Truyền Thống',
                      style: TextStyle(
                        color: AppColors.primaryContainer,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trải nghiệm nghệ thuật chăm sóc nam giới trong không gian được thiết kế dành cho quý ông hiện đại. Mỗi đường kéo là một tác phẩm của sự tỉ mỉ và phong cách.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIntroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Những Bậc Thầy Đường Kéo',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
                fontFamily: 'Noto Serif',
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Cách tiếp cận của chúng tôi kết hợp kỹ thuật hàng thế kỷ với thẩm mỹ đương đại. Chúng tôi tin rằng việc chăm sóc tóc không chỉ là một dịch vụ, mà là sự phục hồi bản thân.',
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: 15,
                height: 1.8,
              ),
            ),
            const SizedBox(height: 32),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                '${_imageProxy}intro.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 400,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 400,
                  color: Colors.grey[900],
                  child: const Icon(Icons.image_not_supported, color: Colors.white10, size: 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBarbersSection() {
    return Consumer<BookingProvider>(
      builder: (context, provider, child) {
        final barbers = provider.barbers;
        if (barbers.isEmpty) return const SizedBox.shrink();
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Đội Ngũ Nghệ Nhân',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                      fontFamily: 'Noto Serif',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Những nghệ nhân đứng sau mỗi tác phẩm',
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 550, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: barbers.length,
                itemBuilder: (context, index) {
                  final barber = barbers[index];
                  return _buildBarberCard(
                    barber.name,
                    barber.role.toUpperCase(),
                    barber.image,
                    '4.${9-index}',
                    offset: index % 2 == 1 ? 50 : 0,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBarberCard(String name, String role, String imageUrl, String rating, {double offset = 0}) {
    return Padding(
      padding: EdgeInsets.only(top: offset, left: 12, right: 12),
      child: Container(
        width: 320, 
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    imageUrl,
                    height: 380, 
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 380,
                      width: double.infinity,
                      color: Colors.grey[900],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person, color: Colors.white10, size: 80),
                          const SizedBox(height: 10),
                          Text(name, style: const TextStyle(color: Colors.white24, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.background.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: AppColors.primary, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          rating,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.onSurface, fontFamily: 'Noto Serif'),
            ),
            const SizedBox(height: 6),
            Text(
              role,
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: 2.0,
                color: AppColors.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTASection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: SizedBox(
              height: 350,
              width: double.infinity,
              child: Image.network(
                '${_imageProxy}cta.jpg',
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
                errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey[900]),
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tương lai của Ngành Tóc',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Noto Serif'),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Khám phá tầm nhìn của chúng tôi cho kỷ nguyên mới. Một bộ sưu tập các phong cách và mùi hương được thiết kế cho năm 2026.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CollectionScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 56, vertical: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                  child: const Text('BỘ SƯU TẬP 2026', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 1.2)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
