import 'package:flutter/material.dart';

class BarberBookingHistory extends StatelessWidget {
  const BarberBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFFFFD700);
    const bgColor = Color(0xFF131313);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: themeColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'LỊCH SỬ ĐẶT LỊCH',
          style: TextStyle(color: themeColor, fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHistoryItem(
              '15 Th05, 2024',
              '14:30',
              'Combo 10 Bước',
              'An Barber',
              'Hoàn thành',
              '100.000đ',
              themeColor,
              isCompleted: true,
            ),
            const SizedBox(height: 20),
            _buildHistoryItem(
              '02 Th05, 2024',
              '10:00',
              'Cắt Tóc & Cạo Mặt',
              'Kiên Barber',
              'Hoàn thành',
              '150.000đ',
              themeColor,
              isCompleted: true,
            ),
            const SizedBox(height: 20),
            _buildHistoryItem(
              '20 Th04, 2024',
              '16:45',
              'Combo 10 Bước',
              'An Barber',
              'Đã hủy',
              '100.000đ',
              themeColor,
              isCompleted: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem(String date, String time, String service, String barber, String status, String price, Color themeColor, {required bool isCompleted}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF20201F),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isCompleted ? themeColor.withOpacity(0.1) : Colors.red.withOpacity(0.1)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: (isCompleted ? themeColor : Colors.red).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: isCompleted ? themeColor : Colors.red, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const Divider(color: Colors.white10, height: 32),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.white38, size: 16),
              const SizedBox(width: 8),
              Text(time, style: const TextStyle(color: Colors.white70, fontSize: 13)),
              const SizedBox(width: 24),
              const Icon(Icons.person_outline, color: Colors.white38, size: 16),
              const SizedBox(width: 8),
              Text(barber, style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(service, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              Text(price, style: TextStyle(color: themeColor, fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
