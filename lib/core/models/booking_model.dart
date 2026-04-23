import 'package:intl/intl.dart';

// 1. Bảng Users: Thông tin khách hàng, hạng thành viên, điểm thưởng
class UserProfile {
  final String id;
  final String name;
  final String phone;
  final String avatarUrl;
  final String membershipRank;
  final int points;

  UserProfile({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatarUrl,
    required this.membershipRank,
    required this.points,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json['id'].toString(),
    name: json['name'] ?? '',
    phone: json['phone'] ?? '',
    avatarUrl: json['avatar_url'] ?? '',
    membershipRank: json['membership_rank'] ?? 'SILVER',
    points: json['points'] is int ? json['points'] : int.tryParse(json['points']?.toString() ?? '0') ?? 0,
  );
}

// 2. Bảng Barbers: Danh sách thợ, cấp bậc, hình ảnh
class Barber {
  final String id;
  final String name;
  final String role; 
  final String image;

  Barber({required this.id, required this.name, required this.role, required this.image});

  factory Barber.fromJson(Map<String, dynamic> json) => Barber(
    id: json['id'].toString(),
    name: json['name'] ?? '',
    role: json['role'] ?? '',
    image: json['image'] ?? '',
  );
}

// 3. Bảng Services: Gói dịch vụ, giá, thời gian thực hiện
class BarberService {
  final String id;
  final String name;
  final String description;
  final String price;
  final String duration; 
  final String imageUrl;

  BarberService({
    required this.id, 
    required this.name, 
    required this.description, 
    required this.price, 
    required this.duration,
    required this.imageUrl,
  });

  factory BarberService.fromJson(Map<String, dynamic> json) => BarberService(
    id: json['id'].toString(),
    name: json['name'] ?? '',
    description: json['description'] ?? '',
    price: json['price'] ?? '',
    duration: json['duration'] ?? '',
    imageUrl: json['imageUrl'] ?? '',
  );
}

// 4. Bảng Appointments (Bookings): Lưu vết lịch hẹn
class Booking {
  final int? id; 
  final String serviceName;
  final String barberName;
  final String barberImage;
  final String date;
  final String time;
  final String price;
  final String status;

  Booking({
    this.id,
    required this.serviceName,
    required this.barberName,
    required this.barberImage,
    required this.date,
    required this.time,
    required this.price,
    this.status = 'ĐÃ ĐẶT LỊCH',
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
    id: json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? ''),
    serviceName: json['serviceName'] ?? '',
    barberName: json['barberName'] ?? '',
    barberImage: json['barberImage'] ?? '',
    date: json['date'] ?? '',
    time: json['time'] ?? '',
    price: json['price'] ?? '',
    status: json['status'] ?? 'ĐÃ ĐẶT LỊCH',
  );

  // SỬA ĐỔI: Khai báo kiểu Map rõ ràng để tránh lỗi gán int vào String
  Map<String, dynamic> toJson({bool includeId = true}) {
    final Map<String, dynamic> map = {
      'serviceName': serviceName,
      'barberName': barberName,
      'barberImage': barberImage,
      'date': date,
      'time': time,
      'price': price,
      'status': status,
    };
    if (includeId && id != null) {
      map['id'] = id;
    }
    return map;
  }
}

// 5. Bảng Reviews
class Review {
  final String id;
  final String userName;
  final String userStatus;
  final String comment;
  final double rating;
  final String timeAgo;
  final String? imageUrl;
  final int helpfulCount;

  Review({
    required this.id,
    required this.userName,
    required this.userStatus,
    required this.comment,
    required this.rating,
    required this.timeAgo,
    this.imageUrl,
    this.helpfulCount = 0,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'].toString(),
    userName: json['user_name'] ?? 'Khách hàng',
    userStatus: json['user_status'] ?? 'VERIFIED APPOINTMENT',
    comment: json['comment'] ?? '',
    rating: double.tryParse(json['rating'].toString()) ?? 5.0,
    timeAgo: json['created_at'] ?? 'Vừa xong',
    imageUrl: json['image_url'],
    helpfulCount: int.tryParse(json['helpful_count']?.toString() ?? '0') ?? 0,
  );
}
