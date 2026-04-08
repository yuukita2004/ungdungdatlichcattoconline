import 'package:flutter/material.dart';
import 'barber_beard_service.dart';
import 'barber_hair_washing_service.dart';
import 'barber_vip_service.dart';
import 'barber_artisan_list.dart';

class BarberServiceList extends StatelessWidget {
  const BarberServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const onSurfaceColor = Color(0xFFE5E2E1);

    return Material(
      color: bgColor,
      child: Stack(
        children: [
          // Background Pattern Decor (Grain Overlay simulated)
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                'https://www.transparenttextures.com/patterns/carbon-fibre.png',
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  _buildHeader(themeColor, onSurfaceColor),
                  const SizedBox(height: 40),
                  _buildCategories(context, themeColor),
                  const SizedBox(height: 32),
                  _buildServiceItem(
                    context,
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDDk6sUYlt4ZHRnXKSB93Bgc0XdOXdRuvLSgT-m4Q3lpUReTmJH3h_wva3HnFfucC9vmw4b5XsEZcZTPU5b7tr2sNyv1DcVgGtUQaLDUezLw1X0ZCePee_xuuf1qpoiicbaLrX3BNAykS_c_YkBo9DSCWBnrpfOfK7XyskuC7u02kV_o-YgnXkkwGEIGB3h-WifwOPQDeyi4_bGYLzicEj_8yMo6F1dXCsCFad_hdPFYKQdpcH3OH9svq1Q9Gf-HlrPX6au_JLerZyU',
                    'Cắt Tóc & Gội',
                    'Combo Cơ Bản',
                    'Gồm: Tư vấn kiểu tóc, cắt tạo kiểu, gội đầu massage và sấy tạo form chuẩn salon.',
                    '80.000đ',
                    themeColor,
                    isPopular: true,
                  ),
                  const SizedBox(height: 32),
                  _buildServiceItem(
                    context,
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBK0N4WSj-UuGwiQW1zm02gL7nHUlgb7gQbYDoNDidNbsvIi_jS4cei55lLCkqGe6XTqpR48kh7EFUvwQICtbNK8ygxz-aaLvvwfej_gNKCkx0JkNKzzLgIHBu1OmqwcV8Hipah6ULi4MH_W2noxHE0FgQ2pKw3Jxk0DZ0NgavV4kEY2tj-d87KIzHdeHvLil4ZMOLELPtgWmbgMg--CGGtNPUNZRYYe5fiJK4makYZJm3qg3cBWicu1qCsMJ5S1toVcfjVhmJPaJgj',
                    'Cắt Tóc',
                    'Mohican Hiện Đại',
                    'Kỹ thuật fade sắc nét kết hợp tạo texture phần đỉnh tóc, mang lại vẻ ngoài năng động.',
                    '100.000đ',
                    themeColor,
                  ),
                  const SizedBox(height: 32),
                  _buildServiceItem(
                    context,
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuB_zexMsCLj3Zv7O7bJMWTk7QHXbbO1YFpHk5xM_2TLjolGEN8N9UyBbXGgz1hxJz1MZfXBH-J-yqLURAu5VE2O5ymC1UeGOHa5L77zTaFNnHfRAW1yu2X4_bPszE2TpF-Ce5Ry3kWGUGaPjdtJwP3NLQu1163Yd5QbRNbqYcydxLvaafqXAiAON7miNaAorg4i1PA53p-20lIxnzLm_ty9rtvexgXhIl62LDMMWgng7kuVu7J069BkTbKIOcAWcpw_bvdF-eN6l-RT',
                    'Cắt Tóc',
                    'Side Part Lãng Tử',
                    'Kiểu tóc quý ông cổ điển, chia ngôi chuẩn xác và vuốt sáp tạo độ bóng sang trọng.',
                    '120.000đ',
                    themeColor,
                  ),
                  const SizedBox(height: 32),
                  _buildVIPServiceCard(context, themeColor),
                  const SizedBox(height: 40),
                  _buildCTASection(themeColor),
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
          color: Colors.black.withOpacity(0.7),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, color: themeColor, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'KTA BARBER',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
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
                border: Border.all(color: themeColor.withOpacity(0.3)),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCDae7gSzPWQc7jyi45P-zxVHw_ybMRw1D15gwPacvNBXdm-Pui9-F0hjgHh6hRtfVGGPa_J3FAr8p9RiDWWYkrCKpx1uRTxyuTmdxa9y1EXsPRoeMcLx063IT_qVALn3X5CCfxMJwODwfDHMADkvDC4F5HigNMSth0QVJjRr3tW8t7_9ih0uz5sdGGq_1gyXzQVqiJCb5QRRjP1SlJw5bSLKzcgYi9R6yfMn-mYjzDyB57p99QCMQxg51-L2yI2Shlv6oRq9Y48hZV'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Color themeColor, Color onSurfaceColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'KTA BARBER',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 12,
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'DANH MỤC\n',
                style: TextStyle(
                  color: onSurfaceColor,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              TextSpan(
                text: 'DỊCH VỤ',
                style: TextStyle(
                  color: themeColor,
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 80,
          height: 4,
          color: themeColor,
        ),
      ],
    );
  }

  Widget _buildCategories(BuildContext context, Color themeColor) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryTab(context, 'Cắt Tóc', true, themeColor),
          _buildCategoryTab(context, 'Gội Đầu', false, themeColor, isWashing: true),
          _buildCategoryTab(context, 'Chăm Sóc Râu', false, themeColor, isBeard: true),
          _buildCategoryTab(context, 'Dịch Vụ VIP', false, themeColor, isVip: true),
        ],
      ),
    );
  }

  Widget _buildCategoryTab(BuildContext context, String title, bool isActive, Color themeColor, {bool isBeard = false, bool isWashing = false, bool isVip = false}) {
    return GestureDetector(
      onTap: () {
        if (isBeard) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarberBeardService()),
          );
        } else if (isWashing) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarberHairWashingService()),
          );
        } else if (isVip) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BarberVipService()),
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? themeColor : const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.white70,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String imageUrl, String title, String subtitle, String desc, String price, Color themeColor, {bool isPopular = false}) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: Colors.white12, width: 2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                  ),
                ),
              ),
              if (isPopular)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: themeColor,
                    child: const Text(
                      'PHỔ BIẾN',
                      style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '$title\n',
                        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: subtitle,
                        style: TextStyle(color: themeColor.withOpacity(0.7), fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BarberArtisanList()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        color: const Color(0xFF353535),
                        child: const Text(
                          'ĐẶT LỊCH',
                          style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVIPServiceCard(BuildContext context, Color themeColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BarberVipService()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF753401).withOpacity(0.2),
          border: Border(left: BorderSide(color: themeColor, width: 2)),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuA-BDI9gStatzoapwUl5nvVzRke_GEVW_o5oWBaSTx8w9mq6HdMlh-D5qfN_1Ow-Gvf8dHBH5K84oXF_ZZg3HVA1na7tJrrSIHnGNNLd1PS7ux9IasoW2GgD5OPeuCOxiPoYpYbJQzgjpIzVk3IcxgcVgXEy-EYaYDxoaVApuDEPd2pFpQaWUUqQrcUUVwfC9mr7f6TbswYVs3kE7jC8vfBC4HZ2VeQVl5LFa43JxV82NL_rbNECw_-IYfIJWjzPOeT8bMGGI74aRVc'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'DỊCH VỤ\n',
                            style: TextStyle(color: Color(0xFFFFD700), fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'HOÀNG GIA VIP',
                            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Trải nghiệm thượng lưu với: Cắt, gội, massage mặt, đắp mặt nạ thảo dược và tỉa râu nghệ thuật.',
                      style: TextStyle(color: Colors.white60, fontSize: 13, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '350.000đ',
                          style: TextStyle(color: Color(0xFFFFD700), fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          color: themeColor,
                          child: const Text(
                            'XEM CHI TIẾT',
                            style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCTASection(Color themeColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      color: const Color(0xFF2A2A2A),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CHƯA TÌM THẤY PHONG CÁCH CỦA BẠN?',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 12),
              const Text(
                'Đội ngũ stylist của Heritage Atelier sẽ tư vấn trực tiếp dựa trên khuôn mặt và chất tóc của bạn.',
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    'XEM BỘ SƯU TẬP 2026',
                    style: TextStyle(color: themeColor, fontWeight: FontWeight.bold, letterSpacing: 1, fontSize: 12),
                  ),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: themeColor, size: 16),
                ],
              ),
            ],
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Icon(Icons.content_cut, size: 100, color: Colors.white.withOpacity(0.05)),
          ),
        ],
      ),
    );
  }
}
