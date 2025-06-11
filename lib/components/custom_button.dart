import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, tertiary }

class CustomButton extends StatelessWidget {
  final String text;
  final ButtonVariant variant;
  final bool showText;
  final bool showLeftIcon;
  final bool showRightIcon;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onPressed;
  final double? width;
  final double height;

  const CustomButton({
    super.key,
    this.text = 'Button',
    this.variant = ButtonVariant.primary,
    this.showText = true,
    this.showLeftIcon = false,
    this.showRightIcon = false,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.width,
    this.height = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _getButtonStyle(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showLeftIcon && leftIcon != null) ...[
              Icon(leftIcon, size: 16, color: _getContentColor()),
              if (showText) const SizedBox(width: 8),
            ],
            if (showText)
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: _getContentColor(),
                  height: 1.0,
                ),
              ),
            if (showRightIcon && rightIcon != null) ...[
              if (showText) const SizedBox(width: 8),
              Icon(rightIcon, size: 16, color: _getContentColor()),
            ],
          ],
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (variant) {
      case ButtonVariant.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF006FFD), // Highlight/Darkest
          foregroundColor: const Color(0xFFFFFFFF), // Neutral/Light/Lightest
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
      case ButtonVariant.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF006FFD), // Highlight/Darkest
          elevation: 0,
          shadowColor: Colors.transparent,
          side: const BorderSide(
            color: Color(0xFF006FFD), // Highlight/Darkest
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
      case ButtonVariant.tertiary:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF006FFD), // Highlight/Darkest
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        );
    }
  }

  Color _getContentColor() {
    switch (variant) {
      case ButtonVariant.primary:
        return const Color(0xFFFFFFFF); // Neutral/Light/Lightest
      case ButtonVariant.secondary:
      case ButtonVariant.tertiary:
        return const Color(0xFF006FFD); // Highlight/Darkest
    }
  }
}

// Helper extension for easy button creation
extension ButtonExtensions on CustomButton {
  static CustomButton primary({
    required String text,
    VoidCallback? onPressed,
    bool showLeftIcon = false,
    bool showRightIcon = false,
    IconData? leftIcon,
    IconData? rightIcon,
    double? width,
  }) {
    return CustomButton(
      text: text,
      variant: ButtonVariant.primary,
      onPressed: onPressed,
      showLeftIcon: showLeftIcon,
      showRightIcon: showRightIcon,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      width: width,
    );
  }

  static CustomButton secondary({
    required String text,
    VoidCallback? onPressed,
    bool showLeftIcon = false,
    bool showRightIcon = false,
    IconData? leftIcon,
    IconData? rightIcon,
    double? width,
  }) {
    return CustomButton(
      text: text,
      variant: ButtonVariant.secondary,
      onPressed: onPressed,
      showLeftIcon: showLeftIcon,
      showRightIcon: showRightIcon,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      width: width,
    );
  }

  static CustomButton tertiary({
    required String text,
    VoidCallback? onPressed,
    bool showLeftIcon = false,
    bool showRightIcon = false,
    IconData? leftIcon,
    IconData? rightIcon,
    double? width,
  }) {
    return CustomButton(
      text: text,
      variant: ButtonVariant.tertiary,
      onPressed: onPressed,
      showLeftIcon: showLeftIcon,
      showRightIcon: showRightIcon,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      width: width,
    );
  }
}
