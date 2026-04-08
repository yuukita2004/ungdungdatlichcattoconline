import 'package:flutter/material.dart';
import 'barber_beard_artisan_list.dart';

class BarberBeardService extends StatelessWidget {
  const BarberBeardService({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const onSurfaceColor = Color(0xFFE5E2E1);
    const surfaceLow = Color(0xFF1C1B1B);
    const surfaceHigh = Color(0xFF2A2A2A);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('PREMIUM GROOMING', style: TextStyle(color: Color(0xFFE9C400), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 4)),
                      const SizedBox(height: 8),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(text: 'CHĂM SÓC\n', style: TextStyle(color: onSurfaceColor, fontSize: 48, fontWeight: FontWeight.w900, height: 0.9, letterSpacing: -2)),
                            TextSpan(text: 'RÂU NGHỆ THUẬT', style: TextStyle(color: themeColor, fontSize: 48, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: -2)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(width: 80, height: 2, color: themeColor),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 20))],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCg_kD7pmCTi1__tWu2peq1r6HJDszWJbSYy2yjebwazTflOM-kn-52xrVRQb_GjJsP_Q3feG5v5dBlCPRHqd4Y_AVB5aIkSwfdFjf7uzNfwze1_YHOzMdTepnZs30u36TzNji9u87uCcsVaikBiruyhxV5ixBgkiXrZRxYglVcGj7RBOSE4X5fMakmNZNPE2aq9OjnYV4e7lzuxlkrXRCeFkjaHR6a9KBJejh6HygDngOAzjoighAPgIOBkuk4FWsXIDRFchN273fB',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                        color: Colors.grey,
                        colorBlendMode: BlendMode.saturation,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildServiceItem(context, 'LEVEL 01', 'Cạo mặt & Tỉa râu cơ bản', 'Làm sạch da mặt, định hình đường viền râu cơ bản với dao cạo truyền thống và khăn nóng.', '60.000 VNĐ', themeColor, surfaceLow),
                      const SizedBox(height: 24),
                      _buildServiceItem(context, 'SIGNATURE', 'Tạo kiểu râu chuyên nghiệp', 'Thiết kế dáng râu phù hợp khuôn mặt, tỉa mỏng, tạo khối 3D và dưỡng râu bóng mượt.', '120.000 VNĐ', themeColor, surfaceLow),
                      const SizedBox(height: 24),
                      _buildServiceItem(context, 'FULL RITUAL', 'Chăm sóc râu toàn diện', 'Tẩy tế bào chết chuyên sâu, xông hơi tinh dầu, tỉa râu nghệ thuật và massage dưỡng râu với serum cao cấp.', '200.000 VNĐ', themeColor, surfaceHigh, isRecommended: true),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                Center(child: Opacity(opacity: 0.3, child: Column(children: [const Icon(Icons.content_cut, color: onSurfaceColor, size: 40), const SizedBox(height: 8), const Text('HERITAGE ATELIER', style: TextStyle(color: onSurfaceColor, fontSize: 10, letterSpacing: 6))]))),
                const SizedBox(height: 120),
              ],
            ),
          ),
          _buildTopNav(context, themeColor),
        ],
      ),
    );
  }

  Widget _buildTopNav(BuildContext context, Color themeColor) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 24, 16),
      decoration: BoxDecoration(color: const Color(0xFF131313).withOpacity(0.7)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xFFFFD700), size: 28), onPressed: () => Navigator.pop(context)), const SizedBox(width: 8), const Text('Dịch Vụ', style: TextStyle(color: Color(0xFFFFD700), fontSize: 18, fontWeight: FontWeight.bold))]),
          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAnCVkqeaMcK1p8LkYibjAPqBE9ovZ-LZR4rFjwIe6h94pXBfJM7CQwXlmikG8mMksDbqGnFDtfZG3KVCWH3XtKkSbjUTdbrKMzfly72Q3H-GifkQ0UBaTxgqVZop13xJTYdBvn9f6BI5OAOc07KtJEPdZXPEfWAeXBQ6xKPT_IJd_xNTI7McpIgFpUVGANg12Dcz8AHaWsscLeVJfUkHhaoqnX2lMemWMGfpO4IjFyZRp5EdzR28RVAFRRBVZzVGSRBRWXXMaCaylz')),
        ],
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, String label, String title, String description, String price, Color themeColor, Color bgColor, {bool isRecommended = false}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(4), border: Border(left: BorderSide(color: isRecommended ? themeColor : Colors.transparent, width: 2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: isRecommended ? const Color(0xFFE9C400) : Colors.white54, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2)),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(color: Colors.white60, fontSize: 14, fontWeight: FontWeight.w300, height: 1.5)),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.w900)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BarberBeardArtisanList(
                        serviceName: title,
                        price: price,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: themeColor, foregroundColor: Colors.black, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                child: const Text('ĐẶT LỊCH', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
