import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/booking_model.dart';
import '../repositories/data_repository.dart';
import '../services/storage_service.dart';
import '../services/api_service.dart';

class BookingProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  
  List<Barber> _barbers = [];
  List<BarberService> _services = [];
  List<Review> _reviews = [];
  UserProfile? _userProfile; 
  
  List<Booking> _upcomingBookings = [];
  List<Booking> _completedBookings = [];

  List<Barber> get barbers => _barbers;
  List<BarberService> get services => _services;
  List<Review> get reviews => _reviews;
  UserProfile? get userProfile => _userProfile;
  List<Booking> get upcomingBookings => _upcomingBookings;
  List<Booking> get completedBookings => _completedBookings;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadInitialData() async {
    _isLoading = true;
    notifyListeners();
    try {
      UserProfile? savedProfile = await StorageService.loadUserProfile();
      if (savedProfile != null) _userProfile = savedProfile;
      
      final results = await Future.wait([
        _apiService.getBarbers(),
        _apiService.getServices(),
        _apiService.getBookings(),
        _apiService.getReviews(),
      ]);
      
      _barbers = results[0] as List<Barber>;
      _services = results[1] as List<BarberService>;
      final allBookings = results[2] as List<Booking>;
      _reviews = results[3] as List<Review>;

      _upcomingBookings = allBookings.where((b) => b.status == 'ĐÃ ĐẶT LỊCH').toList();
      _completedBookings = allBookings.where((b) => b.status != 'ĐÃ ĐẶT LỊCH').toList();

    } catch (e) {
      debugPrint("Load Error: \$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserProfileManually(UserProfile profile) async {
    _userProfile = profile;
    if (!kIsWeb) {
      await StorageService.saveUserProfile(profile);
    }
    notifyListeners();
  }

  Future<void> updateUserProfile({required String name, required String phone}) async {
    if (_userProfile == null) return;
    
    _userProfile = UserProfile(
      id: _userProfile!.id,
      name: name,
      phone: phone,
      avatarUrl: _userProfile!.avatarUrl,
      membershipRank: _userProfile!.membershipRank,
      points: _userProfile!.points,
    );
    
    if (!kIsWeb) {
      await StorageService.saveUserProfile(_userProfile!);
    }
    notifyListeners();
  }

  Future<void> refreshBookings() async {
    try {
      final allBookings = await _apiService.getBookings();
      _upcomingBookings = allBookings.where((b) => b.status == 'ĐÃ ĐẶT LỊCH').toList();
      _completedBookings = allBookings.where((b) => b.status != 'ĐÃ ĐẶT LỊCH').toList();
      notifyListeners();
    } catch (e) {
      debugPrint("Refresh Error: \$e");
    }
  }

  Future<void> refreshReviews() async {
    try {
      _reviews = await _apiService.getReviews();
      notifyListeners();
    } catch (e) {
      debugPrint("Refresh Reviews Error: \$e");
    }
  }

  Future<bool> addBooking(Booking booking) async {
    _isLoading = true;
    notifyListeners();
    try {
      bool success = await _apiService.postBooking(booking);
      await refreshBookings();
      return success;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // CẬP NHẬT: Gửi toàn bộ lịch hẹn mới lên server khi có sự thay đổi
  Future<bool> updateBooking(Booking booking) async {
    _isLoading = true;
    notifyListeners();
    try {
      bool success = await _apiService.updateFullBooking(booking);
      if (success) {
        await refreshBookings();
      }
      return success;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> cancelBooking(int? id) async {
    if (id == null) return false;
    _isLoading = true;
    notifyListeners();
    try {
      await _apiService.updateBookingStatus(id, 'ĐÃ HỦY');
      await refreshBookings();
      return true;
    } catch (e) {
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _userProfile = null;
    notifyListeners();
  }
}
