import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/booking_model.dart';

class ApiService {
  static String get _baseUrl {
    if (kIsWeb) {
      return 'http://localhost/barber_api'; 
    } else {
      return 'http://10.0.2.2/barber_api'; 
    }
  }

  final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));

  Future<Map<String, dynamic>> login(String phone, String password) async {
    try {
      final response = await _dio.post('/login.php', data: {
        'phone': phone,
        'password': password,
      });
      return response.data;
    } catch (e) {
      return {'status': 'error', 'message': 'Không thể kết nối máy chủ'};
    }
  }

  Future<Map<String, dynamic>> register(String name, String phone, String password) async {
    try {
      final response = await _dio.post('/register.php', data: {
        'name': name,
        'phone': phone,
        'password': password,
      });
      return response.data;
    } catch (e) {
      return {'status': 'error', 'message': 'Không thể kết nối máy chủ'};
    }
  }

  Future<List<Barber>> getBarbers() async {
    try {
      final response = await _dio.get('/get_barbers.php');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((item) => Barber.fromJson(item)).toList();
      }
    } catch (e) {
      print('API Error (Get Barbers): $e');
    }
    return [];
  }

  Future<List<BarberService>> getServices() async {
    try {
      final response = await _dio.get('/get_services.php');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((item) => BarberService.fromJson(item)).toList();
      }
    } catch (e) {
      print('API Error (Get Services): $e');
    }
    return [];
  }

  Future<List<Booking>> getBookings() async {
    try {
      final response = await _dio.get('/get_bookings.php');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((item) => Booking.fromJson(item)).toList();
      }
    } catch (e) {
      print('API Error (Get Bookings): $e');
    }
    return [];
  }

  Future<List<Review>> getReviews() async {
    try {
      final response = await _dio.get('/get_reviews.php');
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((item) => Review.fromJson(item)).toList();
      }
    } catch (e) {
      print('API Error (Get Reviews): $e');
    }
    return [];
  }

  Future<bool> postReview(Review review) async {
    try {
      final response = await _dio.post(
        '/post_review.php',
        data: {
          'user_name': review.userName,
          'user_status': review.userStatus,
          'comment': review.comment,
          'rating': review.rating,
        },
      );
      return response.statusCode == 200;
    } catch (e) {
      print('API Error (Post Review): $e');
      return false;
    }
  }

  Future<bool> postBooking(Booking booking) async {
    try {
      final response = await _dio.post(
        '/post_booking.php',
        data: booking.toJson(includeId: false),
      );
      return response.statusCode == 201 || response.statusCode == 200;
    } catch (e) {
      print('API Error (Post Booking): $e');
      return false;
    }
  }

  // CẬP NHẬT: Gửi toàn bộ thông tin lịch hẹn để sửa (thợ, ngày, giờ...)
  Future<bool> updateFullBooking(Booking booking) async {
    try {
      final response = await _dio.post(
        '/update_booking.php',
        data: booking.toJson(includeId: true),
      );
      return response.statusCode == 200;
    } catch (e) {
      print('API Error (Update Full Booking): $e');
      return false;
    }
  }

  // Giữ lại hàm này cho việc chỉ cập nhật trạng thái (Hủy lịch)
  Future<bool> updateBookingStatus(int id, String status) async {
    try {
      final response = await _dio.post(
        '/update_booking.php',
        data: {'id': id, 'status': status},
      );
      return response.statusCode == 200;
    } catch (e) {
      print('API Error (Update Status): $e');
      return false;
    }
  }
}
