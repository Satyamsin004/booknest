import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import 'book_detail_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  List<Book> get wishlistBooks => sampleBooks.where((b) => b.isFavorite).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Stack(alignment: Alignment.center, children: [
            Align(alignment: Alignment.centerLeft, child: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.iconColor(context)), onPressed: () => Navigator.pop(context))),
            Text('WISHLIST', style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context))),
            Align(alignment: Alignment.centerRight, child: IconButton(icon: const Icon(Icons.favorite, color: AppColors.primary), onPressed: () {})),
          ]),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.62),
            itemCount: wishlistBooks.length,
            itemBuilder: (context, index) {
              return BookCard(
                book: wishlistBooks[index],
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => BookDetailScreen(book: wishlistBooks[index]))),
                onFavoriteToggle: () {},
              );
            },
          ),
        ),
      ]),
    );
  }
}
