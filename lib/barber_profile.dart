import 'package:flutter/material.dart';

class BarberProfile extends StatelessWidget {
  const BarberProfile({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const onSurfaceColor = Color(0xFFE5E2E1);

    // QUAN TRỌNG: Loại bỏ Scaffold để dùng Scaffold cha từ MainScreen
    return Material(
      color: bgColor,
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Container(
                color: themeColor,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 140),
                  _buildProfileHero(themeColor, onSurfaceColor),
                  const SizedBox(height: 40),
                  _buildLoyaltySection(themeColor),
                  const SizedBox(height: 40),
                  _buildSettingsSection(themeColor),
                  const SizedBox(height: 40),
                  _buildLogoutButton(),
                  const SizedBox(height: 40),
                  const Text(
                    'THE HERITAGE ATELIER © 2024',
                    style: TextStyle(
                      color: Colors.white10,
                      fontSize: 10,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
          _buildTopNav(themeColor),
        ],
      ),
    );
  }

  Widget _buildTopNav(Color themeColor) {
    return Builder(
      builder: (context) => Container(
        padding: const EdgeInsets.fromLTRB(16, 40, 24, 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.85),
          border: Border(bottom: BorderSide(color: themeColor.withOpacity(0.1), width: 0.5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, color: themeColor, size: 28),
                  onPressed: () {
                    // Mở drawer của Scaffold ở MainScreen
                    Scaffold.of(context).openDrawer();
                  },
                ),
                const SizedBox(width: 8),
                Text(
                  'KTA BARBER',
                  style: TextStyle(
                    color: themeColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: themeColor.withOpacity(0.3), width: 1.5),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAtfDOOnyqmjGm5XaAGWOlsSQSAgXsqXahgXp79Y2KTBMLqS4O0LDo2VnMyBMt4vIIFscvcLxDc5AiJfwKRXidwRuX83xoq6Ll4vKF84o0IjjQbvX2AzAOMp4hoaOxWyYBKviq3ZztlwT6WkBK4tMBeP3T2bJDWH5-3rAkZ_FHnL4VwkOvSK41hKeRXZkqfZaKQzhtKuctBUgeuaMxyYEL-3VtndYe4Y22soS855pWYhKUjoWXXYIXf8g9DsN_mYKCy4Rw25vFD_NuX'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHero(Color themeColor, Color onSurfaceColor) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 140,
              height: 140,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: themeColor, width: 2),
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB6s0RysPxlDdzxhGwdyzcCwjlPkh01edXsDQF1yx3L82DqBnIsnBfiECHDHv-DFhMMUqGRhauOk-NSseOmXDXugOvSfH1pQhhOEQq8Ht9pffjCyxQ6x6XpvQev2p6pi0dvDEEusFkLAr_8It-4_L_4voCzhIOJgxtYaiUW7BX8Gd00MmQauMBwDHtEX2fDf99zPalvT_Vrxbz-qOU5qaRTu_2aFfO9loA9TwBX3r3L4auUgUuc_WWFOPYFRvO1kc9XUr3ew3CqTcRg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 4, offset: const Offset(0, 2))
                  ],
                ),
                child: const Text(
                  'PREMIUM',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 9,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Nguyễn Minh Hiếu',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: onSurfaceColor,
            fontSize: 32,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'KHÁCH HÀNG THÂN THIẾT',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 11,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildLoyaltySection(Color themeColor) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFF20201F),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'HẠNG THÀNH VIÊN',
                        style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Hạng Bạc',
                        style: TextStyle(color: themeColor, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'TÍCH LŨY',
                        style: TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '500 ',
                              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900),
                            ),
                            TextSpan(
                              text: 'điểm',
                              style: TextStyle(color: Colors.white38, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Stack(
                children: [
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.65,
                    child: Container(
                      height: 8,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [themeColor, themeColor.withOpacity(0.5)]),
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(color: themeColor.withOpacity(0.2), blurRadius: 8, spreadRadius: 1)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Còn 250 điểm nữa để lên Hạng Vàng',
                    style: TextStyle(color: Colors.white38, fontSize: 11, fontStyle: FontStyle.italic),
                  ),
                  Icon(Icons.info_outline, color: themeColor.withOpacity(0.5), size: 14),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildInfoCard(
                Icons.stars,
                'Ưu đãi',
                '-10% Dịch vụ',
                const Color(0xFF20201F),
                const Color(0xFFFB9F66),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoCard(
                Icons.history_edu,
                'Lần cuối',
                '12 thg 10',
                const Color(0xFF20201F),
                const Color(0xFFABCDCD),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoCard(IconData icon, String label, String value, Color bgColor, Color iconColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 24),
          const SizedBox(height: 16),
          Text(
            label.toUpperCase(),
            style: const TextStyle(color: Colors.white38, fontSize: 9, letterSpacing: 1, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(Color themeColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 4, bottom: 16),
          child: Text(
            'CÀI ĐẶT TÀI KHOẢN',
            style: TextStyle(
              color: Colors.white24,
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildSettingItem(Icons.person_outline, 'Thông tin cá nhân', 'Cập nhật hồ sơ & ảnh đại diện', themeColor),
        const SizedBox(height: 12),
        _buildSettingItem(Icons.account_balance_wallet_outlined, 'Phương thức thanh toán', 'Quản lý thẻ & ví điện tử', themeColor),
        const SizedBox(height: 12),
        _buildSettingItem(Icons.map_outlined, 'Địa chỉ salon', 'Các chi nhánh bạn đã ghé thăm', themeColor),
        const SizedBox(height: 12),
        _buildSettingItem(Icons.notifications_none_outlined, 'Thông báo', 'Quản lý tin nhắn & lịch hẹn', themeColor),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, String subtitle, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF20201F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.03)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: themeColor, size: 22),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white38, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white12, size: 14),
        ],
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFFB4AB).withOpacity(0.05),
        border: Border.all(color: const Color(0xFFFFB4AB).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.logout_rounded, color: Color(0xFFFFB4AB), size: 20),
          SizedBox(width: 12),
          Text(
            ' ĐĂNG XUẤT',
            style: TextStyle(
              color: Color(0xFFFFB4AB),
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
