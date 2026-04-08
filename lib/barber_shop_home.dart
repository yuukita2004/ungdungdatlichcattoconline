import 'package:flutter/material.dart';

class BarberShopHome extends StatelessWidget {
  const BarberShopHome({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceColor = Color(0xFF20201F);
    const onSurfaceColor = Color(0xFFE5E2E1);
    const subTextColor = Color(0xFFD0C6AB);

    return Container(
      color: bgColor,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeroSection(themeColor),
                _buildBarberSection(themeColor, onSurfaceColor, subTextColor),
                _buildServiceSection(themeColor, surfaceColor, onSurfaceColor, subTextColor),
                _buildQuoteSection(themeColor, onSurfaceColor, subTextColor),
                const SizedBox(height: 100),
              ],
            ),
          ),
          _buildTopNav(themeColor),
        ],
      ),
    );
  }

  Widget _buildTopNav(Color themeColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.8),
            Colors.transparent,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: themeColor, size: 28),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
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
              border: Border.all(color: themeColor, width: 2),
              image: const DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAfuGdi4vIxY2Z2eNVCXXLwpnB5Ev_FiXeQvYoKtGF5SQObORuquJwZW_ugdZe1gELjRqNaoohgdqUTxx6GplQE6JSckQrNiBWpqZyfoJKcjteA7fb89-EaBQocGpyvIMM-PHQxGQ4DTXlQDTbeNu12tb5x7fO1GqbyWvitJOVkHS1mC56Ehm1qchyXakbCD0AVdVG_xeFMGELvKyCYgdd_qclQDNdMTwn3bep8r4rc1QRQFwSx_Z89rcx4LREh58vv4AEkrEVdk1-R'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection(Color themeColor) {
    return Stack(
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
                  const Color(0xFF131313).withOpacity(0.5),
                  const Color(0xFF131313),
                ],
              ),
            ),
            child: Image.network(
              'https://images.unsplash.com/photo-1503951914875-452162b0f3f1?q=80&w=2070&auto=format&fit=crop',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: 'PHONG CÁCH\n',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                    TextSpan(
                      text: 'QUÝ ÔNG',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Nơi di sản cắt tóc gặp gỡ nghệ thuật',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBarberSection(Color themeColor, Color onSurfaceColor, Color subTextColor) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THỢ BARBER NỔI BẬT',
            style: TextStyle(color: themeColor, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 4),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildBarberCard(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuBVVWKHSIGiHxpn7Nl2N43lhncGxssY0pNumOC_iBJO-yjRKbQNPP3HI2vM6rwanfcNzxpDwvxh3X73D6W0Ll15AgajGIQA5tP2X3pljIPQMz54Hml6bvaEf87dVOrY14Q7xisSUzrkXcIkhQWAkGoE3Jr0mWuRrCk0h5YuCNqq3MXojLUMIoWr4Zd8MS9Vb6nT9kgIdpBRW-PsdTAror7HjOr8dJgJDKI5uCbgmq-_lgn_bPA3qxtMpQjNMjEsNlphOoXnc9-_Fija',
                  'An Barber',
                  'Master Stylist',
                  themeColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildBarberCard(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB4PqMDnYn5sRfrgsuda5xUUzn7GaB86MA68weRvy6XxcSpCCW0RnQDi0WPaX3nW7QXMbSTBxz1b75XZIUv9zBBWCeWDNbzNB6eUIqeSwWkarlZwnpQ4ePmFTzC0Yvn3itIsNLMklEKce_YR2ei9QElJyKRMtQy1BsUEBq0LnKcIWN20BSY_fALCbzDPYGN-jvwH3h-_bZ4Yb19CzijF2ydjsVTgIVv0BnRYKDuUPSpRwaZnig9wE_YTgIfM6eHMHRC2SphomfjYwbl',
                  'Kiên Barber',
                  'Fade Specialist',
                  themeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarberCard(String imageUrl, String name, String subtitle, Color themeColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
                colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(subtitle, style: TextStyle(color: themeColor, fontSize: 10, letterSpacing: 1)),
      ],
    );
  }

  Widget _buildServiceSection(Color themeColor, Color surfaceColor, Color onSurfaceColor, Color subTextColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: surfaceColor.withOpacity(0.5),
      child: Column(
        children: [
          const Text('DỊCH VỤ PHỔ BIẾN', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 32),
          _buildServiceCard(Icons.content_cut, '100k', 'Combo 10 Bước', themeColor),
          const SizedBox(height: 16),
          _buildServiceCard(Icons.face, '150k', 'Cạo Mặt & Ráy Tai', themeColor),
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String price, String title, Color themeColor) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: themeColor, width: 4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: themeColor, size: 24),
              const SizedBox(width: 16),
              Text(title.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          Text(price, style: TextStyle(color: themeColor, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildQuoteSection(Color themeColor, Color onSurfaceColor, Color subTextColor) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      child: Column(
        children: [
          Icon(Icons.format_quote, color: Colors.grey.withOpacity(0.2), size: 40),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300),
              children: [
                const TextSpan(text: '"Tóc không chỉ là diện mạo, đó là bản sắc của một '),
                TextSpan(text: 'Quý Ông.', style: TextStyle(color: themeColor, fontWeight: FontWeight.w900, fontStyle: FontStyle.normal)),
                const TextSpan(text: '"'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
