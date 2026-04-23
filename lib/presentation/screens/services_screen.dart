import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/booking_provider.dart';
import 'booking_screen.dart';
import 'main_shell.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

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
            letterSpacing: -0.5,
            fontSize: 18,
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
                    radius: 16,
                    backgroundColor: AppColors.surfaceContainerHigh,
                    backgroundImage: (avatarUrl != null && avatarUrl.isNotEmpty)
                        ? NetworkImage(avatarUrl)
                        : null,
                    child: (avatarUrl == null || avatarUrl.isEmpty)
                        ? const Icon(Icons.person, color: AppColors.primaryContainer, size: 16)
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'NGHỆ THUẬT THỦ CÔNG',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    letterSpacing: 2,
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
                      color: AppColors.onSurface,
                      fontFamily: 'Noto Serif',
                    ),
                    children: [
                      TextSpan(text: 'Danh mục\n'),
                      TextSpan(
                        text: 'Dịch vụ Cao cấp',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(width: 60, height: 2, color: AppColors.primary),
                const SizedBox(height: 60),

                if (provider.isLoading && provider.services.isEmpty)
                  const Center(child: CircularProgressIndicator(color: AppColors.primary))
                else if (provider.services.isEmpty)
                  const Center(child: Text('Không có dữ liệu dịch vụ', style: TextStyle(color: Colors.white24)))
                else
                  _buildServiceList(context, provider.services),

                const SizedBox(height: 80),
                _buildMembershipSection(context),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildServiceList(BuildContext context, List<dynamic> services) {
    // Hiển thị danh sách dịch vụ linh hoạt theo cặp 2 cột
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 400, // Chiều cao mỗi ô
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        // Tạo hiệu ứng so le nhẹ để giữ phong cách Bento
        return Padding(
          padding: EdgeInsets.only(top: index % 2 == 1 ? 40.0 : 0.0),
          child: _buildServiceCard(
            context: context,
            service: service,
            height: 360,
          ),
        );
      },
    );
  }

  Widget _buildServiceCard({
    required BuildContext context,
    required dynamic service,
    required double height,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookingScreen(
              serviceName: service.name,
              serviceImage: service.imageUrl,
              servicePrice: service.price,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.surfaceContainerLow,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Image.network(
                  service.imageUrl, 
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[900],
                    child: const Icon(Icons.image_not_supported, color: Colors.white10, size: 40),
                  ),
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
                      AppColors.background.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    service.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noto Serif',
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.price,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                    ),
                    child: const Text(
                      'ĐẶT LỊCH',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMembershipSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Đặc quyền Hội viên',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontFamily: 'Noto Serif',
              color: AppColors.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Mở khóa đặt lịch ưu tiên, tư vấn mùi hương độc quyền và các sự kiện riêng tư bằng cách tham gia cộng đồng của chúng tôi.',
            style: TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tính năng đang phát triển'))
              );
            },
            child: Row(
              children: const [
                Text(
                  'TÌM HIỂU THÊM VỀ QUYỀN LỢI',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, color: AppColors.primary, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
