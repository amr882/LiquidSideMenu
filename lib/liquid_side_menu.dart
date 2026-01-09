import 'package:flutter/material.dart';

class LiquidSideMenu extends StatefulWidget {
  final List<SideMenuItem> sideMenuItems;
  final Widget sideMenuIcon;
  final Widget child;

  const LiquidSideMenu({
    super.key,
    required this.sideMenuItems,
    required this.child,
    required this.sideMenuIcon,
  });

  @override
  State<LiquidSideMenu> createState() => _LiquidSideMenuState();
}

class _LiquidSideMenuState extends State<LiquidSideMenu> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    const double menuWidth = 300.0;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          RepaintBoundary(child: widget.child),
          AnimatedPositioned(
            curve: Curves.elasticOut,
            duration: const Duration(milliseconds: 2500),
            left: isMenuOpen ? -screenWidth * 0.2 : screenWidth * 0.1,
            top: screenHeight * 0.12,
            child: GestureDetector(
              onTap: () => setState(() => isMenuOpen = true),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(blurRadius: 1, color: Colors.black)],
                ),
                padding: const EdgeInsets.all(12),
                child: widget.sideMenuIcon,
              ),
            ),
          ),

          // Liquid Bubbles Layer
          RepaintBoundary(
            child: Stack(
              children: [
                // Top Left
                LiquidBubble(
                  isMenuOpen: isMenuOpen,
                  left: -screenWidth * 0.30,
                  top: -screenHeight * 0.30,
                  expandedSize: screenHeight * 0.9,
                ),
                // Top Right
                LiquidBubble(
                  isMenuOpen: isMenuOpen,
                  right: -screenWidth * 0.25,
                  top: screenHeight * 0.12,
                  expandedSize: screenWidth * 1.2,
                ),
                // Bottom Right
                LiquidBubble(
                  isMenuOpen: isMenuOpen,
                  right: -screenWidth * 0.12,
                  bottom: screenHeight * 0.12,
                  expandedSize: screenWidth * 1.2,
                ),
                // Bottom Left
                LiquidBubble(
                  isMenuOpen: isMenuOpen,
                  left: -screenWidth * 0.25,
                  bottom: -screenHeight * 0.12,
                  expandedSize: screenWidth * 1.5,
                  duration: const Duration(milliseconds: 1000),
                ),
              ],
            ),
          ),

          // Menu Items
          AnimatedPositioned(
            curve: Curves.elasticOut,
            duration: const Duration(milliseconds: 2500),
            left: isMenuOpen ? (screenWidth / 2) - (menuWidth / 2) : -menuWidth,
            child: SizedBox(
              width: menuWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.sideMenuItems,
              ),
            ),
          ),

          // Close Button
          AnimatedPositioned(
            curve: Curves.elasticOut,
            duration: const Duration(milliseconds: 2500),
            right: isMenuOpen ? screenWidth * 0.1 : -screenWidth * 0.2,
            top: screenHeight * 0.12,
            child: GestureDetector(
              onTap: () => setState(() => isMenuOpen = false),
              child: const Icon(Icons.close, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}

class LiquidBubble extends StatelessWidget {
  final bool isMenuOpen;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double expandedSize;
  final Duration duration;

  const LiquidBubble({
    super.key,
    required this.isMenuOpen,
    required this.expandedSize,
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.duration = const Duration(milliseconds: 700),
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: duration,
        height: isMenuOpen ? expandedSize : 0,
        width: isMenuOpen ? expandedSize : 0,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 15, color: Colors.black)],
        ),
      ),
    );
  }
}

class SideMenuItem extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const SideMenuItem({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
