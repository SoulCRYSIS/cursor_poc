import 'package:flutter/material.dart';

enum ToastStyle { informative, success, warning, error }

class Toast extends StatelessWidget {
  final String? title;
  final String? description;
  final ToastStyle style;
  final bool showTitle;
  final bool showDescription;
  final VoidCallback? onClose;

  const Toast({
    super.key,
    this.title,
    this.description,
    this.style = ToastStyle.informative,
    this.showTitle = true,
    this.showDescription = true,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          // Left Icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: _getIconColor(),
              shape: BoxShape.circle,
            ),
            child: Icon(_getIcon(), color: Colors.white, size: 12),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showTitle && title != null) ...[
                  Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2024), // Neutral/Dark/Darkest
                      height: 1.0,
                    ),
                  ),
                  if (showDescription && description != null)
                    const SizedBox(height: 4),
                ],
                if (showDescription && description != null)
                  Text(
                    description!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF494A50), // Neutral/Dark/Medium
                      height: 1.33,
                      letterSpacing: 0.12,
                    ),
                  ),
              ],
            ),
          ),
          // Close button
          if (onClose != null) ...[
            const SizedBox(width: 16),
            GestureDetector(
              onTap: onClose,
              child: const Icon(
                Icons.close,
                color: Color(0xFF71727A), // Neutral/Dark/Light
                size: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (style) {
      case ToastStyle.informative:
        return const Color(0xFFEAF2FF); // Highlight/Lightest
      case ToastStyle.success:
        return const Color(0xFFE7F4E8); // Support/Success/Light
      case ToastStyle.warning:
        return const Color(0xFFFFF4E4); // Support/Warning/Light
      case ToastStyle.error:
        return const Color(0xFFFFE2E5); // Support/Error/Light
    }
  }

  Color _getIconColor() {
    switch (style) {
      case ToastStyle.informative:
        return const Color(0xFF006FFD); // Highlight/Darkest
      case ToastStyle.success:
        return const Color(0xFF3AC0A0); // Support/Success/Medium
      case ToastStyle.warning:
        return const Color(0xFFFFB37C); // Support/Warning/Medium
      case ToastStyle.error:
        return const Color(0xFFFF616D); // Support/Error/Medium
    }
  }

  IconData _getIcon() {
    switch (style) {
      case ToastStyle.informative:
        return Icons.info;
      case ToastStyle.success:
        return Icons.check;
      case ToastStyle.warning:
        return Icons.warning;
      case ToastStyle.error:
        return Icons.error;
    }
  }
}

// Helper class to show toast with auto-dismiss functionality
class ToastHelper {
  static void show({
    required BuildContext context,
    String? title,
    String? description,
    ToastStyle style = ToastStyle.informative,
    bool showTitle = true,
    bool showDescription = true,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: MediaQuery.of(context).padding.top + 50,
            left: 16,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: Toast(
                title: title,
                description: description,
                style: style,
                showTitle: showTitle,
                showDescription: showDescription,
                onClose: () => overlayEntry.remove(),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    // Auto dismiss after duration
    Future.delayed(duration, () {
      try {
        overlayEntry.remove();
      } catch (e) {
        // Entry already removed
      }
    });
  }
}
