import 'package:flutter/material.dart';

class BarberBookingScheduler extends StatefulWidget {
  final String artisanName;
  final String artisanImageUrl;
  final String rating;

  const BarberBookingScheduler({
    super.key,
    required this.artisanName,
    required this.artisanImageUrl,
    required this.rating,
  });

  @override
  State<BarberBookingScheduler> createState() => _BarberBookingSchedulerState();
}

class _BarberBookingSchedulerState extends State<BarberBookingScheduler> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime = '09:00';

  final Map<String, List<Map<String, dynamic>>> timeSlots = {
    'Buổi sáng': [
      {'time': '09:00', 'status': 'available', 'icon': Icons.light_mode},
      {'time': '09:45', 'status': 'busy', 'icon': Icons.light_mode},
      {'time': '10:30', 'status': 'available', 'icon': Icons.light_mode},
    ],
    'Buổi chiều': [
      {'time': '14:00', 'status': 'available', 'icon': Icons.sunny},
      {'time': '15:15', 'status': 'available', 'icon': Icons.sunny},
      {'time': '16:30', 'status': 'busy', 'icon': Icons.sunny},
      {'time': '17:45', 'status': 'available', 'icon': Icons.sunny},
    ],
    'Buổi tối': [
      {'time': '19:30', 'status': 'available', 'icon': Icons.dark_mode},
      {'time': '20:45', 'status': 'available', 'icon': Icons.dark_mode},
    ],
  };

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);
    const surfaceColor = Color(0xFF20201F);
    const surfaceHigh = Color(0xFF2A2A2A);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: false,
        title: const Text(
          'KTA BARBER',
          style: TextStyle(
            color: themeColor,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            fontSize: 18,
          ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Dịch vụ đặt lịch',
                    style: TextStyle(
                      color: themeColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'CHỌN LỊCH HẸN CẮT TÓC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(8),
                  border: const Border(left: BorderSide(color: themeColor, width: 4)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.artisanImageUrl,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: themeColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Pro',
                              style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thợ đã chọn',
                            style: TextStyle(color: Color(0xFF78716C), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 2),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.artisanName.toUpperCase(),
                            style: const TextStyle(color: Color(0xFFE5E2E1), fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.star, color: themeColor, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                widget.rating,
                                style: const TextStyle(color: Color(0xFFE5E2E1), fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                ' • 150+ đánh giá',
                                style: TextStyle(color: Color(0xFF78716C), fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Tháng 10, 2024',
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: -1),
                  ),
                  Text(
                    'Chọn ngày',
                    style: TextStyle(color: themeColor, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 7,
                itemBuilder: (context, index) {
                  DateTime date = DateTime.now().add(Duration(days: index));
                  bool isSelected = date.day == selectedDate.day;
                  bool isBusy = index == 4;

                  return GestureDetector(
                    onTap: isBusy ? null : () => setState(() => selectedDate = date),
                    child: Opacity(
                      opacity: isBusy ? 0.5 : 1.0,
                      child: Container(
                        width: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? themeColor : surfaceColor,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: isSelected
                              ? [BoxShadow(color: themeColor.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)]
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getDayName(date.weekday),
                              style: TextStyle(
                                color: isSelected ? Colors.black.withOpacity(0.8) : const Color(0xFF78716C),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${date.day}',
                              style: TextStyle(
                                color: isSelected ? Colors.black : const Color(0xFFE5E2E1),
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            if (isSelected)
                              Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.only(top: 4),
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
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
            ...timeSlots.entries.map((entry) => _buildTimeSection(entry.key, entry.value, themeColor, surfaceHigh)).toList(),
            const SizedBox(height: 140),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(24, 10, 24, 24),
        decoration: const BoxDecoration(
          color: bgColor,
        ),
        child: ElevatedButton(
          onPressed: selectedTime != null ? () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đặt lịch cắt tóc thành công!. Cảm ơn bạn đã tin tưởng KTA!')),
            );
          } : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: themeColor,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            elevation: 10,
            shadowColor: themeColor.withOpacity(0.3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('ĐẶT LỊCH', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 2, fontSize: 14)),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 18),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSection(String title, List<Map<String, dynamic>> slots, Color themeColor, Color surfaceHigh) {
    IconData sectionIcon = slots.first['icon'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(sectionIcon, color: const Color(0xFFABCDCD), size: 18),
              const SizedBox(width: 8),
              Text(
                title.toUpperCase(),
                style: const TextStyle(color: Color(0xFFE5E2E1), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 2),
              ),
              const SizedBox(width: 12),
              Expanded(child: Container(height: 1, color: const Color(0xFF4D4732).withOpacity(0.2))),
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
              bool isBusy = slot['status'] == 'busy';

              return GestureDetector(
                onTap: isBusy ? null : () => setState(() => selectedTime = slot['time']),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.transparent : surfaceHigh,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isSelected ? themeColor : (isBusy ? Colors.transparent : Colors.transparent),
                    ),
                    boxShadow: isSelected ? [BoxShadow(color: themeColor.withOpacity(0.1), blurRadius: 4)] : null,
                  ),
                  child: Opacity(
                    opacity: isBusy ? 0.4 : 1.0,
                    child: Text(
                      slot['time'],
                      style: TextStyle(
                        color: isSelected ? themeColor : const Color(0xFFE5E2E1),
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        decoration: isBusy ? TextDecoration.lineThrough : null,
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
