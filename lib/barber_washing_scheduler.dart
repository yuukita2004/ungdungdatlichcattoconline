import 'package:flutter/material.dart';

class BarberWashingScheduler extends StatefulWidget {
  final String serviceName;
  final String price;
  final String duration;
  final String specialistName;
  final String specialistImage;
  final String rating;

  const BarberWashingScheduler({
    super.key,
    required this.serviceName,
    required this.price,
    required this.duration,
    required this.specialistName,
    required this.specialistImage,
    required this.rating,
  });

  @override
  State<BarberWashingScheduler> createState() => _BarberWashingSchedulerState();
}

class _BarberWashingSchedulerState extends State<BarberWashingScheduler> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime = '13:00';

  final Map<String, List<Map<String, dynamic>>> timeSlots = {
    'Buổi Sáng': [
      {'time': '08:00', 'status': 'available'},
      {'time': '09:00', 'status': 'available'},
      {'time': '10:00', 'status': 'available'},
      {'time': '11:00', 'status': 'available'},
    ],
    'Buổi Chiều': [
      {'time': '13:00', 'status': 'available'},
      {'time': '14:00', 'status': 'available'},
      {'time': '15:00', 'status': 'busy'},
      {'time': '16:00', 'status': 'available'},
      {'time': '17:00', 'status': 'available'},
      {'time': '18:00', 'status': 'available'},
    ],
    'Buổi Tối': [
      {'time': '19:00', 'status': 'available'},
      {'time': '20:00', 'status': 'available'},
      {'time': '21:00', 'status': 'available'},
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
      body: Stack(
        children: [
          // Background Decoration
          Positioned.fill(
            child: Opacity(
              opacity: 0.03,
              child: Center(
                child: Icon(Icons.spa_outlined, size: 400, color: themeColor),
              ),
            ),
          ),
          
          CustomScrollView(
            slivers: [
              // Top Navigation
              SliverAppBar(
                backgroundColor: bgColor.withOpacity(0.7),
                floating: true,
                pinned: true,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: themeColor),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  'KTA BARBER',
                  style: TextStyle(
                    color: themeColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                    fontSize: 20,
                  ),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDoOH1KYW-FEuyGG7XEca8rWWJLDjcVLai64TXHquGacid-2UzTabM-NVURPQcQSdn6r255AddgMqEF2T8JZ_cj4tjC--cXJDFDUZ24NP8PsHfrR6QlX6wkYYu748kCf1aigkne8k7nZ7j-2DyslbpISjDMBRTf11nm3czbqE_RauTHSOdWgNYx7T7GGSHZd_D5wsJUfdTSTBxEE9_hV63GqLeM9MFWHkvtPSqtKZmqNucR94soG5o_c8mpy82JHQkhKjLQGrfjeqJM'),
                    ),
                  )
                ],
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Section
                      const Text(
                        'Dịch vụ đặt lịch',
                        style: TextStyle(color: themeColor, fontSize: 10, letterSpacing: 3, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'CHỌN LỊCH HẸN',
                        style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w900, letterSpacing: -1),
                      ),
                      const SizedBox(height: 32),

                      // Specialist Card
                      Container(
                        decoration: BoxDecoration(
                          color: surfaceHigh,
                          border: const Border(left: BorderSide(color: themeColor, width: 4)),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                              widget.specialistImage,
                              width: 100,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Nghệ nhân đã chọn', style: TextStyle(color: Colors.white38, fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 1)),
                                  Text(widget.specialistName, style: const TextStyle(color: themeColor, fontSize: 20, fontWeight: FontWeight.bold)),
                                  const Text('Bậc thầy thư giãn & Chăm sóc da đầu', style: TextStyle(color: Colors.white70, fontSize: 12, fontStyle: FontStyle.italic)),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.star, color: themeColor, size: 12),
                                      const SizedBox(width: 4),
                                      Text('${widget.rating} (120+ đánh giá)', style: const TextStyle(color: Colors.white38, fontSize: 10)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Date Picker Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Chọn ngày', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 2)),
                          Text('Tháng 10, 2024', style: TextStyle(color: Colors.white38, fontSize: 12, fontStyle: FontStyle.italic)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      
                      // Horizontal Date Picker
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            DateTime date = DateTime.now().add(Duration(days: index));
                            bool isSelected = date.day == selectedDate.day;
                            return GestureDetector(
                              onTap: () => setState(() => selectedDate = date),
                              child: Container(
                                width: 64,
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  color: isSelected ? themeColor : surfaceColor,
                                  border: isSelected ? null : Border.all(color: Colors.white10),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(_getDayName(date.weekday), style: TextStyle(color: isSelected ? Colors.black87 : Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
                                    Text('${date.day}', style: TextStyle(color: isSelected ? Colors.black : Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Time Slots
                      ...timeSlots.entries.map((entry) => _buildTimeSection(entry.key, entry.value, themeColor)),

                      const SizedBox(height: 40),

                      // Service Info Brief
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          border: Border.all(color: Colors.white.withOpacity(0.05)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Dịch vụ đã chọn', style: TextStyle(color: Colors.white38, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
                                Text(widget.serviceName, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(widget.price, style: const TextStyle(color: themeColor, fontSize: 20, fontWeight: FontWeight.w900)),
                                Text(widget.duration, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, bgColor.withOpacity(0.9), bgColor],
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                   ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đặt lịch gội đầu thành công!. Cảm ơn bạn đã tin tưởng KTA!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeColor,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                  elevation: 20,
                  shadowColor: themeColor.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('ĐẶT LỊCH', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 4, fontSize: 16)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSection(String title, List<Map<String, dynamic>> slots, Color themeColor) {
    IconData icon;
    if (title.contains('Sáng')) icon = Icons.light_mode_outlined;
    else if (title.contains('Chiều')) icon = Icons.wb_sunny_outlined;
    else icon = Icons.dark_mode_outlined;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
          child: Row(
            children: [
              Icon(icon, color: themeColor, size: 18),
              const SizedBox(width: 8),
              Text(title, style: const TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2.2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: slots.length,
          itemBuilder: (context, index) {
            final slot = slots[index];
            bool isBusy = slot['status'] == 'busy';
            bool isSelected = selectedTime == slot['time'];

            return GestureDetector(
              onTap: isBusy ? null : () => setState(() => selectedTime = slot['time']),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? themeColor : Colors.transparent,
                  border: Border.all(color: isSelected ? themeColor : Colors.white24),
                ),
                alignment: Alignment.center,
                child: Text(
                  slot['time'],
                  style: TextStyle(
                    color: isBusy ? Colors.white10 : (isSelected ? Colors.black : Colors.white),
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    decoration: isBusy ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  String _getDayName(int weekday) {
    switch (weekday) {
      case 1: return 'TH 2';
      case 2: return 'TH 3';
      case 3: return 'TH 4';
      case 4: return 'TH 5';
      case 5: return 'TH 6';
      case 6: return 'TH 7';
      case 7: return 'CN';
      default: return '';
    }
  }
}
