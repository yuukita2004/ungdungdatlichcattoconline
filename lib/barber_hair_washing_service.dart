import 'package:flutter/material.dart';
import 'barber_washing_artisan_list.dart';

class BarberHairWashingService extends StatelessWidget {
  const BarberHairWashingService({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const onSurfaceColor = Color(0xFFE5E2E1);
    const surfaceContainer = Color(0xFF20201F);
    const surfaceContainerHigh = Color(0xFF2A2A2A);

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
                      const Text('HAIR WASHING', style: TextStyle(color: onSurfaceColor, fontSize: 48, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -1)),
                      const Text('& MASSAGE', style: TextStyle(color: themeColor, fontSize: 48, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -1)),
                      const SizedBox(height: 24),
                      const Text('Khám phá nghệ thuật thư giãn từ thảo mộc truyền thống. Nơi gột rửa mọi ưu phiền và tái tạo năng lượng cho tâm hồn giữa không gian Atelier sang trọng.', style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6)),
                      const SizedBox(height: 32),
                      Container(width: 80, height: 4, color: themeColor),
                      const SizedBox(height: 8),
                      const Text('SINCE 1994 • HERITAGE QUALITY', style: TextStyle(color: Colors.white24, fontSize: 10, letterSpacing: 2, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 20))]),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuA2L7bnaqtpQWisTBs9oZ7Pzgkpm_BcH2aGCOjw5-FGwqx9Tt_eI0vT8kxeB8D7QvsPvTEnDA-X4fIdmftd5VULVAzr24jFv7DHWlVWpp9GalakdpvnhySiRWSTPG_gaCFZyH-RKxhg1l1Nd0jPBGpVZ1c-FSWtlSPyc_SywmGIKKFkGEiYYte4uz7AHW7PNhbv0ppoBq2MYIvxydkCBHuDumIALUWEn9TiVYuN_pXmA-9PwPsZheLy_gysDZF8wjODHmVnUsX7_ABs',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                              color: Colors.grey,
                              colorBlendMode: BlendMode.saturation,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -16, left: -12,
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(color: const Color(0xFF753401), borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 10, offset: const Offset(4, 4))]),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [Icon(Icons.spa, color: Color(0xFFFB9F66), size: 32), SizedBox(height: 8), Text('TINH TÚY THẢO MỘC', style: TextStyle(color: Color(0xFFFB9F66), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1))]),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      _buildServiceCard(
                        context,
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBKP_tr73HzyZUtLytoTrCIuHu_3eXtVc5wbiegmYFcASHco1unrFri_00Ql1Zi4EU3BRKXI_hU4t45lfzNqiiSNbtEfWDpSI18hjyGnHE0mJlLAL7PAfBeoLlB6rm60EMZgV7zEmIyM-rO8UV1UtrKbjK_vco5WlLzQDMtOgcFI_ur7lPevuiHDi3H8tRpjckVodBJY731G2H-EPjjI2zrYg7Wci3NskTTVj4FAIPMj3SCHbj_5sbV0l7n4Sx1q2vbOJIodACAjDD8',
                        'Gội đầu thảo dược truyền thống', '30 phút', '50.000 VNĐ', themeColor, surfaceContainer, isBestseller: true,
                      ),
                      const SizedBox(height: 32),
                      _buildServiceCard(
                        context,
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDdEcaIAdKwhU8vYrju8ZLPcF3e1E5uYVUWio4AsD9TfaoRDAfAXFFnOw4yrYuH2ROmaibtjQhXYEEJp_YI0qpVNpgRpQmf_ezYiwQM28AqzS9Z3DfD1gJ3K1p_bAQNGdCyvkLp3SkKw69S-iX2ejR8k2ByauTktGIo1UC1-Y8sAFP17TJIoEo3bcFDp2XO6kq6oz67hnBPU8Ootgse-5L1k4cxwHdLr923dJziAM2Np2HjYSiUqkfB09kOlAhxKAGJbV-8Uy3z6SWP',
                        'Gội đầu massage cổ vai gáy', '45 phút', '100.000 VNĐ', themeColor, surfaceContainerHigh, isFeatured: true,
                      ),
                      const SizedBox(height: 32),
                      _buildServiceCard(
                        context,
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCbyMcyWHDvJYL59ZfVNnrvLNhM5F_TNyLkVzqEJ-4wZ7wBM9qpxOixlDqSPrtmJvXVNr-RQWWKQovqFyC2KaK_Ja83xzGcdOO6--WbEF_n4vjB6a27D2CRx3bOckLNAh1Mjf_Kb9Gx2OpsnJo4y4fFJ_N8Eo8CwDAb9yVFxLZrkrPWyK7eAhhgqD_3-0654FItNyTkcQ45ST7kj6XCfa8KuTkWu4hsowYGFO001fLFKiGVp3qZoRWMBM6RyXcZ-jjY4Ai6Fa7abPLo',
                        'Gội đầu chuyên sâu dưỡng tóc', '60 phút', '150.000 VNĐ', themeColor, surfaceContainer,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80),
                _buildQuote(themeColor),
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
          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCFZjXBEtuzY82ORR7c5iHnrix1q9F5PiWgb36Dra8Jc33x_VylwS-PIgJDqOyoSiA22O7P-dAOisUbSShFdmhImODITQj822vp_kw9EgLWWMJpVJYX3ZuZPAGss54qp-e0qdFEbareHLtBNa3DdkA2qAW_H6lrtzUU4EjmbFv3LMxcyqtB8gvGxWUVVJs_ZTFGMY1lbKje63W1K8i8lOwqynUlD_SJ7lCTXTF6cGAV3IRkFCaM6Z-ClH1Vc3NPzIRTzsW7cK8KaOCt')),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String imageUrl, String title, String duration, String price, Color themeColor, Color bgColor, {bool isBestseller = false, bool isFeatured = false}) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12), border: isFeatured ? Border.all(color: themeColor.withOpacity(0.2)) : null),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(imageUrl, fit: BoxFit.cover, alignment: Alignment.topCenter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(children: [const Icon(Icons.schedule, color: Colors.white38, size: 16), const SizedBox(width: 4), Text(duration.toUpperCase(), style: const TextStyle(color: Colors.white38, fontSize: 11)), const SizedBox(width: 16), const Icon(Icons.payments, color: Colors.white38, size: 16), const SizedBox(width: 4), Text(price.toUpperCase(), style: const TextStyle(color: Colors.white38, fontSize: 11))]),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarberWashingArtisanList(
                            serviceName: title,
                            price: price,
                            duration: duration,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: const Text('ĐẶT LỊCH', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuote(Color themeColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(border: Border.all(color: Colors.white12), borderRadius: BorderRadius.circular(8)),
      child: Column(children: [Icon(Icons.format_quote, color: themeColor.withOpacity(0.4), size: 60), const SizedBox(height: 24), const Text('"Cái răng cái tóc là góc con người. Hãy để chúng tôi chăm sóc vẻ đẹp bản nguyên của bạn."', textAlign: TextAlign.center, style: TextStyle(color: Colors.white70, fontSize: 20, fontStyle: FontStyle.italic, height: 1.5))]),
    );
  }
}
