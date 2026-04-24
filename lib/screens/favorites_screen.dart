import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'book_detail_screen.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});
  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Book> get favoriteBooks => sampleBooks.where((b) => b.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Text('My Favorites', style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
            const SizedBox(height: 4),
            Text('Books you love ❤️', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.textSecondary(context))),
            const SizedBox(height: 20),
            Expanded(
              child: favoriteBooks.isEmpty
                ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.favorite_border, size: 80, color: AppColors.textHint(context)),
                    const SizedBox(height: 16),
                    Text('No favorites yet', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.textSecondary(context))),
                    const SizedBox(height: 8),
                    Text('Tap the heart icon on books you love!', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textHint(context))),
                  ]))
                : GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.62),
                    itemCount: favoriteBooks.length,
                    itemBuilder: (context, index) {
                      return BookCard(
                        book: favoriteBooks[index],
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailScreen(book: favoriteBooks[index]))),
                        onFavoriteToggle: () => setState(() => favoriteBooks[index].isFavorite = !favoriteBooks[index].isFavorite),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
