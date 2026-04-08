import 'package:flutter/material.dart';
import 'barber_booking_scheduler.dart';

class BarberArtisanList extends StatelessWidget {
  const BarberArtisanList({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceContainer = Color(0xFF20201F);
    const onSurfaceVariant = Color(0xFFD0C6AB);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Grain Overlay Effect
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
                const SizedBox(height: 100),
                
                // Header Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CHỌN NGHỆ NHÂN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -1.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'NHỮNG ĐÔI BÀN TAY TÀI HOA KIẾN TẠO PHONG CÁCH',
                        style: TextStyle(
                          color: onSurfaceVariant,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        width: 48,
                        height: 4,
                        color: themeColor,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                // Artisan Grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildArtisanCard(
                        context,
                        'Hùng Barber',
                        'Master Stylist',
                        '4.9',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuACFOkdhssoC9eP24OKW5O5WfAe_iq7XNlsFrMiPwa2vWQxs7YveFiJAAzQx12-tmWSSBbeIAypP9tIIkkEtzX-zckWvO8qyNkvl8mDzjKBmAy0nBcG1qX2RRQuHa3ytBd-V9UWNpjqYbeoiUYP4gyjhv02pugkqVDYztc4c6gi9jLYC7QaF-VCYpLbJPNIaCZKZ8lWBQd3h9aJ3XkL_suPr9JtTOZH2CkCR27hQw9n7j_KicwoC5fkjb3zJQVmEY_pbJVDRHLPHyaF',
                        'Kỹ thuật kéo thủ công kết hợp phong cách cổ điển Pháp.',
                        'Đang rảnh',
                        true,
                        themeColor,
                        surfaceContainer,
                      ),
                      const SizedBox(height: 24),
                      _buildArtisanCard(
                        context,
                        'Tuấn Cắt Tóc',
                        'Fade Specialist',
                        '4.8',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCnHLhNQZO1878nOvp1x2sev8uKSd7WvZ4G_vqhUSIHYmkRbSTMB6j5L2XRjWLYgs5-5s3mkFDi8HMORqfeqjuT5deHmrSTUuF4EdeWGPi_OvGycQNDWQnt5XHTcA-CQ7MA2TmOECaKPazzWhRbcf8hxZxcHnhhnqI7JcujGoijIX0LLGXgje2HJh4s7I-JLZo95qdMVONzMfwmOUtXeS9mpgwZ5z7EjVYeC0A61V1NC1kTMEgN2rokqQiaobrYHUeiQrxQ1YZW__oz',
                        'Chuyên gia kỹ thuật Fade mờ ảo và tạo hình nghệ thuật.',
                        'Đang rảnh',
                        true,
                        themeColor,
                        surfaceContainer,
                      ),
                      const SizedBox(height: 24),
                      _buildArtisanCard(
                        context,
                        'Lâm Barber',
                        'Beard & Grooming',
                        '5.0',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBT66cDVRPwDbfC5bhkCbMDBF8zUL8X4AD3ibbiwrdZ3XJYmaeSm0074gXuQU-VCway5L7xTSWDoaW4XJG9Ae9QLEqa9sKs8UcGj2Ok8O_qayXod4TMusyGXJ8rn0Y67SGh_v4RWl1M_l3Lm8-n-0dRh05AGx_zNa1XnT9qxIjUneaSrgr5__wkpXi8jUDFkk-4AjCQhWjRp1DLyHIi2tufj1_kLafjJxSc4-JrsHQ0EE8d9Tg8flVCa8QAqmKHeX8h2_PZIBNnQyfW',
                        'Tỉ mỉ trong từng đường cạo, đánh thức vẻ lịch lãm quý ông.',
                        'Đang rảnh',
                        true,
                        themeColor,
                        surfaceContainer,
                      ),
                      const SizedBox(height: 24),
                      _buildArtisanCard(
                        context,
                        'Minh Cổ Điển',
                        'Classic Cut Senior',
                        '4.9',
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuA407FI-zHQSoOO3jfe_X2x4LuyW8lC6JBU4tiyaojatcgiJDsc3NiGhYF8Zh_HRhHtuumr25VMTJKr06hVRjiWW8IX5Q7qQiAmyqFcs6W8TgvEu5eOJMIGu-9sl8bLkUuQHyURZHbUELS1BDeLb5FCTeJfVAOSSxu5jpSXxC2B_XgvsuE0x85qXTBF7Z3d8kCZkF6Em3zElF43nLkSqTXU1krxTAWZsfkejebYrSm69XIcrnelanU8nF0dAsbf3YH6S06bFj1JjD-B',
                        'Linh hồn của những kiểu tóc vượt thời gian.',
                        'Đang rảnh',
                        true,
                        themeColor,
                        surfaceContainer,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 120),
              ],
            ),
          ),

          // Custom Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: bgColor.withOpacity(0.7),
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Color(0xFFFFD700), size: 28),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'KTA BARBER',
                          style: TextStyle(
                            color: Color(0xFFFFD700),
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAN55qkD8MW4qOTpHn0f3lSGn8tfL5EfDBRm9gyZs8BcaxBjQmQ5EEnf0ZobFQof5WQ_SYl__rUL104E4ZuosAYzu3LN03o9OL-vWnVq1dxn9YG3j6bFrezTRuvyRLZ_TT87DJSMerkEkDB9yjpXvOvYPFJQBXTa9drc-ABHYKKqLqatlZq_wg0fIltjT75kBKdv_SLvObY6ZPFXVQwJaeXvbtlGU5KJDEp7kWmJcC2ijskcy8YeVNfbbuZg_rR4wfR1GMBk_4bMM0n'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtisanCard(
    BuildContext context,
    String name,
    String role,
    String rating,
    String imageUrl,
    String bio,
    String status,
    bool isAvailable,
    Color themeColor,
    Color bgColor,
  ) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                color: Colors.grey,
                colorBlendMode: BlendMode.saturation,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: isAvailable ? const Color(0xFFBDE0E0) : const Color(0xFF353535),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Text(
                              status.toUpperCase(),
                              style: TextStyle(
                                color: isAvailable ? const Color(0xFF143535) : Colors.white38,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(rating, style: TextStyle(color: themeColor, fontSize: 10, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              Icon(Icons.star, color: themeColor, size: 12),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(role.toUpperCase(), style: const TextStyle(color: Colors.white38, fontSize: 9, letterSpacing: 1)),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isAvailable ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BarberBookingScheduler(
                              artisanName: name,
                              artisanImageUrl: imageUrl,
                              rating: rating,
                            ),
                          ),
                        );
                      } : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        foregroundColor: Colors.black,
                        disabledBackgroundColor: const Color(0xFF353535),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                      child: Text(isAvailable ? 'CHỌN NGHỆ NHÂN' : 'HIỆN KHÔNG TRỐNG', style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
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
