import 'package:flutter/material.dart';

class BarberCollection extends StatelessWidget {
  const BarberCollection({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const backgroundColor = Color(0xFF131313);
    const surfaceColor = Color(0xFF20201F);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          // Top AppBar matching the HTML's fixed header
          SliverAppBar(
            backgroundColor: Colors.black.withOpacity(0.7),
            floating: true,
            pinned: false,
            elevation: 10,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: themeColor),
              onPressed: () => Navigator.of(context).maybePop(),
            ),
            title: const Text(
              'BỘ SƯU TẬP 2024',
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ),

          // Hero Section
          SliverToBoxAdapter(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        backgroundColor.withOpacity(0.2),
                        backgroundColor,
                      ],
                    ),
                  ),
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuDh6BLQOtSMJhtEbQ_Zj3YEUZyKuAwkmfTqU7b6nQDZkPOChBEMRzPQBIaIHw3d7IPxxP03AgqWLqbQuUfWboSYaNqIe1yR7WsGqUku5mBf6C8Oy8HWq58aRPQ-H6k3MsMoBW5No69l70WF_eyFs1RKDq_Y3keXOb_Hmn0gY0W9Pt2AjHr_0LrRtPbR59m8upRiwN1ktM6TQvYMOwOpBsc32JILaM7FJ3HidcR_UtgJqgSnP2Qwg-WRjSGKSKB4TEthzY467cugQhhi',
                    fit: BoxFit.cover,
                    color: Colors.black.withOpacity(0.4),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Text(
                        'THE HERITAGE ATELIER',
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 12,
                          letterSpacing: 4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'BỘ SƯU TẬP 2024 ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                letterSpacing: -1,
                              ),
                            ),
                            TextSpan(
                              text: '-',
                              style: TextStyle(color: themeColor, fontSize: 40),
                            ),
                            TextSpan(
                              text: ' TỔNG HỢP',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(width: 80, height: 4, color: themeColor),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Gallery Grid
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Item 1: Layer Nam Lãng Tử (Large)
                _buildGalleryItem(
                  'Layer Nam Lãng Tử',
                  'MỀM MẠI & KẾT CẤU',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDgHVuvOGFeBrBJcWFNp5EBHNDTUD6vkrvN0hAgttPDVgmoLMmVxuG49X4ikVrXR_0gOz3yo_4awI7LRbt10wjEzH4CNQ1MMtIhrG0PpL_RTsPrHTQZOl-_k0fXgt7IQoFLBoAhHYhNwIKpiE5kObIzpXCJ9RhndDUNu-fJuuiGE_OM6JWK-kGOVaOzXsf3z1dg3TUFsnBX33s0Nw2EtnC9lX7WHOEqIDjRLrfUMcH1pTO2nthaosMDcVSdcOK6PjmWCifSx2qtRnA-',
                  aspectRatio: 4 / 5,
                  titleColor: themeColor,
                ),
                const SizedBox(height: 40),

                // Item 2: Combed Over Pompadour
                _buildGalleryItem(
                  'Combed Over Pompadour',
                  'Sự kết hợp hoàn hảo giữa nét cổ điển và tinh thần hiện đại.',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB7OFAAWcmnIIO9qLccKAM-xN3_nPFMN5XZbr2mfnobYL6n_7EKh1jB1HOwqOlVI1efuHzSJIvmocEx2nYo7lm6mLrF27bdmfsfi6YK9g50IbSxgV8F6ht285BYlHCUcsFhaEmSK7VoUzn-wlivL60zFUx1WJQgAVTElN1Ce1bnrjQ0XL2ZagTpmxPnrmEzpF06WIxQBaD6998u8C-AXqR2JU3KHUTddTeIydfRfIa-egG8AZy4uc_S7nqdONMMjnN6DvtOrcFWw6uM',
                  aspectRatio: 1,
                  titleColor: themeColor,
                  isBodyText: true,
                ),
                const SizedBox(height: 40),

                // Item 3: Textured Spiky
                _buildGalleryItem(
                  'Textured Spiky',
                  'PHONG CÁCH ĐÔ THỊ NĂNG ĐỘNG',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBgKSz7UNJj4KWfgnro-0oCylF9cOmB7-KprnUGK192HPzS7pvEIg1llIp0fAb84uc8_c4OP_CmHNYl68I0AR2nCOYXk_nGu6jKGtf1dCxrcg0Yo7DhZT96y0bjUaCIhoeRGNAaEC5ylb_q5uHxVicXuAAOZFgENVraNDSL_0_jkKCmCgIeUrUd1GllfAledegzCEaVvv18nQGgtz_vGqOG68ufvHxpfXQOF8LQ4ZFKTVWb0BWuUt6eZWDsyfCLeqi3tBnBeL-ZOeoh',
                  aspectRatio: 3 / 4,
                  titleColor: themeColor,
                  hasLeftBorder: true,
                ),
                const SizedBox(height: 40),

                // Item 4: Tóc Dài Lãng Tử
                _buildGalleryItem(
                  'Tóc Dài Lãng Tử',
                  'Tự do và phóng khoáng. Một phong cách đòi hỏi sự kiên nhẫn và không dành cho số đông.',
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuD-uYr9F6sj-sxuG0Q6b120m3eJaK3IkSIgSNOMa4NOIoWiHWpuf0x74cWwTE4fjNTARnhnSykJqFnkT__jTBgUHCXCxS4PtyW-2ZQKyt26PbuugTlJw6QB_yHyF6YO-odDWWdMK3g8QJhuYBZ6K1uIrLFFP4olbsGOOIk-j6I-pJiNrgE7eYmOINlPb8f1rPjbeayfbkQN7OObiNi6f-6YcJ4KMLH2kxlHzQmdt3rBR8_Wq2uHI3m0WCKB6yOimrsP3xZr6yOOpiaR',
                  height: 500,
                  titleColor: themeColor,
                  isBodyText: true,
                ),
                const SizedBox(height: 40),

                // Duo: Slick Back & Crew Cut
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildGalleryItem(
                        'Slick Back Cổ Điển',
                        'SỰ CHÍNH XÁC VƯỢT THỜI GIAN',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuAtbaCE9Wvcby7R7mfj_G455K8dNjUJ_P0BxUEWg0CGn5B1RFIfKRNj9KrXNI5QaR1g9CKCHJRuD7HKMEaxUzV4h04DG_u5GI1iDctC79TxqPEgy4blAhnqlNKCC16WdPesBbJeiD8iCGcmt4NtiU9u2BiekcVSymCeh5MjiD9C97XUuWYFbN8tRYmas2HexdU_4TVZm05eBV3j2ngnP18i-HgXxlTdAee7Icd3sWoLL27x6sg2YxAlN343B7rFmwdLQTkzjrMAJyPq',
                        aspectRatio: 16 / 9,
                        titleColor: themeColor,
                        smallTitle: true,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildGalleryItem(
                        'Tóc Crew Cut',
                        'SỰ HOÀN HẢO CHUYÊN NGHIỆP',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCqlRmcQGSFpgRrjagbEFkPqfJ1PZUSDdtsMjUDj9GX_rq0F9eVxdEttEIZNmEWXhDR50sejZpWoAtPmuqfje7bcMrGLiI54kz5euBT1kq78r2BECBp_YMjzqHd03OrUt5Y_iNvisgembHxpPhg3NAlvbLN-xWpD1u76uf4DJiUXP509pzQr1TJfFsw3X1nFeJMd6szr2BQnz0L3EfbEBD3A_hxdC-tJiN1jz852DYHVD706KrWFO7UuvpN1wSSZKh2kxmBlcjaSwR6',
                        aspectRatio: 16 / 9,
                        titleColor: themeColor,
                        smallTitle: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Trio Grid
                _buildTrioGrid(themeColor, surfaceColor),
                const SizedBox(height: 40),

                // Item 10: Man Bun Đường Phố (Spotlight)
                Container(
                  color: const Color(0xFF0E0E0E),
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    children: [
                      Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDJpsCWFZbYREyKonsra7ANR-FETvfe-eL2NIJMHVMy53sQ7Yyn6lVDTmQZPz40F2WjMRXDtFfIRJmROA7rDoslvwNJbn_sQ0E9Vj860Jjf-E9x5LiGy6jUvAZhhc60X1eHH88NFQ5kWTNW5RtSVklAOUGmKHV1rowS4ZIizDO-VFEycXj7z6UTkskb0XTU4PaQt3JAvfzf2ZhtmRsUz4loRxdo_EcfQsednvyD_oyVUptgRiwGkhF1LSLTsr7RRbaPLd_bu5SbNgPW',
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'TIÊU ĐIỂM PHONG CÁCH',
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Man Bun Đường Phố',
                              style: TextStyle(
                                color: themeColor,
                                fontSize: 32,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Sự kết hợp giữa nghệ sĩ và đường phố. Một phong cách đòi hỏi sự kiên nhẫn và tự tin tuyệt đối.',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
                            const SizedBox(height: 24),
                            Row(
                              children: [
                                Container(width: 40, height: 1, color: themeColor),
                                const SizedBox(width: 12),
                                const Text(
                                  'BỘ SƯU TẬP 2024 / MẪU SỐ 10',
                                  style: TextStyle(
                                    color: Colors.white30,
                                    fontSize: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Final Duo
                Row(
                  children: [
                    Expanded(
                      child: _buildGalleryItem(
                        'Short Quiff Trẻ Trung',
                        'NĂNG ĐỘNG & LINH HOẠT',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuASE8C693HnrCPqPT9wJDJN_R4bRqpdl6fiGHRpwQrXtA1VnHO7qj27chGnppCkyxcvUv07g_kYjJbCxZaMuW3-qtjcOZkG_ZQRnSAMe9MJwGyI_99RLCu2UJONjCOtIhaz1efEUCj6oCiWziaWMeEf5qOEcS15GPHDlb2AYsaIpTTt-0Cg90Z2l_oSopEOs5kl7B3VQtwB2w3UcVgZUwZbuaj6-dR8GFSmajC4nKz4M24zOiFNw5Yp1LUi5XhjbU4uHZ7zevgduju_',
                        aspectRatio: 1,
                        titleColor: themeColor,
                        smallTitle: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildGalleryItem(
                        'Buzz Cut Fade',
                        'TỐI GIẢN & MẠNH MẼ',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCynAR2TvnqbjKvl8jJJWa7Ls2cxN2IjNmy3cyzrfHnBxoPBmxWAvQBfO0IIcS-z2t6ACKx3WyLdHpZyPHSN7w-sebRA_UO6vRH18K_ON0NrCv7suT8LjCKEKxmLd9FLAerE7vM0Kg8OvHTEH6HJ8iLRoqgpAjkaCWwd2KZBXJB9RD7gC2BVseEXz26ZEJiforzzxYg3MtZDiB3r_J-sSxlTNNACEj1DMdxlhmHBNJYeTIr6EwV9UVvuQr1UPH7Tb92hO8bLDDe1bdV',
                        aspectRatio: 1,
                        titleColor: themeColor,
                        smallTitle: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),

                // Footer Callout
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
                  child: Column(
                    children: [
                      const Text(
                        'KHÁM PHÁ PHONG CÁCH CỦA BẠN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Tại Heritage Atelier, chúng tôi không chỉ cắt tóc, chúng tôi kiến tạo diện mạo phản ánh đúng bản sắc của bạn.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white54, height: 1.6),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStat('12', 'KIỂU TÓC', themeColor),
                          Container(
                            height: 40,
                            width: 1,
                            color: Colors.white10,
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                          ),
                          _buildStat('2024', 'PHIÊN BẢN', themeColor),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(
    String title,
    String subtitle,
    String imageUrl, {
    double? aspectRatio,
    double? height,
    required Color titleColor,
    bool isBodyText = false,
    bool hasLeftBorder = false,
    bool smallTitle = false,
    TextAlign textAlign = TextAlign.start,
  }) {
    return Column(
      crossAxisAlignment:
          textAlign == TextAlign.center
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child:
              aspectRatio != null
                  ? AspectRatio(
                    aspectRatio: aspectRatio,
                    child: Image.network(imageUrl, fit: BoxFit.cover),
                  )
                  : Image.network(
                    imageUrl,
                    height: height,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: hasLeftBorder ? const EdgeInsets.only(left: 16) : null,
          decoration:
              hasLeftBorder
                  ? BoxDecoration(
                    border: Border(left: BorderSide(color: titleColor, width: 2)),
                  )
                  : null,
          child: Column(
            crossAxisAlignment:
                textAlign == TextAlign.center
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: textAlign,
                style: TextStyle(
                  color: titleColor,
                  fontSize: smallTitle ? 18 : 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                textAlign: textAlign,
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: isBodyText ? 14 : 12,
                  letterSpacing: isBodyText ? 0 : 1.2,
                  height: 1.5,
                  fontWeight: isBodyText ? FontWeight.normal : FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrioGrid(Color themeColor, Color surfaceColor) {
    return Column(
      children: [
        _buildTrioItem(
          'Tóc Ivy League',
          'Thanh lịch và vô cùng chuyên nghiệp.',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBWEPVOA-NhlFbG-7AhNBoeMLYuXjRecwTVGKRmfn6edh1Iw0a4G7udejTjed1ZUH2H_cRVELPVCVwonT02nxWZHF_xTYcmxDS16TmkPBeiLacLLFwpTFDHAoCO5UdW4f6WVN0o2RxoUn1N0kTUcEvyBGvgLIizcZOTZwlUJa41qSTWOhHuBdE5B8Zii35XUreBTwSDFy0yfPVR9aXY7Duojx3qect00WKEG3-x3rAwtFsu3-9CHygyzaCpuYCY7iCal8IuJX-6lLCV',
          themeColor,
          const Color(0xFF1C1B1B),
        ),
        const SizedBox(height: 16),
        _buildTrioItem(
          'Two Block Hàn Quốc',
          'Xu hướng trẻ trung đầy cá tính.',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB8LeT6VPzPn_AyAEq5IrVclPxT1TbBtUQh1YRgGpSr4VzdLbvK34HmizSiPxmXJ8vgEWVW4Lqo3vja-c3s1DDVSnLpNmW_EdYP-dtUVvFgez9nrhO6bW5HBd4aMix0TGur8FivOfY4xgrte0Y3dEGgdAsXQ_nDxgBiZmxaUCAHMwxG-dEnsejfxoxIH35BOUxQViW-vuVe8GuDfVuLnoTl3DGMcqaSYAgX6hYfDiyS747u3bDp1W3-VdWeuiOLmIpSQaoRDd3h2bzp',
          themeColor,
          const Color(0xFF20201F),
        ),
        const SizedBox(height: 16),
        _buildTrioItem(
          'Taper Fade Hiện Đại',
          'Đường nét sắc sảo, nam tính.',
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAZPL0BuKf_P98fXOEA6s8lGAEsG59TGZYZrTTpeyd6PrMBxfJlzWdrpA0_QbNWRL2Zn1nL7PN-wyRyjYeZq4oWaVBrDw4am0rAm8N6rYMjWkDKxKzxh2BpYNFWByC0sSDAnpRbFyQ6KUGA26LWCCcXA4jimK5HWwCvgmt_xmsoGic9KFkUZFQHoS4ijs-WyaHbHpuP7wrlcjUXgMkzRhdZl8QWidKez3wWfHNqfmBG7yqiLFDKh0IFbQs_vowzBjSLGjNiuQnBcRbG',
          themeColor,
          const Color(0xFF2A2A2A),
        ),
      ],
    );
  }

  Widget _buildTrioItem(
    String title,
    String desc,
    String imageUrl,
    Color themeColor,
    Color bgColor,
  ) {
    return Container(
      color: bgColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              color: themeColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(desc, style: const TextStyle(color: Colors.white60, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label, Color themeColor) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: themeColor,
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white38,
            fontSize: 10,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
