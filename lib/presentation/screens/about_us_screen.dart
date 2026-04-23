import 'dart:ui';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'main_shell.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.9),
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
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeroSection(),
            const SizedBox(height: 60),
            _buildBrandStory(),
            const SizedBox(height: 60),
            _buildPhilosophy(context),
            const SizedBox(height: 60),
            _buildVision(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'OUR HERITAGE',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 10,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              height: 1.1,
              color: Colors.white,
              fontFamily: 'Noto Serif',
            ),
            children: [
              TextSpan(text: 'Di sản của sự\n'),
              TextSpan(
                text: 'Tinh tế',
                style: TextStyle(
                  color: AppColors.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Hơn cả một tiệm tóc, The Modern Apothecary là nơi giao thoa giữa nghệ thuật cắt tỉa cổ điển và liệu pháp chăm sóc hiện đại.',
          style: TextStyle(
            color: AppColors.onSurfaceVariant,
            fontSize: 18,
            height: 1.6,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _buildBrandStory() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Câu chuyện Thương hiệu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                  fontFamily: 'Noto Serif',
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Ra đời từ niềm đam mê với những giá trị thủ công, chúng tôi tái hiện không gian của một \"nhà thuốc\" cổ - nơi mỗi dụng cụ đều có linh hồn và mỗi đường kéo là một lời khẳng định về bản sắc cá nhân. Chúng tôi tin rằng, diện mạo của một quý ông là tấm gương phản chiếu tâm hồn họ.',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  height: 1.8,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBjMJVEcLOM8hMKxy-N9wUcPWDWUaEXNUXrPFgu15_SFdWKzN0c-MSbTp4GdL6pf3YTV3PDhe7lwEhPo5copBewsf1oVLnxN6h-eOZ9JPVu84yT5HcMrdDqTKUlStdsEDhH5rSOgk1AmBGoNk896G0hQC7qkRUTti3aZG-b50Z9r1rZIASfWkdHIlb1OGtkw9Iu4I7PysOzcgb6rlD9-YUllaF-dmO690OIW4sPqnZj9K-yFhENu9g_V4MpFkX_BlNCEWPHCJ9tvSQ',
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildPhilosophy(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              const Text(
                'Triết lý Phục vụ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontFamily: 'Noto Serif',
                ),
              ),
              const SizedBox(height: 16),
              Container(width: 80, height: 1, color: AppColors.primary),
            ],
          ),
        ),
        const SizedBox(height: 48),
        _buildPhilosophyCard(
          icon: Icons.content_cut,
          title: 'Sự Chính xác',
          description: 'Mỗi đường kéo được thực hiện với sự tập trung tuyệt đối, đảm bảo sự hoàn hảo đến từng milimet.',
        ),
        const SizedBox(height: 24),
        _buildPhilosophyCard(
          icon: Icons.spa,
          title: 'Thư thái',
          description: 'Trải nghiệm không gian tĩnh lặng, tách biệt với xô bồ đô thị để tìm lại sự cân bằng.',
          isHighlighted: true,
        ),
        const SizedBox(height: 24),
        _buildPhilosophyCard(
          icon: Icons.history_edu,
          title: 'Cá nhân hóa',
          description: 'Chúng tôi lắng nghe câu chuyện của bạn để kiến tạo phong cách phản ánh đúng con người bạn.',
        ),
      ],
    );
  }

  Widget _buildPhilosophyCard({
    required IconData icon,
    required String title,
    required String description,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isHighlighted ? AppColors.surfaceContainerHigh : AppColors.surfaceContainerLow, // Sửa ở đây
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 40),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: const TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 14,
              height: 1.6,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVision() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary.withOpacity(0.1), Colors.transparent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tầm nhìn chiến lược',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Noto Serif',
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Tầm nhìn của The Modern Apothecary là trở thành biểu tượng của phong cách sống thượng lưu, nơi các quý ông không chỉ đến để tút tát vẻ ngoài mà còn để kết nối và chia sẻ những giá trị văn hóa tinh hoa.',
                  style: TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 15,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'KHÁM PHÁ THÊM',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
                  ),
                ),
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBL-Xz0NPzneSm1RIfSXPjO3f6m0Yr7XCfgafnqVLbYZDwXKUUxykfcZG8tR_WhrG4pRyZvyLbbFW_gHtOYnvr_FXMdYWSf9lhY1s6UdpIV40GXsRBFvzfaIqXr0sa4r0wakLiX2Hh3aa_tRmNYk1iWa6wC9yxnHO1y6lFZGdtodtYEynFpGcPtvfYXKOA-dqFppP7i_XTf5NfUx07FmArr8qO_teznTagcqu3yvHcQCVkeKGrLb_I23VJ5s3pEDcthLgp1i4unVUE',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(40),
              color: AppColors.background.withOpacity(0.4),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tầm nhìn chiến lược',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Noto Serif',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Tầm nhìn của The Modern Apothecary là trở thành biểu tượng của phong cách sống thượng lưu, nơi các quý ông không chỉ đến để tút tát vẻ ngoài mà còn để kết nối và chia sẻ những giá trị văn hóa tinh hoa.',
                    style: TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'KHÁM PHÁ THÊM',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBL-Xz0NPzneSm1RIfSXPjO3f6m0Yr7XCfgafnqVLbYZDwXKUUxykfcZG8tR_WhrG4pRyZvyLbbFW_gHtOYnvr_FXMdYWSf9lhY1s6UdpIV40GXsRBFvzfaIqXr0sa4r0wakLiX2Hh3aa_tRmNYk1iWa6wC9yxnHO1y6lFZGdtodtYEynFpGcPtvfYXKOA-dqFppP7i_XTf5NfUx07FmArr8qO_teznTagcqu3yvHcQCVkeKGrLb_I23VJ5s3pEDcthLgp1i4unVUE',
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
