import 'package:flutter/material.dart';

class FloatingBottomNavItem {
  final IconData icon;
  final String? tooltip;
  const FloatingBottomNavItem({required this.icon, this.tooltip});
}

class FloatingBottomNav extends StatelessWidget {
  const FloatingBottomNav({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor = Colors.black,
    this.activeColor = Colors.white,
    this.inactiveColor = const Color(0xCCFFFFFF),
    this.margin = const EdgeInsets.fromLTRB(16, 8, 16, 16),
    this.height = 64,
    this.borderRadius = 32,
    this.elevation = 10,
    this.widthFactor = 0.82,
  }) : assert(items.length >= 2, 'Provide at least two items');

  final List<FloatingBottomNavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final EdgeInsets margin;
  final double height;
  final double borderRadius;
  final double elevation;

  
  final double widthFactor;

  
  
  
  
  
  static double reservedHeight(
    BuildContext context, {
    double height = 64,
    EdgeInsets margin = const EdgeInsets.fromLTRB(16, 8, 16, 16),
  }) {
    final viewPaddingBottom = MediaQuery.viewPaddingOf(context).bottom;
    final bottomGap = viewPaddingBottom > margin.bottom
        ? viewPaddingBottom
        : margin.bottom;
    return margin.top + height + bottomGap;
  }

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(borderRadius),
    );

    return SafeArea(
      top: false,
      minimum: EdgeInsets.only(bottom: margin.bottom),
      child: Padding(
        padding: EdgeInsets.only(
          left: margin.left,
          right: margin.right,
          top: margin.top,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.sizeOf(context).width;
            final clampedFactor = widthFactor.clamp(0.2, 1.0);
            final navWidth = screenWidth * clampedFactor;
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: navWidth,
                child: Material(
                  color: backgroundColor,
                  elevation: elevation,
                  shape: shape,
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(items.length, (index) {
                        final item = items[index];
                        final selected = index == currentIndex;
                        final color = selected ? activeColor : inactiveColor;
                        return _NavButton(
                          icon: item.icon,
                          tooltip: item.tooltip,
                          color: color,
                          selected: selected,
                          onTap: () => onTap(index),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.icon,
    required this.color,
    required this.onTap,
    required this.selected,
    this.tooltip,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;
  final bool selected;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final iconWidget = selected
        ? Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, size: 20),
          )
        : Icon(icon);

    return Semantics(
      selected: selected,
      button: true,
      child: IconButton(
        icon: iconWidget,
        color: color,
        tooltip: tooltip,
        onPressed: onTap,
        visualDensity: VisualDensity.compact,
        splashRadius: 28,
        iconSize: 28,
      ),
    );
  }
}



class BottomNavSliverSpacer extends StatelessWidget {
  const BottomNavSliverSpacer({
    super.key,
    this.height,
    this.margin,
  });

  
  final double? height;

  
  
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final h = FloatingBottomNav.reservedHeight(
      context,
      height: height ?? 64,
      margin: margin ?? const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
    return SliverToBoxAdapter(child: SizedBox(height: h));
  }
}


class BottomNavListFooter extends StatelessWidget {
  const BottomNavListFooter({
    super.key,
    this.height,
    this.margin,
  });

  final double? height;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final h = FloatingBottomNav.reservedHeight(
      context,
      height: height ?? 64,
      margin: margin ?? const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
    return SizedBox(height: h);
  }
}
