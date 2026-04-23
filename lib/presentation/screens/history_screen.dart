import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/booking_provider.dart';
import '../../core/models/booking_model.dart';
import 'booking_screen.dart';
import 'main_shell.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  // Biến để theo dõi id đang được xử lý hủy
  int? _cancelingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryContainer),
          onPressed: () => MainShell.of(context)?.openDrawer(),
        ),
        title: const Text(
          'LỊCH SỬ DỊCH VỤ',
          style: TextStyle(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
            fontSize: 18,
            fontFamily: 'Noto Serif',
          ),
        ),
      ),
      body: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          final upcoming = provider.upcomingBookings;
          final completed = provider.completedBookings;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader('Lịch hẹn sắp tới'),
                if (upcoming.isEmpty)
                  _buildEmptyState('Bạn không có lịch hẹn nào sắp tới.')
                else
                  ...upcoming.map((booking) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildUpcomingCard(booking, provider),
                  )),

                const SizedBox(height: 40),
                _buildSectionHeader('Hoạt động gần đây'),
                if (completed.isEmpty)
                  _buildEmptyState('Chưa có lịch sử hoạt động.')
                else
                  ...completed.map((booking) => _buildCompletedItem(booking)),
                
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(String message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        message,
        style: const TextStyle(color: AppColors.onSurfaceVariant, fontStyle: FontStyle.italic, fontSize: 13),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5),
          ),
          const SizedBox(width: 16),
          Expanded(child: Container(height: 0.5, color: AppColors.primary.withOpacity(0.2))),
        ],
      ),
    );
  }

  Widget _buildUpcomingCard(Booking booking, BookingProvider provider) {
    bool isThisCanceling = _cancelingId == booking.id;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.surfaceContainerHigh,
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 28, backgroundImage: NetworkImage(booking.barberImage)),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(booking.serviceName, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Noto Serif')),
                    Text('với ${booking.barberName}', style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 12, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text('${booking.time} - ${booking.date}', style: const TextStyle(color: AppColors.primary, fontSize: 11, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: (provider.isLoading || isThisCanceling) ? null : () async {
                    setState(() => _cancelingId = booking.id);
                    bool success = await provider.cancelBooking(booking.id);
                    if (mounted) {
                      setState(() => _cancelingId = null);
                      if (success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Đã hủy lịch hẹn thành công'), backgroundColor: Colors.redAccent),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Hủy thất bại. Vui lòng thử lại!'), backgroundColor: Colors.orange),
                        );
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    disabledForegroundColor: Colors.redAccent.withOpacity(0.3),
                  ),
                  child: isThisCanceling 
                    ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.redAccent))
                    : const Text('HỦY LỊCH', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: (provider.isLoading || isThisCanceling) ? null : () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => BookingScreen(
                          editBookingId: booking.id,
                          serviceName: booking.serviceName,
                          serviceImage: booking.barberImage,
                          servicePrice: booking.price,
                        )
                      )
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    disabledBackgroundColor: AppColors.primary.withOpacity(0.3),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text('THAY ĐỔI', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompletedItem(Booking booking) {
    bool isCancelled = booking.status == 'ĐÃ HỦY';
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.surfaceContainerLow, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(booking.date, style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10)),
              Text(booking.serviceName, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white)),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isCancelled ? Colors.red.withOpacity(0.1) : Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              booking.status,
              style: TextStyle(color: isCancelled ? Colors.redAccent : Colors.greenAccent, fontSize: 9, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
