import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/providers/booking_provider.dart';
import '../../core/models/booking_model.dart';
import 'main_shell.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  void _toggleAuthMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    final apiService = ApiService();
    final provider = Provider.of<BookingProvider>(context, listen: false);

    try {
      if (isLogin) {
        // Xử lý Đăng nhập
        final response = await apiService.login(
          _phoneController.text,
          _passwordController.text,
        );

        if (response['status'] == 'success') {
          // Lưu thông tin user vào Provider
          final userData = response['user'];
          final userProfile = UserProfile(
            id: userData['id'].toString(),
            name: userData['name'],
            phone: userData['phone'],
            avatarUrl: userData['avatar_url'] ?? '',
            membershipRank: userData['membership_rank'] ?? 'SILVER',
            points: int.tryParse(userData['points'].toString()) ?? 0,
          );
          
          await provider.updateUserProfileManually(userProfile);
          
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainShell()),
            );
          }
        } else {
          _showError(response['message']);
        }
      } else {
        // Xử lý Đăng ký
        final response = await apiService.register(
          _nameController.text,
          _phoneController.text,
          _passwordController.text,
        );

        if (response['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đăng ký thành công! Vui lòng đăng nhập.')),
          );
          setState(() => isLogin = true);
        } else {
          _showError(response['message']);
        }
      }
    } catch (e) {
      _showError('Đã có lỗi xảy ra. Vui lòng thử lại.');
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _showError(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.redAccent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDTqM7HoCd_hrnv4F5XqAeV5Q2w_2a6-Kgvqs4orMJ4gGxmi1KtKsc627hqsRaTvgBUdWLNKhFZCSVR7nO0FNjBdgXl0RFr2kYEuj4PtQs2PCiheYubhek_xpxb6NMqllo7hnB0SGFG62oQV1N1fFpprFZmOzVeOD96m58OYRU74zX9cboNQYISh4c7D18_APKXaVpIVavLplme1H_QGz-A8s3tM32F8NX-dSd_xngB2UZ8r9MZwUcdta2Lk8BDR5J7k_AIUaf7cvg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    AppColors.background.withOpacity(0.8),
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'THE MODERN\nAPOTHECARY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontFamily: 'Noto Serif',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        isLogin ? 'Chào mừng quý ông trở lại' : 'Trở thành một phần của di sản',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.onSurfaceVariant,
                          fontSize: 14,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 60),
                      if (!isLogin) ...[
                        _buildTextField(
                          controller: _nameController,
                          label: 'HỌ VÀ TÊN',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 20),
                      ],
                      _buildTextField(
                        controller: _phoneController,
                        label: 'SỐ ĐIỆN THOẠI',
                        icon: Icons.phone_android_outlined,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: _passwordController,
                        label: 'MẬT KHẨU',
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: isLoading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: AppColors.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                          disabledBackgroundColor: AppColors.primary.withOpacity(0.3),
                        ),
                        child: isLoading 
                          ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(color: AppColors.onPrimary, strokeWidth: 2))
                          : Text(
                              isLogin ? 'ĐĂNG NHẬP' : 'TẠO TÀI KHOẢN',
                              style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14),
                            ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            isLogin ? 'Chưa có tài khoản?' : 'Đã có tài khoản?',
                            style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13),
                          ),
                          TextButton(
                            onPressed: _toggleAuthMode,
                            child: Text(
                              isLogin ? 'ĐĂNG KÝ NGAY' : 'ĐĂNG NHẬP',
                              style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          cursorColor: AppColors.primary,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppColors.onSurfaceVariant, size: 20),
            filled: true,
            fillColor: AppColors.surfaceContainerLow.withOpacity(0.5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.white.withOpacity(0.05))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primary, width: 1)),
          ),
          validator: (value) => (value == null || value.isEmpty) ? 'Vui lòng nhập thông tin' : null,
        ),
      ],
    );
  }
}
