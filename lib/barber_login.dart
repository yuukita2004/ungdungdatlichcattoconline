import 'dart:ui';
import 'package:flutter/material.dart';
import 'barber_register.dart';

class BarberLogin extends StatefulWidget {
  const BarberLogin({super.key});

  @override
  State<BarberLogin> createState() => _BarberLoginState();
}

class _BarberLoginState extends State<BarberLogin> {
  bool _isPasswordVisible = false;

  final Color themeColor = const Color(0xFFFFD700);
  final Color bgColor = const Color(0xFF131313);
  final Color outlineColor = const Color(0xFF999077);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuBd_9F3w3K1e81YxYYQK67m9Ue6uM8Vq_j798Tm5qrVOyTLxLfwT0Wr85dTqHPCaJg-JmmDDy7tkTc-VL0PoiDzCd0pN3R_ul4Tiu6VEfVadSpbEQhLpFB0GY_FXCgjM_qKqTNbY3KdTXbqAWRsZNWFnHjSGLWmQx4tNMYsaDlJOlRpcccirBC4Yrl0AlFtpjJ4cnUisO4cr1R63eyBMQUghIDrcMoZboaftSXDKq7NV5vzGRvRz7F7IMHcVhS2KflZmBvcapUVxcCg',
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
                    bgColor.withOpacity(0.6),
                    bgColor.withOpacity(0.95),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCWTX1tD9rljN86pUq1Z38d2Bssz0HMRHvaXHw_m3ii_Jx8WbBdI30orpquHZq9BxgNoMnR0RjmrIeFGDXh7WaqXwwAqWvLKMDzyeoo_rPi-mec16nkK751FrIGQqHcbNy0boR2rdrJOJMCAPSQFlQJp3xA3Z4tMJd_lwM7Yvfy6q86uWaXhtnwZBDTW_BA8It-2Q_7Ihc5GVDrXzbPj3ZV21BvCS8Dseq_p50Vhzy_5bUfMxx6yfgVhkRUo9IEgJv4tznyeQQH9QRy',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
                child: Column(
                  children: [
                    Text(
                      'KTA BARBER',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -2,
                        height: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'DI SẢN HIỆN ĐẠI • MODERN HERITAGE',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 10,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 60),
                    ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.05),
                            border: Border.all(color: Colors.white10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Chào mừng trở lại',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Vui lòng đăng nhập để tiếp tục hành trình phong cách.',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 40),
                              _buildInputField(
                                label: 'SỐ ĐIỆN THOẠI',
                                hint: '090 123 4567',
                                icon: Icons.phone_android,
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 32),
                              _buildInputField(
                                label: 'MẬT KHẨU',
                                hint: '••••••••',
                                icon: Icons.lock_outline,
                                isPassword: true,
                                obscureText: !_isPasswordVisible,
                                onToggleVisibility: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                                suffixLabel: 'Quên mật khẩu?',
                              ),
                              const SizedBox(height: 40),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Khôi phục: Chỉ đóng màn hình đăng nhập để về trang chủ
                                    Navigator.pop(context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: themeColor,
                                    foregroundColor: Colors.black,
                                    padding: const EdgeInsets.symmetric(vertical: 18),
                                    shape: const RoundedRectangleBorder(),
                                    elevation: 10,
                                    shadowColor: themeColor.withOpacity(0.2),
                                  ),
                                  child: const Text(
                                    'ĐĂNG NHẬP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: outlineColor.withOpacity(0.3))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      'HOẶC TIẾP TỤC VỚI',
                                      style: TextStyle(
                                        color: outlineColor,
                                        fontSize: 10,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                  Expanded(child: Divider(color: outlineColor.withOpacity(0.3))),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildSocialButton(
                                      'Google',
                                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA5_qCmiC5VUv3Vaj-QRXpn2umocx1nfGhgl2dw1UWb5s8TPjn5G7I9dfvL7wMMoKKbGpCf2H9TJ5FxBLfBYmX10sA177EW7eGDmFWRPAtFXVchNlNlcDih8aVacQe8t9cT3tOf7aTot-XoA5Z_EQX6SW0VJ7buUgFhryAmMdltgryd-PKPL-IA7UnygdW2Qy_8iFhzLabscMojSiPTwU1OmidVaDusAFBRd-MNxsLxfrjOyXkxdSz08gEiR3UFB500XiZ0CAG494oY',
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: _buildSocialButton(
                                      'Facebook',
                                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDu16-H5Pc2fRC34NBT7qCbfEPi6S_aRQ8mIsAJIF7aHZRkPW_Y-0oRjwJVa_OFVTPXa6CMCoxPvI4GFDvCvo8Vu0Va6sN_a7isSIOESRkCqKrCbXreuOmf3zPny0xJF_KHqf6USnUDL1Bu7XIOtk0QccFPpoYErxnQdOyFobT_jaR2FrdK-W4Y7-imvlhoZtMBz8luaHsyeqZa_22W9aNA3mjjv6eFPRfvW--DSq-zJr96BkJQcScq3dpZoqw-imgQMD0DTYApk8Yd',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Chưa có tài khoản? ', style: TextStyle(color: Colors.white70, fontSize: 14)),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const BarberRegister()),
                                        );
                                      },
                                      child: Text(
                                        'Đăng ký ngay',
                                        style: TextStyle(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 48, height: 1, color: outlineColor.withOpacity(0.3)),
                        const SizedBox(width: 16),
                        Icon(Icons.content_cut, color: themeColor, size: 24),
                        const SizedBox(width: 16),
                        Container(width: 48, height: 1, color: outlineColor.withOpacity(0.3)),
                      ],
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

  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
    String? suffixLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                color: outlineColor,
                fontSize: 10,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (suffixLabel != null)
              Text(
                suffixLabel,
                style: TextStyle(
                  color: themeColor,
                  fontSize: 10,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: outlineColor.withOpacity(0.4)),
            prefixIcon: Icon(icon, color: outlineColor, size: 20),
            prefixIconConstraints: const BoxConstraints(minWidth: 40),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: outlineColor.withOpacity(0.3))),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeColor)),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: outlineColor,
                      size: 20,
                    ),
                    onPressed: onToggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String label, String iconUrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: outlineColor.withOpacity(0.3)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(iconUrl, width: 20, height: 20),
                const SizedBox(width: 12),
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
