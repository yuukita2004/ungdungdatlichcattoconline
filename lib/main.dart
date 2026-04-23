import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/auth_screen.dart'; // Đổi import
import 'core/constants/app_colors.dart';
import 'core/providers/booking_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookingProvider()..loadInitialData()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Modern Apothecary',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.primary,
        fontFamily: 'Manrope',
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
        ),
      ),
      home: const AuthScreen(), // Đặt AuthScreen làm màn hình khởi đầu
    );
  }
}
