import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import '../widgets/book_card.dart';
import '../widgets/category_chip.dart';
import 'book_detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final List<String> categories = ['All', 'Story', 'Action', 'Fiction'];

  List<Book> get filteredBooks {
    List<Book> books = sampleBooks;
    if (selectedCategory != 'All') {
      books = books.where((b) => b.category == selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      books = books.where((b) =>
        b.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        b.author.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    return books;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildHeader(),
            const SizedBox(height: 20),
            _buildSearchBar(),
            const SizedBox(height: 20),
            _buildCategoryChips(),
            const SizedBox(height: 20),
            Expanded(child: _buildBookGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BookNest', style: GoogleFonts.pacifico(fontSize: 28, color: AppColors.textPrimary(context))),
            const SizedBox(height: 4),
            Text('Order your favourite Book!', style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context))),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen())),
              child: Container(
                width: 44, height: 44,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: AppColors.cardBg(context),
                  border: Border.all(color: AppColors.divider(context)),
                  borderRadius: BorderRadius.circular(AppRadius.medium),
                ),
                child: Icon(Icons.shopping_cart_outlined, color: AppColors.textPrimary(context), size: 22),
              ),
            ),
            Container(
              width: 44, height: 44,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppRadius.medium),
              ),
              child: const Icon(Icons.person, color: Colors.white, size: 24),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.cardBg(context),
              borderRadius: BorderRadius.circular(AppRadius.xlarge),
              border: Border.all(color: AppColors.divider(context), width: 1.5),
              boxShadow: AppShadows.softShadowDark(context),
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (v) => setState(() => _searchQuery = v),
              style: GoogleFonts.poppins(color: AppColors.textPrimary(context)),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(color: AppColors.textHint(context), fontSize: 15),
                prefixIcon: Icon(Icons.search, color: AppColors.textSecondary(context), size: 22),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 50, height: 50,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.medium),
            boxShadow: AppShadows.buttonShadow,
          ),
          child: const Icon(Icons.tune_rounded, color: Colors.white, size: 22),
        ),
      ],
    );
  }

  Widget _buildCategoryChips() {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return CategoryChip(
            label: categories[index],
            isSelected: selectedCategory == categories[index],
            onTap: () => setState(() => selectedCategory = categories[index]),
          );
        },
      ),
    );
  }

  Widget _buildBookGrid() {
    final books = filteredBooks;
    if (books.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 64, color: AppColors.textHint(context)),
            const SizedBox(height: 16),
            Text('No books found', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textSecondary(context))),
          ],
        ),
      );
    }
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16, childAspectRatio: 0.62,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) {
        return BookCard(
          book: books[index],
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => BookDetailScreen(book: books[index])),
          ),
          onFavoriteToggle: () => setState(() => books[index].isFavorite = !books[index].isFavorite),
        );
      },
    );
  }
}
