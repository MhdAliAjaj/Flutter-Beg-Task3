import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;
  final EdgeInsetsGeometry padding;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  Alignment _alignmentForIndex(int index) {
    // Positions under 4 items split into left/right halves
    switch (index) {
      case 0:
        return const Alignment(-0.75, 1.0);
      case 1:
        return const Alignment(-0.25, 1.0);
      case 2:
        return const Alignment(0.25, 1.0);
      case 3:
        return const Alignment(0.75, 1.0);
      default:
        return const Alignment(-0.75, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color active = const Color(0xFF2979FF);
    final Color inactive = Colors.grey.shade500;

    return SafeArea(
      top: false,
      child: Padding(
        padding: padding,
        child: SizedBox(
          height: 76,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Base bar
              Container(
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1A000000),
                      blurRadius: 20,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavItem(
                            icon: Icons.home_rounded,
                            isActive: currentIndex == 0,
                            activeColor: active,
                            inactiveColor: inactive,
                            onTap: () => onItemSelected(0),
                          ),
                          _NavItem(
                            icon: Icons.search_rounded,
                            isActive: currentIndex == 1,
                            activeColor: active,
                            inactiveColor: inactive,
                            onTap: () => onItemSelected(1),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 64), // gap for center button
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _NavItem(
                            icon: Icons.favorite_border_rounded,
                            isActive: currentIndex == 2,
                            activeColor: active,
                            inactiveColor: inactive,
                            onTap: () => onItemSelected(2),
                          ),
                          _NavItem(
                            icon: Icons.person_outline_rounded,
                            isActive: currentIndex == 3,
                            activeColor: active,
                            inactiveColor: inactive,
                            onTap: () => onItemSelected(3),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Subtle base line
              Positioned(
                bottom: 10,
                left: 28,
                right: 28,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),

              // Active indicator
              Positioned.fill(
                child: AnimatedAlign(
                  alignment: _alignmentForIndex(currentIndex),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 4,
                    width: 56,
                    decoration: BoxDecoration(
                      color: active,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.inactiveColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 26,
          color: isActive ? activeColor : inactiveColor,
        ),
      ),
    );
  }
}
