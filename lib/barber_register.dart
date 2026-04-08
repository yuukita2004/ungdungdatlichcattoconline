import 'package:flutter/material.dart';

class BarberRegister extends StatefulWidget {
  const BarberRegister({super.key});

  @override
  State<BarberRegister> createState() => _BarberRegisterState();
}

class _BarberRegisterState extends State<BarberRegister> {
  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;

  final Color themeColor = const Color(0xFFFFD700);
  final Color bgColor = const Color(0xFF131313);
  final Color surfaceColor = const Color(0xFF20201F);
  final Color outlineColor = const Color(0xFF999077);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'KTA BARBER',
          style: TextStyle(
            color: themeColor,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
            fontSize: 24,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(width: 4, color: themeColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'THAM GIA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        'CỘNG ĐỒNG',
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          height: 0.9,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'GIA NHẬP DI SẢN KTA BARBER',
                        style: TextStyle(
                          color: outlineColor.withOpacity(0.8),
                          fontSize: 10,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: surfaceColor,
                border: Border.all(color: Colors.white10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTextField(label: 'HỌ VÀ TÊN', hint: 'Nguyễn Văn A'),
                  const SizedBox(height: 24),
                  _buildTextField(label: 'SỐ ĐIỆN THOẠI', hint: '090 123 4567', keyboardType: TextInputType.phone),
                  const SizedBox(height: 24),
                  _buildTextField(
                    label: 'MẬT KHẨU',
                    hint: '••••••••',
                    isPassword: true,
                    obscureText: !_isPasswordVisible,
                    onToggleVisibility: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  _buildTextField(label: 'XÁC NHẬN MẬT KHẨU', hint: '••••••••', isPassword: true, obscureText: true),
                  const SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _agreeToTerms,
                          onChanged: (val) => setState(() => _agreeToTerms = val!),
                          activeColor: themeColor,
                          checkColor: Colors.black,
                          side: BorderSide(color: outlineColor),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'Tôi đồng ý với ',
                            style: const TextStyle(color: Colors.white70, fontSize: 13),
                            children: [
                              TextSpan(
                                text: 'Điều khoản & Chính sách',
                                style: TextStyle(color: themeColor, decoration: TextDecoration.underline),
                              ),
                              const TextSpan(text: ' của KTA Barber.'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeColor,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: const RoundedRectangleBorder(),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'ĐĂNG KÝ NGAY',
                            style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: -0.5),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Đã có tài khoản?', style: TextStyle(color: Colors.white70)),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFooterText('SINCE 1994'),
                _buildFooterText('SAIGON'),
                _buildFooterText('TRADITION'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    bool isPassword = false,
    bool obscureText = false,
    VoidCallback? onToggleVisibility,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: outlineColor.withOpacity(0.3)),
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

  Widget _buildFooterText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: outlineColor.withOpacity(0.2),
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 2,
        ),
      ),
    );
  }
}
