import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import 'order_summary_screen.dart';
import 'cart_screen.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(context, Icons.arrow_back, () => Navigator.pop(context)),
                  _circleButton(context, Icons.shopping_cart_outlined, () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()))),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        height: 280, width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primary.withOpacity(0.1),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 20, offset: const Offset(0, 10))],
                        ),
                        child: ClipRRect(borderRadius: BorderRadius.circular(16), child: _buildBookCover(context)),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(book.title, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
                    const SizedBox(height: 8),
                    Row(children: [
                      const Icon(Icons.star, color: AppColors.star, size: 20),
                      const SizedBox(width: 4),
                      Text('${book.rating}', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textSecondary(context))),
                    ]),
                    const SizedBox(height: 16),
                    Text(book.description, style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context), height: 1.6)),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              decoration: BoxDecoration(
                color: AppColors.surface(context),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
              ),
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(AppRadius.round)),
                  child: Text('Rs ${book.price.toStringAsFixed(0)}', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrderSummaryScreen(book: book))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(color: AppColors.darkBg(context), borderRadius: BorderRadius.circular(AppRadius.round)),
                      child: Center(child: Text('ORDER NOW', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15, letterSpacing: 1))),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40, height: 40,
        decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.cardBg(context)),
        child: Icon(icon, size: 20, color: AppColors.textPrimary(context)),
      ),
    );
  }

  Widget _buildBookCover(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: book.imageUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.shimmerBase(context),
        highlightColor: AppColors.shimmerHighlight(context),
        child: Container(color: AppColors.cardBg(context)),
      ),
      errorWidget: (context, url, error) => Container(
        color: AppColors.primaryLight,
        child: const Center(child: Icon(Icons.error, color: Colors.white)),
      ),
    );
  }
}
