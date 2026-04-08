import 'package:flutter/material.dart';
import 'barber_beard_scheduler.dart';

class BarberBeardArtisanList extends StatelessWidget {
  final String serviceName;
  final String price;

  const BarberBeardArtisanList({
    super.key,
    required this.serviceName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);

    final List<Map<String, dynamic>> artisans = [
      {
        'name': 'Lê Hoàng Nam',
        'role': 'Master Barber',
        'rating': '4.9',
        'reviews': '120',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuA5LK56IdCiQWwmCmcCcBLKlmT6hIo5HS-xTDhB34jxTOQxP0ER6Yo-xwgyEpt2hHf1OhHSHjbTm4cm3m-zRcBVpGBQ2SCNK48QVlRNjmTyW292NXKAHBuN7UsyIRfa068B_R1WUsG4sCZMI27tpKz7miZutkwsYMI2So1mL2kfnmrE6iKgRva2nQdQr60tPaBtCAju7XyoA_x5nmi6o7vztw1710EVAYjL8pbvWl2hcnUUOu2bo5rk4c0YmGQvpnIsOmO8ZaKSWEqd',
      },
      {
        'name': 'Trần Minh Quân',
        'role': 'Senior Stylist',
        'rating': '5.0',
        'reviews': '86',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuC7R0N2rP1ljOMDUfRJbTBNY77pGRRYmM0Gyc31GQpJ7EbgCfU9ta3rECMHgPJ58CFUVTVe0x1tkuhxt-037qdSUzkETHpcfirmepfOUYLRyOl2dVdzBu_xsfJXv6661VYPwpXQQM7PVlouaxuVRHffp_SfBzKNESJ8A76e2J8SuP46x1V6a6jQZB1GQlYDaVgfueyxK94yUMfZHKeUN9QutDpLfKZMtUElpWyT19j704IAOl6PbQl8aT9aRwf74-MbUKW9m5tlCqem',
      },
      {
        'name': 'Phạm Thế Vinh',
        'role': 'Elite Barber',
        'rating': '4.8',
        'reviews': '215',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuD6bSCK01q02GvCp3gUHyYA21XzzipD2nTzHZ2FgqAaw0KZ5rJdZu6iP9gtTcU_e66aQJg0fbeqD-eZJI-dJGTWVACn0T2ypid5oLbviKu6UPsGbDKa0JgF6vI7PTroA1gF8KZ3JeyQ7xebJXtxtcZjds_njKfEXQ_BEj1HBDBqRXcJLE9jgO9M0kIrUAk568Z51fnOz8Tlh0cpxZVsD6vAMdHDEl9c8We_s_qovEoFNBulDiFuOW_akg7eh0skKSciAFFL-9oHiwhO',
      },
      {
        'name': 'Nguyễn Anh Đức',
        'role': 'Artisan Barber',
        'rating': '4.9',
        'reviews': '142',
        'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuDZMtOSOSdS13oBjXLwBC7ihpzOCIqEIWB_CnhK2iFzjHdoonTn065bB9__vD-b4UC6Wxxpk24QUxze3FZCYn30msUc-T6vHX_TI7fabF-OP99ubRkn1CEAqZJofterXPU8OS23YkugDXklWl3jd53cXpHN6GeU3TKPwCELZtcQO8uy6i4c8oLgllyK4ieA2_qH-BFfQXdAUy6lG8palxbPKnycEvWAav7Id8e9DLepxxusBKpuqaYsrbcBtIrEt4zJy3sXttG7hhuk',
      },
    ];

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'HERITAGE ATELIER',
          style: TextStyle(color: themeColor, fontWeight: FontWeight.w900, letterSpacing: -1),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAnCVkqeaMcK1p8LkYibjAPqBE9ovZ-LZR4rFjwIe6h94pXBfJM7CQwXlmikG8mMksDbqGnFDtfZG3KVCWH3XtKkSbjUTdbrKMzfly72Q3H-GifkQ0UBaTxgqVZop13xJTYdBvn9f6BI5OAOc07KtJEPdZXPEfWAeXBQ6xKPT_IJd_xNTI7McpIgFpUVGANg12Dcz8AHaWsscLeVJfUkHhaoqnX2lMemWMGfpO4IjFyZRp5EdzR28RVAFRRBVZzVGSRBRWXXMaCaylz'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'CHỌN NGHỆ NHÂN',
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -1.5),
            ),
            const Text(
              'CHĂM SÓC RÂU',
              style: TextStyle(color: themeColor, fontSize: 40, fontWeight: FontWeight.w900, height: 1.0, letterSpacing: -1.5),
            ),
            const SizedBox(height: 24),
            Container(width: 80, height: 4, color: themeColor),
            const SizedBox(height: 48),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 450,
                mainAxisSpacing: 32,
              ),
              itemCount: artisans.length,
              itemBuilder: (context, index) {
                final artisan = artisans[index];
                return _buildArtisanCard(context, artisan, themeColor);
              },
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildArtisanCard(BuildContext context, Map<String, dynamic> artisan, Color themeColor) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1B1B),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 30, offset: const Offset(0, 20)),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              artisan['image'],
              fit: BoxFit.cover,
              color: Colors.grey,
              colorBlendMode: BlendMode.saturation,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artisan['name'].toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.star, color: themeColor, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${artisan['rating']} (${artisan['reviews']} reviews)',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BarberBeardScheduler(
                              artisanName: artisan['name'],
                              artisanImageUrl: artisan['image'],
                              rating: artisan['rating'],
                              serviceName: serviceName,
                              price: price,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: const Text(
                        'ĐẶT LỊCH NGAY',
                        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
                      ),
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
