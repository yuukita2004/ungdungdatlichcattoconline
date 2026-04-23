import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/models/booking_model.dart';
import '../../core/providers/booking_provider.dart';
import 'success_screen.dart';

class BookingScreen extends StatefulWidget {
  final int? editBookingId;
  final String serviceName;
  final String serviceImage;
  final String servicePrice;

  const BookingScreen({
    super.key,
    this.editBookingId,
    this.serviceName = 'Cắt tóc Thiết kế Riêng',
    this.serviceImage = 'https://lh3.googleusercontent.com/aida-public/AB6AXuBEoEVNqeixSG2oZoXsnYXGSwjacD5l-cpQiT78QKcdh4jhRNSENA9ummCqN8YV9arujBaOBQ0GKwOurHACs9FE81ZJa3n0nW_tvbHWSFauyQZMN2DwEwIxx0-SKc22ZAFrobGGwGJV7QOZcGMG_97yhn7V64fCCmq0mUCpaoS6jYNOfGjaeRKCZXG0VSk5aE1HpRiYVIKEJAQOduBQRx0juEySMFYHNo21lAe79rIs4204vPrdyGi0VIrNoQUG0lvCbwL9If43cHA',
    this.servicePrice = '650.000đ',
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedBarberIndex = 0; 
  int selectedDateIndex = 0; 
  String selectedTime = ''; 
  String currentStatus = 'ĐÃ ĐẶT LỊCH';

  late List<DateTime> dateObjects;
  final List<String> morningTimes = ['08:00 AM', '08:30 AM', '09:00 AM', '09:45 AM', '10:00 AM', '10:30 AM', '11:15 AM'];
  final List<String> afternoonTimes = ['01:00 PM', '01:30 PM', '02:00 PM', '02:30 PM', '03:00 PM', '03:30 PM', '04:00 PM', '04:30 PM', '05:00 PM'];
  final List<String> eveningTimes = ['06:00 PM', '06:30 PM', '07:30 PM', '08:00 PM', '08:30 PM', '09:00 PM'];

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    dateObjects = List.generate(30, (index) => now.add(Duration(days: index)));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.editBookingId != null) {
        _loadExistingBooking();
      }
    });
  }

  void _loadExistingBooking() {
    final provider = Provider.of<BookingProvider>(context, listen: false);
    try {
      final existing = provider.upcomingBookings.firstWhere(
        (b) => b.id == widget.editBookingId,
      );

      setState(() {
        selectedTime = existing.time;
        currentStatus = existing.status;
        selectedBarberIndex = provider.barbers.indexWhere((b) => b.name == existing.barberName);
        if (selectedBarberIndex == -1) selectedBarberIndex = 0;

        try {
          DateTime existingDate = DateFormat('dd/MM/yyyy').parse(existing.date);
          selectedDateIndex = dateObjects.indexWhere((d) => 
            d.day == existingDate.day && d.month == existingDate.month && d.year == existingDate.year);
          if (selectedDateIndex == -1) selectedDateIndex = 0;
        } catch (e) {
          selectedDateIndex = 0;
        }
      });
    } catch (e) {
      debugPrint("Existing booking not found");
    }
  }

  bool _isTimeSlotPast(String timeStr) {
    DateTime now = DateTime.now();
    DateTime selectedDate = dateObjects[selectedDateIndex];
    if (selectedDate.day != now.day || selectedDate.month != now.month || selectedDate.year != now.year) return false;
    try {
      int hour = int.parse(timeStr.split(':')[0]);
      int minute = int.parse(timeStr.split(':')[1].split(' ')[0]);
      String amPm = timeStr.split(' ')[1];
      if (amPm == 'PM' && hour < 12) hour += 12;
      if (amPm == 'AM' && hour == 12) hour = 0;
      DateTime slotTime = DateTime(now.year, now.month, now.day, hour, minute);
      return slotTime.isBefore(now);
    } catch (e) { return false; }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
      builder: (context, provider, child) {
        final barbers = provider.barbers;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background.withOpacity(0.9),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.primaryContainer),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              widget.editBookingId != null ? 'THAY ĐỔI LỊCH HẸN' : 'TIỆM TÓC HIỆN ĐẠI',
              style: const TextStyle(color: AppColors.primaryContainer, fontWeight: FontWeight.bold, fontFamily: 'Noto Serif', fontSize: 18),
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeroImage(),
                    const SizedBox(height: 24),
                    _buildServiceInfo(),
                    const SizedBox(height: 40),
                    if (barbers.isNotEmpty) _buildBarberSelection(barbers),
                    const SizedBox(height: 40),
                    _buildDatePickerStrip(),
                    const SizedBox(height: 40),
                    _buildTimePickerSection('BUỔI SÁNG', Icons.wb_sunny, morningTimes),
                    const SizedBox(height: 32),
                    _buildTimePickerSection('BUỔI CHIỀU', Icons.sunny, afternoonTimes),
                    const SizedBox(height: 32),
                    _buildTimePickerSection('BUỔI TỐI', Icons.dark_mode, eveningTimes),
                    const SizedBox(height: 140),
                  ],
                ),
              ),
              _buildFloatingBookingBar(provider),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeroImage() {
    return Container(
      height: 250, width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), image: DecorationImage(image: NetworkImage(widget.serviceImage), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, AppColors.background.withOpacity(0.8)])),
        padding: const EdgeInsets.all(20), alignment: Alignment.bottomLeft,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('DỊCH VỤ CAO CẤP', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
          Text(widget.serviceName, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'Noto Serif')),
        ]),
      ),
    );
  }

  Widget _buildServiceInfo() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
      Expanded(child: Text('Kiểu tóc được thiết kế chính xác theo hình dáng khuôn mặt và phong cách sống của bạn.', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 14, height: 1.5))),
      const SizedBox(width: 24),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text(widget.servicePrice, style: const TextStyle(color: AppColors.primary, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Noto Serif')),
        Row(children: const [Icon(Icons.schedule, size: 12, color: AppColors.onSurfaceVariant), SizedBox(width: 4), Text('45 MIN', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold))]),
      ]),
    ]);
  }

  Widget _buildBarberSelection(List<Barber> barbers) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text('Chọn Thợ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.onSurface, fontFamily: 'Noto Serif')), Text('ĐỘI NGŨ CHUYÊN GIA', style: TextStyle(color: AppColors.primary, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2))]),
      const SizedBox(height: 16),
      SizedBox(height: 140, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: barbers.length, itemBuilder: (context, index) {
        bool isSelected = selectedBarberIndex == index;
        return GestureDetector(onTap: () => setState(() => selectedBarberIndex = index), child: Container(width: 120, margin: const EdgeInsets.only(right: 16), padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(16)), child: Column(children: [CircleAvatar(radius: 30, backgroundImage: NetworkImage(barbers[index].image)), const SizedBox(height: 12), Text(barbers[index].name, style: TextStyle(color: isSelected ? AppColors.onPrimary : AppColors.onSurface, fontWeight: FontWeight.bold, fontSize: 12)), Text(barbers[index].role.toUpperCase(), style: TextStyle(color: isSelected ? AppColors.onPrimary.withOpacity(0.7) : AppColors.onSurfaceVariant, fontSize: 9))])));
      })),
    ]);
  }

  Widget _buildDatePickerStrip() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Chọn Ngày', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.onSurface, fontFamily: 'Noto Serif')), Text(DateFormat('MMMM, yyyy').format(dateObjects[selectedDateIndex]).toUpperCase(), style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2))]),
      const SizedBox(height: 20),
      SizedBox(height: 110, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: dateObjects.length, itemBuilder: (context, index) {
        bool isSelected = selectedDateIndex == index;
        DateTime date = dateObjects[index];
        return GestureDetector(onTap: () => setState(() { selectedDateIndex = index; selectedTime = ''; }), child: AnimatedContainer(duration: const Duration(milliseconds: 200), width: 80, margin: const EdgeInsets.only(right: 12), decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16), border: Border.all(color: isSelected ? AppColors.primary : Colors.white.withOpacity(0.05))), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text(DateFormat('E').format(date), style: TextStyle(color: isSelected ? AppColors.onPrimary.withOpacity(0.8) : AppColors.onSurfaceVariant, fontSize: 11, fontWeight: FontWeight.bold)), const SizedBox(height: 8), Text(date.day.toString().padLeft(2, '0'), style: TextStyle(color: isSelected ? AppColors.onPrimary : AppColors.onSurface, fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Noto Serif'))])));
      })),
    ]);
  }

  Widget _buildTimePickerSection(String title, IconData icon, List<String> timeList) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Icon(icon, color: AppColors.primary, size: 14), const SizedBox(width: 8), Text(title, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2))]),
      const SizedBox(height: 16),
      GridView.builder(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 2.5), itemCount: timeList.length, itemBuilder: (context, index) {
        String time = timeList[index];
        bool isSelected = selectedTime == time;
        bool isPast = _isTimeSlotPast(time);
        return GestureDetector(onTap: isPast ? null : () => setState(() => selectedTime = time), child: Opacity(opacity: isPast ? 0.2 : 1.0, child: Container(decoration: BoxDecoration(color: isSelected ? AppColors.primary : AppColors.surfaceContainerHigh, borderRadius: BorderRadius.circular(12)), alignment: Alignment.center, child: Text(time, style: TextStyle(color: isSelected ? AppColors.onPrimary : AppColors.onSurface, fontWeight: FontWeight.bold, fontSize: 12, decoration: isPast ? TextDecoration.lineThrough : null)))));
      }),
    ]);
  }

  Widget _buildFloatingBookingBar(BookingProvider provider) {
    bool isTimeSelected = selectedTime.isNotEmpty;
    bool isLoading = provider.isLoading;

    return Positioned(
      bottom: 24, 
      left: 24, 
      right: 24, 
      child: Container(
        padding: const EdgeInsets.all(16), 
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A).withOpacity(0.9), 
          borderRadius: BorderRadius.circular(16), 
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 20)]
        ), 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Column(
              mainAxisSize: MainAxisSize.min, 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [
                const Text('TỔNG TẠM TÍNH', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 9, fontWeight: FontWeight.bold)), 
                Text(widget.servicePrice, style: const TextStyle(color: AppColors.primary, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Noto Serif'))
              ]
            ),
            ElevatedButton(
              onPressed: isLoading ? null : () async {
                if (!isTimeSelected) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng chọn khung giờ dịch vụ!'), backgroundColor: Colors.orange),
                  );
                  return;
                }
                if (provider.barbers.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Lỗi: Không có dữ liệu thợ cắt tóc!'), backgroundColor: Colors.redAccent),
                  );
                  return;
                }
                try {
                  final currentBooking = Booking(
                    id: widget.editBookingId, 
                    serviceName: widget.serviceName, 
                    barberName: provider.barbers[selectedBarberIndex].name, 
                    barberImage: provider.barbers[selectedBarberIndex].image, 
                    date: DateFormat('dd/MM/yyyy').format(dateObjects[selectedDateIndex]), 
                    time: selectedTime, 
                    price: widget.servicePrice,
                    status: currentStatus,
                  );
                  bool success = widget.editBookingId != null ? await provider.updateBooking(currentBooking) : await provider.addBooking(currentBooking);
                  if (success && mounted) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessScreen(booking: currentBooking)));
                  } else if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lưu thất bại!'), backgroundColor: Colors.redAccent));
                  }
                } catch (e) {
                  if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Lỗi: $e')));
                }
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, 
                foregroundColor: AppColors.onPrimary, 
                disabledBackgroundColor: Colors.white10, 
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: isLoading ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('XÁC NHẬN ĐẶT LỊCH', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.2)),
            ),
          ],
        ),
      ),
    );
  }
}
