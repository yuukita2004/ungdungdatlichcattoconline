import 'package:flutter/material.dart';

class BarberVipService extends StatelessWidget {
  const BarberVipService({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceContainerLow = Color(0xFF1C1B1B);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        width: double.infinity,
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              bgColor.withOpacity(0.5),
                              bgColor,
                            ],
                          ),
                        ),
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDzWqoHQ7CVTb8Coi6taKiYUchi_09DYdBSKw29kkOiIIKQdZukIQN2GT5MHlkGfKLj-zr-G1nQf-Bk5dQANo7SZjAjV7TWOH4JjtgSuCcdR6tqb0IrT79e5v4cAkQ_TqGJYxBCDCsU3Qkhf_HGqXNQY2F1eHXvx2C8MMw53eItixS53K8_jUT7VQcwWxnugvn_csyg7pwt0xrLZw35P7xt_Dpmoe6isPPG3K4Nk0twf0nCk5-62FHWyLqj_0J1k4-sO1Fw_D7goQcK',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                          opacity: const AlwaysStoppedAnimation(0.6),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: themeColor.withOpacity(0.2),
                                border: Border.all(color: themeColor.withOpacity(0.3)),
                              ),
                              child: const Text(
                                'THƯỢNG LƯU',
                                style: TextStyle(color: themeColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                              ),
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(text: 'KHÔNG GIAN ', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1)),
                                  TextSpan(text: 'HOÀNG GIA', style: TextStyle(color: themeColor, fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: -1)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // VIP Services Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(width: 48, height: 2, color: themeColor),
                          const SizedBox(width: 12),
                          const Text('GÓI DỊCH VỤ ĐẶC QUYỀN', style: TextStyle(color: themeColor, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
                          const SizedBox(width: 12),
                          Container(width: 48, height: 2, color: themeColor),
                        ],
                      ),
                      const SizedBox(height: 40),
                      
                      _buildStandardVipCard(
                        'Quý Ông Thượng Lưu',
                        '500.000 VNĐ',
                        'Trọn bộ dịch vụ chăm sóc cao cấp dành cho quý ông bận rộn nhưng yêu cầu sự hoàn mỹ.',
                        ['Cắt tạo kiểu Master', 'Gội massage thảo mộc', 'Tỉa râu nóng/lạnh', 'Mặt nạ dưỡng da vàng'],
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDRl7YwelmOr0guoHYQ_L3Lw4hYM2ZL_4FBhVLoK8xmjrbhTqMztE8Y7Lenf9KbSyymFcudtCfusr-3JldYD6_ujt-eWKg-73oS5l7l-bL6NZOQAmnJFNq3AT-HU_3UQBqY8JKWMWY3Yl8cAJdlC7Ef0rPH2XW0hlq6LmrskNGmhqgcPDi5cLUUree8I_tWymmo_ixKfEFUk3QiMjr5m3iud1MUQ720v1UQ29_wHOO4WB6qAndPb1crSSf3paEkzXqMO6rhKkhLh7DP',
                        themeColor,
                        surfaceContainerLow,
                      ),
                      
                      const SizedBox(height: 48), 
                      
                      _buildUltraVipCard(
                        'Trải Nghiệm Hoàng Gia',
                        '1.000.000',
                        'Đỉnh cao của sự hưởng thụ. Một không gian tách biệt hoàn toàn để bạn tái tạo năng lượng.',
                        [
                          {'title': 'Phòng VIP Riêng Biệt', 'desc': 'Sự riêng tư tuyệt đối cho khách hàng thượng lưu', 'icon': Icons.meeting_room},
                          {'title': 'Đồ Uống Cao Cấp', 'desc': 'Phục vụ rượu vang hoặc Coffee thượng hạng', 'icon': Icons.local_bar},
                          {'title': 'Master Barber', 'desc': 'Thực hiện bởi nghệ nhân trên 15 năm kinh nghiệm', 'icon': Icons.content_cut},
                        ],
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDxzo5dPfV8a1D3xGN9XWBkVU2L4dhClsUdDVoOox3HZzS3LFRegJEdp76v42poHiCXSgEUUs1dRMM2Vw2BK6xl6lLk6TDkQROxF3E90omyX15L0q8nnrzzkz5h0A-bkFwHrmTgvVn6600uiR7igDd2CmtMETL2Xlr4cujlKzxsEOaHgWXu7Ewz_1bP4mS3KMwLYTI6s-N8eqVAT2oXaZidU6APM1Z1nOsm4RhZroBUNXxaO_TPF7laPBxEWbbXcDwBItbjKMc9ZJtn',
                        themeColor,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    children: [
                      Expanded(child: _buildDetailCard(Icons.schedule, 'Thời gian', '90-120 PHÚT', themeColor)),
                      const SizedBox(width: 16),
                      Expanded(child: _buildDetailCard(Icons.verified_user, 'Bảo hành', '7 NGÀY', themeColor)),
                    ],
                  ),
                ),
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
          Row(
            children: [
              IconButton(icon: const Icon(Icons.arrow_back, color: Color(0xFFFFD700), size: 28), onPressed: () => Navigator.pop(context)),
              const SizedBox(width: 8),
              const Text('Dịch Vụ VIP', style: TextStyle(color: Color(0xFFFFD700), fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const CircleAvatar(radius: 20, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBzzbeoU06v55asUKaNB0IMJ-iUE7pQ1HPmhR_EKET2yOSn_smNp5vylgFlQft4AOYH87bRaSvoWVuePEEjQLKHjSKHwu0_gBwHSQKPYfyNOHetHtcQ-Tf1uSUSQxFZJ4utLM1BLroq2RSk_uPJSRJSgn5JcCcJ6VZPl5r2qKMBkOK5_nYlIeTvI3ST498rw_2YIX9hISkF24ukkFCPpcS-hU_Kxu6hT4ojwpSYJsnXzV2qOuUSUV9kY_h5S5DgJVgEod14tzbl8l_B')),
        ],
      ),
    );
  }

  Widget _buildStandardVipCard(String title, String price, String desc, List<String> features, String imageUrl, Color themeColor, Color bgColor) {
    return Container(
      decoration: BoxDecoration(color: bgColor, border: Border(left: BorderSide(color: themeColor, width: 4))),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 4 / 3, // Chuyển sang 4:3 để lấy thêm chiều cao
            child: ClipRRect(
              child: Image.network(imageUrl, fit: BoxFit.cover, alignment: Alignment.topCenter, color: Colors.grey, colorBlendMode: BlendMode.saturation),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)), Text(price, style: TextStyle(color: themeColor, fontSize: 18, fontWeight: FontWeight.w900))])),
                    const Icon(Icons.workspace_premium, color: Color(0xFFFFD700), size: 32),
                  ],
                ),
                const SizedBox(height: 12),
                Text(desc, style: const TextStyle(color: Colors.white60, fontSize: 13, height: 1.5)),
                const SizedBox(height: 20),
                Wrap(spacing: 16, runSpacing: 8, children: features.map((f) => Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.check_circle, color: themeColor, size: 14), const SizedBox(width: 6), Text(f, style: const TextStyle(color: Colors.white70, fontSize: 11))])).toList()),
                const SizedBox(height: 24),
                SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: themeColor, foregroundColor: Colors.black, padding: const EdgeInsets.symmetric(vertical: 18), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)), child: const Text('ĐẶT TRƯỚC', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2)))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUltraVipCard(String title, String price, String desc, List<Map<String, dynamic>> perks, String imageUrl, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(gradient: LinearGradient(colors: [themeColor.withOpacity(0.5), themeColor])),
      child: Container(
        color: const Color(0xFF131313),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Expanded(child: Text(title.toUpperCase(), style: TextStyle(color: themeColor, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -1))), const Icon(Icons.diamond, color: Color(0xFFFFD700))]),
            const SizedBox(height: 12),
            Text(desc, style: const TextStyle(color: Colors.white70, fontSize: 14, fontStyle: FontStyle.italic)),
            const SizedBox(height: 24),
            Stack(
              clipBehavior: Clip.none, 
              children: [
                AspectRatio(
                  aspectRatio: 4 / 3, // Chuyển sang 4:3 để lấy thêm chiều cao không gian
                  child: ClipRRect(borderRadius: BorderRadius.circular(4), child: Image.network(imageUrl, fit: BoxFit.cover, alignment: Alignment.center)),
                ),
                Positioned(
                  bottom: -12,
                  right: -12,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: themeColor, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8, offset: const Offset(4, 4))]),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('GIÁ TRỊ', style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w900)), Text(price, style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w900))]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Column(children: perks.map((p) => Padding(padding: const EdgeInsets.only(bottom: 16.0), child: Row(children: [Icon(p['icon'], color: themeColor, size: 20), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(p['title'], style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)), Text(p['desc'], style: const TextStyle(color: Colors.white38, fontSize: 12))]))]))).toList()),
            const SizedBox(height: 16),
            SizedBox(width: double.infinity, child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [themeColor.withOpacity(0.8), themeColor])), child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, foregroundColor: Colors.black, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(vertical: 20), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)), child: const Text('ĐẶT TRƯỚC NGAY', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2))))),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard(IconData icon, String label, String value, Color themeColor) {
    return Container(padding: const EdgeInsets.all(20), color: const Color(0xFF0E0E0E), child: Column(children: [Icon(icon, color: themeColor, size: 32), const SizedBox(height: 12), Text(label.toUpperCase(), style: const TextStyle(color: Colors.white38, fontSize: 9, fontWeight: FontWeight.bold)), Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w900))]));
  }
}
