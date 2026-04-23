import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'main_shell.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryContainer),
          onPressed: () => MainShell.of(context)?.openDrawer(),
        ),
        title: const Text(
          'THE MODERN APOTHECARY',
          style: TextStyle(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 16,
            fontFamily: 'Noto Serif',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'OUR ATELIERS',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 10,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  height: 1.1,
                  color: Colors.white,
                  fontFamily: 'Noto Serif',
                ),
                children: [
                  TextSpan(text: 'Hệ thống\n'),
                  TextSpan(
                    text: 'Chi nhánh',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Khám phá không gian làm đẹp đẳng cấp tại các vị trí đắc địa nhất, nơi truyền thống gặp gỡ sự chính xác hiện đại.',
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontSize: 16,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 60),
            
            _buildBranchItem(
              context,
              name: 'District One Atelier',
              address: '128 Lê Lợi, Phường Bến Thành, Quận 1, TP. Hồ Chí Minh',
              phone: '+84 28 3822 1234',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBe57J-PoO50LN-63t-kwcXK9W1qNa56bIZOIH6KZNaCk2rpOP-0j9Iby3Dy18oPVtPcL4txOvP1k3vpfQwysPCS07YIlupKB4ixeuMvTF-6CgPWV79o9iTqxNXML4_B3oPA9UdRHam_Sf2uO2kPOPKTpyQNaSGhRr7GgCT9RPCW0tL1jxdGHyFe8iwNBF7TdduUyiRWSUFWNgpdgDgTcJ5qNqUKnKkUk_IxrEwkRv91_dkkbIws7wm1CpW-IlEeU8-6wOhTijapY0',
              mapUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA_XUanbCl87JcHMdfo5a6eLem7DiGimyQFM6Jl-iQtg2GljEbar0yjK1G1ygNM1lChx0R-oeYUxVLkwgYKDaGoUzxQYBfAA_pdJW9375jcIKI_Un56xcQ6svKIyhllDDeTavDbqLxY_IZCXgG2ALAQNfWRSXm6KQke9_d7nrhouRxky3WDbUmIwta315AGJVxeFTAPIjePWMwA4PxEN9LEEhK1jfFFFCMVNpQQOBmYka7Q_mx8hNq7b3_IUk-Rpkkm_BXfaHtyb0w',
              isReversed: false,
            ),
            
            _buildBranchItem(
              context,
              name: 'The Garden House',
              address: '45 Thảo Điền, Quận 2, Thủ Đức, TP. Hồ Chí Minh',
              phone: '+84 28 3744 5678',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAZAOW6PFjGbA3DrLiabYNpSoNoQnkh_DJfcIi7l2BVxwb_RC3cyMMJo1kLwGmBjLU7VXSXVI02mUksoOE7BHKiRBELvDEjwO58tUsPqAksd8rxhgkxlQXm4cHJFgdROERudFAuRNIYRg9qXkCvoPAHXEDKkwocwjlcUx5eVwaUDp6OiaW8BFRq9H7U7Y2weH2RoEMm6lBKyvUqEUKRIoupzAmUiEHqfqEM26y2AvKsV-IC6frxmDRwq41HzDvufxh0c0v2YGkiE0E',
              mapUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD8bRcvLbYubMwvenVGIg7PvbNdbpysK7Tvqo3WJHvNKFNU6lsSRX-ibtvjauZb3szwg9dW36tHFg4ZBtxS17Is84TdVRDkiaDG2HG5LybK_D1gw_8-OjlD7lxCcMJCR1o4kdlrD5ikcBs-62QyXa5d-cf08uB1yd5S2KQg23UJSDVINAIt7FXJT4hh0MeK_a2u7YXpEPkjWflk0hLsBG_jC_CJhDSpjGdf_e_nhHWVu2OZekr7FcYtPJcZf9TqUIxk4HITSFJ0fic',
              isReversed: true,
            ),
            
            _buildBranchItem(
              context,
              name: 'West Lake Boutique',
              address: '21 Xuân Diệu, Quận Tây Hồ, Hà Nội',
              phone: '+84 24 3939 9999',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDyWBDnIkllb5DX4g50DDdIqvQc_pVDfdyLpCrdVdyH6Ca_mwXiT7_ibWUnlGON-VTWgCNkh4RYeGIvwmD5cIVXO0WRts7QJGKqT7pRpoNHJGKp_NypA6U06H9EETFsUqZgx8StkYvrvyUia2wAybvN0-b0kbciUbnWIdOAA1dYsJCpLWENIoWXWJ1HYEJJd4GRWN3kLn1rAA3vwxjTztD9325SMEYlLBkUZRpRlvzPIci0QquACtdJSSPUYqN7BVxLCRsPMcFClX0',
              mapUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBLvE1GaFLVzHlyk-7wcygmLZ7f_hmU3QzoPzEYkt4preZ4_97DVM_7wvCR9nnVKCkFJEV6uait_p0rw1K5DM7C6OqGd4LyptGE9oKIPoimg32lf0x9UZPMc6X1AnKfl_R3Rs0VQr7RA_WNBcQwh80YtuBB7M57ZkAmVbME82roBaHqOnnTRc01R6luK9oED85rbY8kgCw9vaYA_3VAyDiiyjpqwsWbt9ig5twSclcBU7TGEJWO09s56lBPppvhAhl2T_AYQ4LVGHQ',
              isReversed: false,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildBranchItem(
    BuildContext context, {
    required String name,
    required String address,
    required String phone,
    required String imageUrl,
    required String mapUrl,
    required bool isReversed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.darken,
              ),
              child: Image.network(
                imageUrl,
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Info Card
          Positioned(
            bottom: -40,
            left: isReversed ? null : 20,
            right: isReversed ? 20 : null,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHigh.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noto Serif',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary, size: 18),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          address,
                          style: const TextStyle(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 13,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.call, color: AppColors.primary, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        phone,
                        style: const TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Small Map Preview
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.matrix([
                        -1, 0, 0, 0, 255,
                        0, -1, 0, 0, 255,
                        0, 0, -1, 0, 255,
                        0, 0, 0, 1, 0,
                      ]), // Grayscale/Invert effect for dark map
                      child: Image.network(
                        mapUrl,
                        height: 80,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      MainShell.of(context)?.setIndex(1); // Chuyển sang tab Dịch vụ
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'ĐẶT LỊCH NGAY',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontSize: 12,
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
