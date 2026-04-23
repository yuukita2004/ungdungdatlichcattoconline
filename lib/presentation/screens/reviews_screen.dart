import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/providers/booking_provider.dart';
import '../../core/models/booking_model.dart';
import '../../core/services/api_service.dart';
import 'main_shell.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final TextEditingController _commentController = TextEditingController();
  double _selectedRating = 5.0;

  void _showWriteReviewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: AppColors.surfaceContainerHigh,
          title: const Text('Viết Đánh Giá', style: TextStyle(color: Colors.white, fontFamily: 'Noto Serif')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Bạn cảm thấy dịch vụ như thế nào?', style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 13)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _selectedRating ? Icons.star : Icons.star_border,
                      color: AppColors.primary,
                      size: 32,
                    ),
                    onPressed: () => setDialogState(() => _selectedRating = index + 1.0),
                  );
                }),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _commentController,
                maxLines: 3,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Nhập nhận xét của bạn...',
                  hintStyle: const TextStyle(color: Colors.white24),
                  filled: true,
                  fillColor: AppColors.background,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('HỦY', style: TextStyle(color: AppColors.onSurfaceVariant)),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_commentController.text.isEmpty) return;
                
                final provider = Provider.of<BookingProvider>(context, listen: false);
                final newReview = Review(
                  id: '', // Server tự tạo ID
                  userName: provider.userProfile?.name ?? 'Khách hàng',
                  userStatus: provider.userProfile?.membershipRank ?? 'VERIFIED APPOINTMENT',
                  comment: _commentController.text,
                  rating: _selectedRating,
                  timeAgo: 'Vừa xong',
                );

                bool success = await ApiService().postReview(newReview);
                if (success) {
                  await provider.refreshReviews();
                  if (context.mounted) Navigator.pop(context);
                  _commentController.clear();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, foregroundColor: AppColors.onPrimary),
              child: const Text('GỬI ĐÁNH GIÁ'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background.withOpacity(0.9),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.primaryContainer),
          onPressed: () => MainShell.of(context)?.openDrawer(),
        ),
        title: const Text(
          'THE MODERN APOTHECARY',
          style: TextStyle(
            color: AppColors.primaryContainer,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontSize: 16,
            fontFamily: 'Noto Serif',
          ),
        ),
      ),
      body: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          final reviews = provider.reviews;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSummaryHeader(context, reviews),
                const SizedBox(height: 48),
                _buildGallerySection(),
                const SizedBox(height: 48),
                _buildTestimonialsSection(reviews),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryHeader(BuildContext context, List<Review> reviews) {
    double averageRating = 4.9;
    if (reviews.isNotEmpty) {
      double sum = reviews.map((r) => r.rating).reduce((a, b) => a + b);
      averageRating = sum / reviews.length;
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow.withOpacity(0.6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withOpacity(0.05)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'CUSTOMER SATISFACTION',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    averageRating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Noto Serif',
                      color: Colors.white,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < averageRating.floor() ? Icons.star : Icons.star_half,
                              color: AppColors.primary,
                              size: 18,
                            );
                          }),
                        ),
                        Text(
                          'Based on ${reviews.length + 1200} reviews',
                          style: const TextStyle(
                            color: AppColors.onSurfaceVariant,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'EXCEPTIONAL SERVICE',
                    style: TextStyle(
                      color: AppColors.onSurfaceVariant,
                      fontSize: 10,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '98%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rebook rate this month',
                    style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => _showWriteReviewDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.onPrimary,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'ĐÁNH GIÁ',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    final List<String> images = [
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAHDFC-FDls3oBD8PfMgKy93CxgiQbm9HBeFM65Jsqm0gdkYjPYY1wpMKyORwMWZL3SPXDBfcKyMlkQ_q_XAO1c7_vw_QAnw-pKr6ke4-7CV31GUSVYLOb9J-5drJXRksZfVLaHRdh5jsRLApXaXv69SMndOGiMponzaNFGJhZG6Z6FC3zUATBmFBauhp43XU1QpRAMV9dejc6E4IvyM-oek6zyYiMxhsSdWM_e28KNVZqAcqsbTJs7FvMpR44N7IGQzycBwRMuLNE',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuC8TJsu0rZ5VO9XfYAj-Z93dO85RySb5MA9XIOuIdphbBcfYSWLc2UZQ_Bot03lMtTndKlh6vx6OJDMGWWGxvJNG0ckLVnKcvAQnqx3p7gUb-HJrr5pJWMovs2Fh-qThZlV26wrDdkaAAfTUc7xboLEAKY8y9JfuSkN4opNwYyFZJqryLNwYBSX86EN-Z1R56a4NanSTwzvQw435JPkB34sCAXe1X40BS2t0wlo6tuwCK0cVQR9LlkeVGADZElwNqS5sjyMi6bd_G4',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCq9nj9Hs0co8Q22SpI4jX53aQHtsPt70xHZMc6wdyJlk7_8UxoUnq-nZ1OM3xB6ACW_6FQv4HdO0TbKVG7nthT386O3g9dYWXcQcd8cyMygDenhUPpE1TWm4fWDKN643CLRZrBDdm5A7_l4TI_K6tfz1rLqMV9nAdThvvgjVhCwFPSnBndp8tbJZYEG8Ni0-8Rxk0UjE7D_9jBnvM46iYdRjSlQoj6uawWTiKdf62PNYiqyD42KZjaMzTDAIFwNt8nvKKE3EIliiM',
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD44zvEvAHDNgFYNM7I9qlVC_oCHq1oyV-n9xJV8EP-EeLd8sPjweJyw6BkyL5Qr9QVR2bqD3FtlzsdY-0ozzGX9adrukAPDKFi41tXh-_akc03EoNssfAjw57Zz3qOu8KtpzpSM1Us-yv1KH_9pvZxDVcP9wmLRjaALRqqiidsvZ9F5E61fKoEoUzUp15zxfnQcgGmSlY_bz0C_OfFuow99TrejVJAMieCnmt7PMujplLGgcAL9gF7MrkRI5HC_XWVQkCx4HvHG7E',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Gallery of Results',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Noto Serif',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                width: 220,
                margin: EdgeInsets.only(
                  right: 16,
                  top: index % 2 == 0 ? 0 : 20,
                  bottom: index % 2 == 0 ? 20 : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTestimonialsSection(List<Review> reviews) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recent Testimonials',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Noto Serif',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              children: const [
                Text(
                  'SORT BY',
                  style: TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.expand_more, color: AppColors.onSurfaceVariant, size: 14),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        if (reviews.isEmpty)
          const Center(child: Text('Chưa có đánh giá nào.', style: TextStyle(color: AppColors.onSurfaceVariant)))
        else
          ...reviews.map((review) => _buildReviewItem(review)),
          
        const SizedBox(height: 24),
        Center(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Text('VIEW ALL REVIEWS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
            label: const Icon(Icons.arrow_forward, size: 14),
            style: TextButton.styleFrom(foregroundColor: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem(Review review) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.userName,
                      style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      review.userStatus,
                      style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 8, fontWeight: FontWeight.bold, letterSpacing: 1),
                    ),
                    Text(
                      review.timeAgo,
                      style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color: index < review.rating ? AppColors.primary : AppColors.onSurfaceVariant.withOpacity(0.2),
                          size: 14,
                        );
                      }),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      review.comment,
                      style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.6),
                    ),
                    if (review.imageUrl != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(review.imageUrl!, height: 100, width: 100, fit: BoxFit.cover),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          const Icon(Icons.thumb_up_outlined, color: AppColors.onSurfaceVariant, size: 14),
                          const SizedBox(width: 8),
                          Text(
                            'HELPFUL (${review.helpfulCount})',
                            style: const TextStyle(color: AppColors.onSurfaceVariant, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.05)),
        ],
      ),
    );
  }
}
