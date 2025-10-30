import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'bank_card.dart';

class BankCardCarousel extends StatefulWidget {
  const BankCardCarousel({
    super.key,
    required this.cards,
    this.initialPage = 0,
    this.viewportFraction = 0.9,
    this.height = 220,
    this.onPageChanged,
    this.showIndicator = true,
    this.indicatorActiveColor = Colors.white,
    this.indicatorInactiveColor = const Color(0x66FFFFFF),
    this.indicatorSize = 8,
    this.indicatorSpacing = 6,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
  });


  final List<BankCard> cards;
  final int initialPage;
  final double viewportFraction;
  final double height;
  final ValueChanged<int>? onPageChanged;
  final bool showIndicator;
  final Color indicatorActiveColor;
  final Color indicatorInactiveColor;
  final double indicatorSize;
  final double indicatorSpacing;
  final EdgeInsetsGeometry padding;

  @override
  State<BankCardCarousel> createState() => _BankCardCarouselState();
}

class _BankCardCarouselState extends State<BankCardCarousel> {
  late final PageController _controller;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget.initialPage.clamp(
        0,
        math.max(0, widget.cards.length - 1),
      ),
      viewportFraction: widget.viewportFraction,
    );
    _page = _controller.initialPage.toDouble();
    _controller.addListener(_handleScroll);
  }

  void _handleScroll() {
    setState(() {
      _page = _controller.page ?? _controller.initialPage.toDouble();
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.cards.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: widget.padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: widget.height,
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.cards.length,
              onPageChanged: widget.onPageChanged,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final distance = (index - _page).abs();
                final clamped = distance.clamp(0.0, 1.0);
                final scale = lerpDouble(0.92, 1.0, 1.0 - clamped);
                final opacity = lerpDouble(0.75, 1.0, 1.0 - clamped);

                return Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    transformAlignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..scaleByDouble(scale, scale, 1.0, 1.0),
                    child: Opacity(
                      opacity: opacity,
                      child: _sizedCard(widget.cards[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          if (widget.showIndicator) ...[
            const SizedBox(height: 12),
            _DotsIndicator(
              count: widget.cards.length,
              index: _page.round().clamp(0, widget.cards.length - 1),
              activeColor: widget.indicatorActiveColor,
              inactiveColor: widget.indicatorInactiveColor,
              size: widget.indicatorSize,
              spacing: widget.indicatorSpacing,
            ),
          ],
        ],
      ),
    );
  }

  
  Widget _sizedCard(BankCard card) {
    
    
    return SizedBox(height: widget.height, child: card);
  }
}

class _DotsIndicator extends StatelessWidget {
  const _DotsIndicator({
    required this.count,
    required this.index,
    required this.activeColor,
    required this.inactiveColor,
    required this.size,
    required this.spacing,
  });

  final int count;
  final int index;
  final Color activeColor;
  final Color inactiveColor;
  final double size;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: spacing / 2),
          width: isActive ? size * 2 : size,
          height: size,
          decoration: BoxDecoration(
            color: isActive ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(size),
          ),
        );
      }),
    );
  }
}


double lerpDouble(double a, double b, double t) => a + (b - a) * t;
