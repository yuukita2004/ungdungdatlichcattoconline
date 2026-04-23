import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_colors.dart';
import 'main_shell.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

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
          children: [
            _buildHeroSection(),
            const SizedBox(height: 48),
            _buildBentoGrid(context),
            const SizedBox(height: 48),
            _buildIncentiveSection(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Column(
      children: const [
        Text(
          'Lan Tỏa Đẳng Cấp',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Noto Serif',
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Mời bạn bè trải nghiệm dịch vụ chăm sóc cao cấp và nhận ngay ưu đãi đặc quyền cho lần hẹn tiếp theo.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.onSurfaceVariant,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBentoGrid(BuildContext context) {
    return Column(
      children: [
        // QR Code Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.2),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuClgCIzBV6GNgjZdH9Aqzs5Q5TwRKFtDj5G-_NsdeRPc7sNfe5avxyNKVJPCQBBp-N37CF9wgd0XyNCg04O620vNGZo0lKO8-1HqkOH6N7V1KUt6pa7BbR9PCb6Kg5e18xsVhQebr-BENNgFd_0Okv0Bw76n-FHfdBvC5ChjMrbBuJ00vyMBzX8d_eFroNpugrxxdTSP-6vS-XjX6qCtFiv8LTyfazxPsfjw_km1o6L1_Nyh0SOaoLN6u9q5nF8CogW-u64W6H7EQ8',
                  width: 180,
                  height: 180,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'MÃ QR CÁ NHÂN',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Quét để tải ứng dụng ngay',
                style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Referral Code Card
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MÃ GIỚI THIỆU CỦA BẠN',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'MODERN2024',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        fontFamily: 'Noto Serif',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.content_copy, color: AppColors.primary, size: 20),
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: 'MODERN2024'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Đã sao chép mã giới thiệu')),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        // Social Sharing
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CHIA SẺ QUA ỨNG DỤNG',
                style: TextStyle(
                  color: AppColors.onSurfaceVariant,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildShareItem(Icons.send, 'Zalo'),
                  _buildShareItem(Icons.forum, 'Messenger'),
                  _buildShareItem(Icons.share, 'Instagram'),
                  _buildShareItem(Icons.more_horiz, 'Khác'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShareItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: const BoxDecoration(
            color: AppColors.surfaceContainerHighest,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10),
        ),
      ],
    );
  }

  Widget _buildIncentiveSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Đặc Quyền Người Giới Thiệu',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    fontFamily: 'Noto Serif',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Với mỗi người bạn mới hoàn thành dịch vụ đầu tiên, cả hai sẽ nhận được thẻ giảm giá 20% cho bộ sản phẩm chăm sóc râu độc quyền.',
                  style: TextStyle(
                    color: AppColors.onSurfaceVariant,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryContainer],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '-20%',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Voucher',
                  style: TextStyle(
                    color: AppColors.onPrimary,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
