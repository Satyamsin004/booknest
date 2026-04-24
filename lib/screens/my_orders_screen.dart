import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _activeOrders = [
    {'id': '#1869', 'title': 'The Great Gatsby', 'author': 'F. Scott Fitzgerald', 'price': 299.0, 'status': 'Out for delivery', 'statusColor': Colors.orange, 'date': 'Today, 11:45 AM', 'items': 1},
    {'id': '#1854', 'title': 'Atomic Habits', 'author': 'James Clear', 'price': 499.0, 'status': 'Picking Items', 'statusColor': Colors.blue, 'date': 'Today, 9:30 AM', 'items': 2},
  ];
  final List<Map<String, dynamic>> _pastOrders = [
    {'id': '#1820', 'title': 'Rich Dad Poor Dad', 'author': 'Robert T. Kiyosaki', 'price': 350.0, 'status': 'Delivered', 'statusColor': const Color(0xFF34C759), 'date': 'Apr 20, 2026', 'items': 1},
    {'id': '#1798', 'title': 'The Alchemist', 'author': 'Paulo Coelho', 'price': 280.0, 'status': 'Delivered', 'statusColor': const Color(0xFF34C759), 'date': 'Apr 18, 2026', 'items': 1},
    {'id': '#1765', 'title': 'Ikigai', 'author': 'Héctor García', 'price': 399.0, 'status': 'Delivered', 'statusColor': const Color(0xFF34C759), 'date': 'Apr 15, 2026', 'items': 3},
    {'id': '#1740', 'title': 'Sapiens', 'author': 'Yuval Noah Harari', 'price': 550.0, 'status': 'Cancelled', 'statusColor': AppColors.primary, 'date': 'Apr 12, 2026', 'items': 1},
  ];

  @override
  void initState() { super.initState(); _tabController = TabController(length: 2, vsync: this); }
  @override
  void dispose() { _tabController.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background(context),
      body: SafeArea(child: Column(children: [
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Row(children: [
          GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 40, height: 40, decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.textPrimary(context)))),
          const SizedBox(width: 16),
          Text('My Orders', style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
        ])),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(12)),
          child: TabBar(controller: _tabController, indicator: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(12)),
            labelColor: Colors.white, unselectedLabelColor: AppColors.textSecondary(context),
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14), unselectedLabelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 14),
            indicatorSize: TabBarIndicatorSize.tab, dividerColor: Colors.transparent,
            tabs: const [Tab(text: 'Active'), Tab(text: 'Past Orders')]),
        ),
        const SizedBox(height: 16),
        Expanded(child: TabBarView(controller: _tabController, children: [_buildList(_activeOrders, true), _buildList(_pastOrders, false)])),
      ])),
    );
  }

  Widget _buildList(List<Map<String, dynamic>> orders, bool isActive) {
    if (orders.isEmpty) return Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(Icons.shopping_bag_outlined, size: 80, color: AppColors.textHint(context)),
      const SizedBox(height: 16),
      Text('No orders yet', style: GoogleFonts.poppins(fontSize: 18, color: AppColors.textSecondary(context))),
    ]));
    return ListView.separated(physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 20), itemCount: orders.length, separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) => _buildCard(orders[index], isActive));
  }

  Widget _buildCard(Map<String, dynamic> order, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: AppColors.cardBg(context), borderRadius: BorderRadius.circular(AppRadius.large), border: isActive ? Border.all(color: (order['statusColor'] as Color).withOpacity(0.3), width: 1) : null),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text('Order ${order['id']}', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.textPrimary(context))),
          Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), decoration: BoxDecoration(color: (order['statusColor'] as Color).withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
            child: Text(order['status'] as String, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: order['statusColor'] as Color))),
        ]),
        const SizedBox(height: 12),
        Row(children: [
          Container(width: 50, height: 50, decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(Icons.auto_stories, color: AppColors.primary, size: 24)),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(order['title'] as String, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 14, color: AppColors.textPrimary(context))),
            Text(order['author'] as String, style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
          ])),
          Text('₹${(order['price'] as double).toStringAsFixed(0)}', style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.primary)),
        ]),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(order['date'] as String, style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textHint(context))),
          Text('${order['items']} item(s)', style: GoogleFonts.poppins(fontSize: 11, color: AppColors.textSecondary(context))),
        ]),
        if (isActive) ...[const SizedBox(height: 12), SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, style: OutlinedButton.styleFrom(side: BorderSide(color: AppColors.primary), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 10)),
          child: Text('Track Order', style: GoogleFonts.poppins(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 13))))],
        if (!isActive && order['status'] == 'Delivered') ...[const SizedBox(height: 12), SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), padding: const EdgeInsets.symmetric(vertical: 10)),
          child: Text('Reorder', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 13))))],
      ]),
    );
  }
}
