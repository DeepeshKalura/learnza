import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class NoBooksFoundErrorWidget extends StatefulWidget {
  const NoBooksFoundErrorWidget({super.key});

  @override
  State<NoBooksFoundErrorWidget> createState() =>
      _NoBooksFoundErrorWidgetState();
}

class _NoBooksFoundErrorWidgetState extends State<NoBooksFoundErrorWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bookRotation;
  late Animation<double> _searchScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _bookRotation = Tween<double>(
      begin: -0.1,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _searchScale = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Animated search icon
              ScaleTransition(
                scale: _searchScale,
                child: const Icon(
                  LucideIcons.search,
                  size: 150,
                ),
              ),
              // Animated book icon
              RotationTransition(
                turns: _bookRotation,
                child: const Icon(
                  LucideIcons.bookX,
                  size: 64,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            '404',
            style: theme.textTheme.h3,
          ),
          const SizedBox(height: 16),
          Text(
            'No books found in the library',
            style: theme.textTheme.large,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or filters',
            style: theme.textTheme.lead,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
