import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const BookCard({super.key, required this.book, required this.onTap, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(AppRadius.large),
          boxShadow: AppShadows.softShadowDark(context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: _buildBookCover(context),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(book.title, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
                    Row(children: [
                      const Icon(Icons.star, color: AppColors.star, size: 14),
                      const SizedBox(width: 4),
                      Text('${book.rating}', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rs ${book.price}', style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primary)),
                        GestureDetector(
                          onTap: onFavoriteToggle,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                            child: Icon(
                              book.isFavorite ? Icons.favorite : Icons.favorite_border,
                              key: ValueKey(book.isFavorite),
                              color: book.isFavorite ? AppColors.heart : AppColors.textHint(context),
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
