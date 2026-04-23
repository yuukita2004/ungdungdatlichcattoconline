import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import 'home_screen.dart';
import 'services_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';
import 'branches_screen.dart';
import 'reviews_screen.dart';
import 'about_us_screen.dart';
import 'referral_screen.dart';

class MainShell extends StatefulWidget {
  final int initialIndex;
  const MainShell({super.key, this.initialIndex = 0});

  static _MainShellState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainShellState>();

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  late int _selectedIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const HomeScreen(),
    const ServicesScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
    const BranchesScreen(),
    const ReviewsScreen(),
    const AboutUsScreen(),
    const ReferralScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void setIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(color: AppColors.surfaceContainerLow),
                      child: Center(
                        child: Text(
                          'THE MODERN\nAPOTHECARY',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontFamily: 'Noto Serif',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    // Nhóm 1: Các tính năng cốt lõi
                    _buildDrawerItem(0, Icons.home_outlined, 'Trang chủ'),
                    _buildDrawerItem(1, Icons.content_cut_outlined, 'Dịch vụ'),
                    _buildDrawerItem(2, Icons.calendar_today_outlined, 'Lịch sử'),
                    _buildDrawerItem(3, Icons.person_outline, 'Cá nhân'),
                    
                    const Divider(color: Colors.white10, height: 32, indent: 16, endIndent: 16),
                    
                    // Nhóm 2: Thông tin và mở rộng
                    _buildDrawerItem(4, Icons.location_on_outlined, 'Chi nhánh'),
                    _buildDrawerItem(5, Icons.star_outline_rounded, 'Đánh giá'),
                    _buildDrawerItem(7, Icons.card_giftcard_outlined, 'Giới thiệu bạn bè'),
                    _buildDrawerItem(6, Icons.info_outline_rounded, 'Về chúng tôi'),

                    const Spacer(),
                    
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        'v1.0.0',
                        style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDrawerItem(int index, IconData icon, String title) {
    bool isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? AppColors.primary : AppColors.onSurface,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        setIndex(index);
        Navigator.pop(context);
      },
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.95),
        border: const Border(top: BorderSide(color: Colors.white10, width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, Icons.home_filled, 'Home'),
          _buildNavItem(1, Icons.grid_view_rounded, 'Service'),
          _buildNavItem(2, Icons.calendar_month_rounded, 'History'),
          _buildNavItem(3, Icons.person_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setIndex(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant.withOpacity(0.5),
              size: 26,
            ),
            const SizedBox(height: 4),
            if (isSelected)
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
