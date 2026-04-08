import 'package:flutter/material.dart';

class BarberBeardScheduler extends StatefulWidget {
  final String artisanName;
  final String artisanImageUrl;
  final String rating;
  final String serviceName;
  final String price;

  const BarberBeardScheduler({
    super.key,
    required this.artisanName,
    required this.artisanImageUrl,
    required this.rating,
    required this.serviceName,
    required this.price,
  });

  @override
  State<BarberBeardScheduler> createState() => _BarberBeardSchedulerState();
}

class _BarberBeardSchedulerState extends State<BarberBeardScheduler> {
  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));
  String? selectedTime = '14:00';

  final Map<String, List<Map<String, dynamic>>> timeSlots = {
    'Buổi Sáng': [
      {'time': '09:00', 'isAvailable': true},
      {'time': '09:30', 'isAvailable': true},
      {'time': '10:00', 'isAvailable': false},
      {'time': '10:30', 'isAvailable': true},
      {'time': '11:00', 'isAvailable': true},
      {'time': '11:30', 'isAvailable': true},
    ],
    'Buổi Chiều': [
      {'time': '14:00', 'isAvailable': true},
      {'time': '14:30', 'isAvailable': true},
      {'time': '15:00', 'isAvailable': true},
      {'time': '15:30', 'isAvailable': false},
      {'time': '16:00', 'isAvailable': true},
      {'time': '16:30', 'isAvailable': true},
    ],
    'Buổi Tối': [
      {'time': '18:00', 'isAvailable': true},
      {'time': '18:30', 'isAvailable': true},
      {'time': '19:00', 'isAvailable': true},
    ],
  };

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceColor = Color(0xFF1C1B1B);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white54),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'CHỌN LỊCH HẸN',
          style: TextStyle(color: themeColor, fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 18),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAnCVkqeaMcK1p8LkYibjAPqBE9ovZ-LZR4rFjwIe6h94pXBfJM7CQwXlmikG8mMksDbqGnFDtfZG3KVCWH3XtKkSbjUTdbrKMzfly72Q3H-GifkQ0UBaTxgqVZop13xJTYdBvn9f6BI5OAOc07KtJEPdZXPEfWAeXBQ6xKPT_IJd_xNTI7McpIgFpUVGANg12Dcz8AHaWsscLeVJfUkHhaoqnX2lMemWMGfpO4IjFyZRp5EdzR28RVAFRRBVZzVGSRBRWXXMaCaylz'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            // Selected Specialist Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: Text(
                      'Thợ cạo đã chọn',
                      style: TextStyle(color: Colors.white24, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 64,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(widget.artisanImageUrl),
                            fit: BoxFit.cover,
                            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.artisanName.toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.5),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(Icons.star, color: themeColor, size: 14),
                                const SizedBox(width: 4),
                                Text(
                                  '${widget.rating} (120+ Lượt đặt)',
                                  style: const TextStyle(color: themeColor, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Date Selection Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: const [
                Text(
                  'Tháng 10, 2024',
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -1),
                ),
                Text(
                  'Chọn ngày',
                  style: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) {
                  DateTime date = DateTime.now().add(Duration(days: index));
                  bool isSelected = date.day == selectedDate.day;
                  bool isBusy = index == 3; // Example busy state

                  return GestureDetector(
                    onTap: isBusy ? null : () => setState(() => selectedDate = date),
                    child: Opacity(
                      opacity: isBusy ? 0.5 : 1.0,
                      child: Container(
                        width: 64,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          color: isSelected ? themeColor : const Color(0xFF20201F),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white.withOpacity(0.05)),
                          boxShadow: isSelected ? [BoxShadow(color: themeColor.withOpacity(0.2), blurRadius: 10)] : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getDayName(date.weekday),
                              style: TextStyle(
                                color: isSelected ? Colors.black54 : Colors.white38,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              '${date.day}',
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // Time Slots
            ...timeSlots.entries.map((entry) => _buildTimeSection(entry.key, entry.value, themeColor)).toList(),

            const SizedBox(height: 140),
          ],
        ),
      ),

      // Bottom Action Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: bgColor,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.9), Colors.black],
          ),
        ),
        child: ElevatedButton(
          onPressed: selectedTime != null ? () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đặt lịch chăm sóc râu thành công!. Cảm ơn bạn đã tin tưởng KTA!')),
            );
          } : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 20,
            shadowColor: themeColor.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('ĐẶT LỊCH NGAY', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 16)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSection(String title, List<Map<String, dynamic>> slots, Color themeColor) {
    IconData icon = title.contains('Sáng') ? Icons.light_mode : (title.contains('Chiều') ? Icons.sunny : Icons.dark_mode);
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white38, size: 18),
              const SizedBox(width: 12),
              Text(
                title.toUpperCase(),
                style: const TextStyle(color: Colors.white38, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: slots.length,
            itemBuilder: (context, index) {
              final slot = slots[index];
              bool isSelected = selectedTime == slot['time'];
              bool isAvailable = slot['isAvailable'];

              return GestureDetector(
                onTap: isAvailable ? () => setState(() => selectedTime = slot['time']) : null,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? themeColor : const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                  ),
                  child: Opacity(
                    opacity: isAvailable ? 1.0 : 0.2,
                    child: Text(
                      slot['time'],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                        fontSize: 14,
                        decoration: isAvailable ? null : TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'Thứ 2';
      case 2: return 'Thứ 3';
      case 3: return 'Thứ 4';
      case 4: return 'Thứ 5';
      case 5: return 'Thứ 6';
      case 6: return 'Thứ 7';
      case 7: return 'Chủ Nhật';
      default: return '';
    }
  }
}
