import '../models/booking_model.dart';

class DataRepository {
  // Đã xóa toàn bộ Barbers và Services giả.
  // Dữ liệu sẽ được lấy trực tiếp từ PHP Backend.

  static final UserProfile currentUser = UserProfile(
    id: 'u1',
    name: 'Khách hàng',
    phone: 'Chưa cập nhật',
    avatarUrl: 'https://via.placeholder.com/150',
    membershipRank: 'Thành viên',
    points: 0,
  );
}
