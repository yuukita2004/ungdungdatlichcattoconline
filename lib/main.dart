import 'package:flutter/material.dart';
import 'barber_shop_home.dart';
import 'barber_service_list.dart';
import 'barber_booking_history.dart';
import 'barber_profile.dart';
import 'barber_login.dart';
import 'barber_register.dart';
import 'barber_collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KTA Barber',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        useMaterial3: true,
        fontFamily: 'Be Vietnam Pro',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BarberShopHome(),
    const BarberCollection(),
    const BarberServiceList(),
    const BarberBookingHistory(),
    const BarberProfile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF131313),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF20201F)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'KTA BARBER',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                      ),
                    ),
                    Text(
                      'DI SẢN HIỆN ĐẠI',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        letterSpacing: 4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(Icons.home_outlined, 'Trang chủ', 0),
                  _buildDrawerItem(Icons.collections_outlined, 'Bộ sưu tập', 1),
                  _buildDrawerItem(Icons.content_cut_outlined, 'Dịch vụ', 2),
                  _buildDrawerItem(Icons.history_outlined, 'Lịch sử', 3),
                  _buildDrawerItem(Icons.person_outline, 'Cá nhân', 4),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(color: Colors.white10),
                  ),
                  ListTile(
                    leading: const Icon(Icons.login, color: Colors.white70),
                    title: const Text('Đăng nhập', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BarberLogin()));
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_add_outlined, color: Colors.white70),
                    title: const Text('Đăng ký', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BarberRegister()));
                    },
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Phiên bản 1.0.0',
                style: TextStyle(color: Colors.white24, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: themeColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'Bộ sưu tập'),
          BottomNavigationBarItem(icon: Icon(Icons.content_cut), label: 'Dịch vụ'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Lịch sử'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cá nhân'),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    const themeColor = Color(0xFFFFD700);
    bool isSelected = _selectedIndex == index;
    return ListTile(
      leading: Icon(icon, color: isSelected ? themeColor : Colors.white70),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? themeColor : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        _onItemTapped(index);
        Navigator.pop(context);
      },
    );
  }
}
