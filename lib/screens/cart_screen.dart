import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import 'order_summary_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<Book> cartItems;

  @override
  void initState() {
    super.initState();
    cartItems = sampleBooks.take(2).toList();
  }

  double get subtotal => cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: AppColors.surface(context),
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: AppColors.iconColor(context)), onPressed: () => Navigator.pop(context)),
        title: Text('My Cart', style: GoogleFonts.poppins(color: AppColors.textPrimary(context), fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: cartItems.isEmpty
        ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.shopping_cart_outlined, size: 80, color: AppColors.textHint(context)),
            const SizedBox(height: 16),
            Text('Your cart is empty', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.textSecondary(context))),
          ]))
        : Column(children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                itemCount: cartItems.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final book = cartItems[index];
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(16), boxShadow: AppShadows.softShadowDark(context)),
                    child: Row(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: book.imageUrl, width: 70, height: 100, fit: BoxFit.cover,
                          placeholder: (ctx, url) => Shimmer.fromColors(baseColor: AppColors.shimmerBase(context), highlightColor: AppColors.shimmerHighlight(context), child: Container(width: 70, height: 100, color: AppColors.cardBg(context))),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(book.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
                        const SizedBox(height: 4),
                        Text(book.author, style: GoogleFonts.poppins(color: AppColors.textSecondary(context), fontSize: 12)),
                        const SizedBox(height: 8),
                        Text('Rs ${book.price}', style: GoogleFonts.poppins(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 14)),
                      ])),
                      IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), onPressed: () => setState(() => cartItems.removeAt(index))),
                    ]),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: AppColors.surface(context), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))], borderRadius: const BorderRadius.vertical(top: Radius.circular(32))),
              child: SafeArea(child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text('Subtotal', style: GoogleFonts.poppins(fontSize: 16, color: AppColors.textSecondary(context))),
                  Text('Rs $subtotal', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary(context))),
                ]),
                const SizedBox(height: 24),
                SizedBox(width: double.infinity, child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => OrderSummaryScreen(book: cartItems.first))),
                  style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  child: Text('Checkout', style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                )),
              ])),
            ),
          ]),
    );
  }
}
