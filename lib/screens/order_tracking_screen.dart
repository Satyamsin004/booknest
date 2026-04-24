import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../models/book.dart';
import 'delivery_success_screen.dart';

class OrderTrackingScreen extends StatefulWidget {
  final Book book;
  final double total;
  const OrderTrackingScreen({super.key, required this.book, required this.total});
  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> with SingleTickerProviderStateMixin {
  late AnimationController _bikeController;
  late Animation<double> _bikeAnimation;
  int _selectedTip = -1;
  final List<double> _tipAmounts = [20.0, 50.0, 80.0, 100.0];
  // Active step (0-3): Confirmed, Picking Items, Out for delivery, Delivered
  int _activeStep = 0;
  Timer? _stepTimer;
  bool _isDelivered = false;

  @override
  void initState() {
    super.initState();
    _bikeController = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _bikeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _bikeController, curve: Curves.easeInOut));
    _bikeController.repeat(reverse: true);

    // Auto-advance delivery steps
    _startDeliverySimulation();
  }

  void _startDeliverySimulation() {
    _stepTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_activeStep < 3) {
        setState(() {
          _activeStep++;
        });
        if (_activeStep == 3) {
          timer.cancel();
          _bikeController.stop();
          setState(() {
            _isDelivered = true;
          });
          // Navigate to success screen after a short delay
          Future.delayed(const Duration(seconds: 2), () {
            if (mounted) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const DeliverySuccessScreen()),
              );
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _stepTimer?.cancel();
    _bikeController.dispose();
    super.dispose();
  }

  String _getStatusText() {
    switch (_activeStep) {
      case 0:
        return 'Order Confirmed';
      case 1:
        return 'Picking Items';
      case 2:
        return 'Out for delivery';
      case 3:
        return 'Delivered!';
      default:
        return 'Processing';
    }
  }

  String _getSubtitleText() {
    switch (_activeStep) {
      case 0:
        return 'Preparing your order';
      case 1:
        return 'Selecting your books';
      case 2:
        return 'Arriving at 11:45';
      case 3:
        return 'Your order has arrived!';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Map placeholder
              _buildMapSection(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Delivery status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                transitionBuilder: (child, animation) => FadeTransition(
                                  opacity: animation,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(0, 0.3),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: child,
                                  ),
                                ),
                                child: Text(
                                  _getStatusText(),
                                  key: ValueKey<int>(_activeStep),
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: _isDelivered ? const Color(0xFF34C759) : AppColors.textPrimary(context),
                                  ),
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  _getSubtitleText(),
                                  key: ValueKey<String>(_getSubtitleText()),
                                  style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('1869',
                              style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textPrimary(context))),
                            Text('Your code',
                              style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Progress steps
                    _buildProgressSteps(),
                    const SizedBox(height: 24),

                    // Delivered banner
                    if (_isDelivered)
                      AnimatedOpacity(
                        opacity: _isDelivered ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 600),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF34C759), Color(0xFF30D158)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(AppRadius.large),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF34C759).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 48, height: 48,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.check_circle, color: Colors.white, size: 28),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Order Delivered!',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
                                    Text('Enjoy your books 📚',
                                      style: GoogleFonts.poppins(fontSize: 13, color: Colors.white70)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    // Delivery person
                    _buildDeliveryPerson(),
                    const SizedBox(height: 24),
                    const Divider(),
                    const SizedBox(height: 16),
                    // Tip section
                    Text('Tip your shopper',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary(context))),
                    const SizedBox(height: 4),
                    Text('Everyone deserve a little kindness',
                      style: GoogleFonts.poppins(fontSize: 13, color: AppColors.textSecondary(context))),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    // Tip amounts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_tipAmounts.length, (i) => _buildTipChip(i)),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMapSection() {
    return Container(
      height: 280,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0F0),
      ),
      child: Stack(
        children: [
          // Simulated map background
          CustomPaint(
            size: const Size(double.infinity, 280),
            painter: _MapPainter(),
          ),
          // Route line
          Positioned.fill(
            child: CustomPaint(painter: _RoutePainter()),
          ),
          // Origin pin
          Positioned(
            top: 100, left: 100,
            child: _buildMapPin(AppColors.primary),
          ),
          // Destination pin
          Positioned(
            top: 80, right: 80,
            child: _isDelivered
              ? const Icon(Icons.check_circle, color: Color(0xFF34C759), size: 32)
              : Icon(Icons.location_on, color: AppColors.primary, size: 32),
          ),
          // Delivery vehicle animated
          if (!_isDelivered)
            AnimatedBuilder(
              animation: _bikeAnimation,
              builder: (context, child) {
                // Path matches _RoutePainter
                final path = Path();
                path.moveTo(116, 108);
                path.quadraticBezierTo(150, 90, 190, 118);
                path.quadraticBezierTo(230, 140, MediaQuery.of(context).size.width - 90, 88);
                
                final metrics = path.computeMetrics().toList();
                if (metrics.isEmpty) return const SizedBox();
                
                final metric = metrics.first;
                final distance = _bikeAnimation.value * metric.length;
                final tangent = metric.getTangentForOffset(distance);
                
                if (tangent == null) return const SizedBox();
                
                return Positioned(
                  left: tangent.position.dx - 16,
                  top: tangent.position.dy - 16,
                  child: child!,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.softShadow,
                ),
                child: const Icon(Icons.delivery_dining, color: AppColors.primary, size: 20),
              ),
            ),
          // Delivered checkmark on map
          if (_isDelivered)
            Positioned(
              top: 80, right: 70,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.softShadow,
                ),
                child: const Icon(Icons.check, color: Color(0xFF34C759), size: 24),
              ),
            ),
          // Street labels
          Positioned(
            top: 40, left: 20,
            child: Text('West Side', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey.shade600)),
          ),
          Positioned(
            top: 60, left: 10,
            child: Text('Kristel St', style: GoogleFonts.poppins(fontSize: 9, color: Colors.grey.shade500)),
          ),
          Positioned(
            top: 40, right: 30,
            child: Text('Oakland', style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey.shade600)),
          ),
          Positioned(
            bottom: 60, left: 20,
            child: Text('Chicona St', style: GoogleFonts.poppins(fontSize: 9, color: Colors.grey.shade500)),
          ),
          Positioned(
            bottom: 40, right: 40,
            child: Text('Museum', style: GoogleFonts.poppins(fontSize: 9, color: Colors.grey.shade500)),
          ),
          Positioned(
            bottom: 60, left: 140,
            child: Text('Coffee Shop', style: GoogleFonts.poppins(fontSize: 9, color: Colors.grey.shade500)),
          ),
        ],
      ),
    );
  }

  Widget _buildMapPin(Color color) {
    return Container(
      width: 16, height: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 8)],
      ),
    );
  }

  Widget _buildProgressSteps() {
    final steps = [
      {'icon': Icons.check_circle, 'label': 'Confirmed'},
      {'icon': Icons.inventory_2, 'label': 'Picking Items'},
      {'icon': Icons.local_shipping, 'label': 'Out for delivery'},
      {'icon': Icons.home, 'label': 'Delivered'},
    ];

    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final stepIndex = i ~/ 2;
          return Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 3,
              color: stepIndex < _activeStep ? AppColors.primary
                : stepIndex < 3 && _activeStep == 3 ? const Color(0xFF34C759)
                : AppColors.divider(context),
            ),
          );
        }
        final stepIndex = i ~/ 2;
        final isActive = stepIndex <= _activeStep;
        final isDeliveredStep = stepIndex == 3 && _activeStep == 3;
        return Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: isDeliveredStep ? const Color(0xFF34C759)
                  : isActive ? AppColors.primary : AppColors.divider(context),
                shape: BoxShape.circle,
              ),
              child: Icon(steps[stepIndex]['icon'] as IconData,
                color: isActive ? Colors.white : AppColors.textHint(context), size: 18),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 70,
              child: Text(steps[stepIndex]['label'] as String,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 9,
                  color: isDeliveredStep ? const Color(0xFF34C759)
                    : isActive ? AppColors.primary : AppColors.textSecondary(context),
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400)),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildDeliveryPerson() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBg(context),
        borderRadius: BorderRadius.circular(AppRadius.large),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColors.primary.withOpacity(0.1),
            child: Text('S', style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primary)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Satyam', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 15, color: AppColors.textPrimary(context))),
                Row(
                  children: [
                    Text(
                      _isDelivered ? 'Delivered  ' : 'Coming to you  ',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: _isDelivered ? const Color(0xFF34C759) : AppColors.textSecondary(context),
                        fontWeight: _isDelivered ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                    const Icon(Icons.star, color: AppColors.star, size: 14),
                    Text(' 4.8', style: GoogleFonts.poppins(fontSize: 12, color: AppColors.textSecondary(context))),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.divider(context),
            ),
            child: Icon(Icons.phone, size: 18, color: AppColors.textPrimary(context)),
          ),
          const SizedBox(width: 8),
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle, color: AppColors.divider(context),
            ),
            child: Icon(Icons.chat_bubble_outline, size: 18, color: AppColors.textPrimary(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildTipChip(int index) {
    final isSelected = _selectedTip == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTip = isSelected ? -1 : index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.cardBg(context),
          borderRadius: BorderRadius.circular(AppRadius.round),
          border: Border.all(color: isSelected ? AppColors.primary : AppColors.divider(context), width: 1.5),
        ),
        child: Text('₹ ${_tipAmounts[index].toStringAsFixed(2)}',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : AppColors.textPrimary(context))),
      ),
    );
  }
}

// Custom painters for the map
class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8E8E8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    // Grid lines for streets
    for (double y = 0; y < size.height; y += 40) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
    for (double x = 0; x < size.width; x += 50) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    // Thicker roads
    final roadPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;
    canvas.drawLine(Offset(0, size.height * 0.4), Offset(size.width, size.height * 0.4), roadPaint);
    canvas.drawLine(Offset(size.width * 0.3, 0), Offset(size.width * 0.3, size.height), roadPaint);
    canvas.drawLine(Offset(size.width * 0.7, 0), Offset(size.width * 0.7, size.height), roadPaint);
    canvas.drawLine(Offset(0, size.height * 0.7), Offset(size.width, size.height * 0.7), roadPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    // Dashed route line
    final path = Path();
    path.moveTo(116, 108);
    path.quadraticBezierTo(150, 90, 190, 118);
    path.quadraticBezierTo(230, 140, size.width - 90, 88);

    const dashLength = 8.0;
    const gapLength = 5.0;
    final pathMetrics = path.computeMetrics();
    for (final metric in pathMetrics) {
      double distance = 0;
      while (distance < metric.length) {
        final end = (distance + dashLength).clamp(0.0, metric.length);
        final extracted = metric.extractPath(distance, end);
        canvas.drawPath(extracted, paint);
        distance += dashLength + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
