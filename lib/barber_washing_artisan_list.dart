import 'package:flutter/material.dart';
import 'barber_washing_scheduler.dart';

class BarberWashingArtisanList extends StatelessWidget {
  final String serviceName;
  final String price;
  final String duration;

  const BarberWashingArtisanList({
    super.key,
    required this.serviceName,
    required this.price,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceColor = Color(0xFF20201F);

    final List<Map<String, dynamic>> artisans = [
      {
        'name': 'Lan Anh',
        'role': 'Gội đầu thảo dược',
        'rating': '5.0',
        'status': 'Đang rảnh',
        'isBusy': false,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCCE6zRbJbpFsqbLlXEhbbb_E926Y79yPf2akpk452K3klRNqDQ03onfe5MT51KXI2nmA7XbB74smpeEn8He1eUTVgoCgeF12_WvafBTxIdNC-tYH07d8obxaqBxIee42vZnJ4_pKABcWhZS7pSC7rjytLftD_f8aPh8TNlJuDPUCXqxkWGGr9P8MOmld45L0NH2rGYT3kVa7wz0QN3v357Rp8nurDgG6_iSM22xKyTyLqqasglFrZWSl8FQNdkilZ-ifBCioptBvge',
      },
      {
        'name': 'Mai Phương',
        'role': 'Massage cổ vai gáy',
        'rating': '5.0',
        'status': 'Đang rảnh',
        'isBusy': false,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCtoSpQKQDJd6qAfGulbliD7AupgEqV3jEqCT4erKNClxCl0OImUaTeefiGxk6GjwdP2YlFfKLlvyMIQGpmsJSyd68tX6Yol_csgCOFpfaA6CI3UYCiOI593Nbh7d8f2BOOMgScPa94umb09V-p6da0F_lQlQhYPT9CWgBDe3k8luYgVf2kxIFtdXui6xz4lgsv_8M6mKCkO53ksaLoqI3FEvHKHaGvfyIIgdaso2aE3J4Pgds3dMDlmxZHhw1JwEomfN9gn5E-2UR7',
      },
      {
        'name': 'Thanh Hằng',
        'role': 'Nghệ nhân gội đầu',
        'rating': '5.0',
        'status': 'Đang rảnh',
        'isBusy': false,
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDX62GclDlE99REfoRLLrvMCMUgb13wgP7WyTUcQBK5EHRWn-g2w5IQG5p7k3MDpAOVqm8V6jgUJHg0gVN9fikOdLqapP-2NLIWw59mB4pwyM2LOBRv2XxsaOsYuNoCOILA3DDRomRmD35XVHTJri1GVI47pUq5qAVhRSLkcAJ1tUBYtoKAN-EoATOQ9Y0_f4KJBNWWD8wqd_rRMELnl0UFgLmilUNq27NsX7Ze4TObJquteg0Lu2UV5tZy0OuHaLZPSUR1ozBTx9pw',
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'KTA BARBER',
          style: TextStyle(color: themeColor, fontWeight: FontWeight.w900, letterSpacing: -1),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBAB5ib5jvKTZGc0SzAmJfqT4ZvaT2KVtdt_kfsSD8qR1SkA8eJ7vO2NlTY-PIaS6XcEyRMKWeGx2NkwgRlUEFBHqffGX_zLa6LVP44I-Tf7nrKfpAlRLbUxO94k-NqqVj47mp7ElSJYK1pWhNb5R7ps4I6_mHo-pxF5gI_JQKVZP2xNsAjGD7tu5EBnf2y151MhMLWTV3NQCgyVioUVC-iM5M_ldx2TKwb4hbCgZd2JgLNx7w1J9EC-cYfhP7-KiGG-7YI-XXsQKbg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CHỌN NGHỆ NHÂN',
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                  const Text(
                    'GỘI ĐẦU',
                    style: TextStyle(color: Colors.white38, fontSize: 32, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: themeColor, width: 2)),
                    ),
                    child: const Text(
                      '"Những đôi bàn tay xoa dịu mọi mệt mỏi"',
                      style: TextStyle(color: Colors.white60, fontStyle: FontStyle.italic, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemCount: artisans.length,
              itemBuilder: (context, index) {
                final artisan = artisans[index];
                return _buildArtisanCard(context, artisan, themeColor);
              },
            ),

            // Tiêu chuẩn Nghệ nhân section
            Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: surfaceColor,
                border: const Border(left: BorderSide(color: Color(0xFF753401), width: 4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TIÊU CHUẨN NGHỆ NHÂN',
                    style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
                  ),
                  const SizedBox(height: 20),
                  _buildStandardItem(Icons.verified, 'Đào tạo chuyên sâu', 'Mỗi nghệ nhân có hơn 500 giờ thực hành gội đầu dưỡng sinh.'),
                  const SizedBox(height: 16),
                  _buildStandardItem(Icons.psychology, 'Tâm lý trị liệu', 'Thấu hiểu huyệt đạo và kỹ thuật xoa bóp giảm căng thẳng.'),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildArtisanCard(BuildContext context, Map<String, dynamic> artisan, Color themeColor) {
    bool isBusy = artisan['isBusy'];

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: const BoxDecoration(color: Color(0xFF1C1B1B)),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 4 / 5,
                child: Image.network(
                  artisan['image'],
                  fit: BoxFit.cover,
                  color: Colors.grey,
                  colorBlendMode: BlendMode.saturation,
                ),
              ),
              Positioned(
                top: 16,
                left: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isBusy ? const Color(0xFF93000A).withOpacity(0.9) : const Color(0xFF2C4C4C).withOpacity(0.9),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isBusy ? const Color(0xFFFFDAD6) : const Color(0xFFC6E9E9),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        artisan['status'].toUpperCase(),
                        style: TextStyle(
                          color: isBusy ? const Color(0xFFFFDAD6) : const Color(0xFFC6E9E9),
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artisan['name'].toUpperCase(),
                          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          artisan['role'].toUpperCase(),
                          style: const TextStyle(color: Colors.white38, fontSize: 10, letterSpacing: 1),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: const Color(0xFF353535),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: themeColor, size: 14),
                          const SizedBox(width: 4),
                          Text(artisan['rating'], style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BarberWashingScheduler(
                            serviceName: serviceName,
                            price: price,
                            duration: duration,
                            specialistName: artisan['name'],
                            specialistImage: artisan['image'],
                            rating: artisan['rating'],
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: themeColor,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('ĐẶT LỊCH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1)),
                        SizedBox(width: 8),
                        Icon(Icons.calendar_today, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardItem(IconData icon, String title, String desc) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: const Color(0xFFFFB68C), size: 24),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(desc, style: const TextStyle(color: Colors.white54, fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
