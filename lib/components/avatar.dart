import 'package:flutter/material.dart';

enum AvatarSize { small, medium, large }

class Avatar extends StatelessWidget {
  final AvatarSize size;
  final String? imageUrl;
  final String? initials;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const Avatar({
    super.key,
    this.size = AvatarSize.medium,
    this.imageUrl,
    this.initials,
    this.backgroundColor,
    this.foregroundColor,
  });

  double get _getSize {
    switch (size) {
      case AvatarSize.small:
        return 32.0;
      case AvatarSize.medium:
        return 48.0;
      case AvatarSize.large:
        return 64.0;
    }
  }

  double get _getIconSize {
    switch (size) {
      case AvatarSize.small:
        return 16.0;
      case AvatarSize.medium:
        return 24.0;
      case AvatarSize.large:
        return 32.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getSize,
      height: _getSize,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFB4DBFF),
        shape: BoxShape.circle,
      ),
      child: _buildAvatarContent(),
    );
  }

  Widget _buildAvatarContent() {
    if (imageUrl != null) {
      return ClipOval(
        child: Image.network(
          imageUrl!,
          width: _getSize,
          height: _getSize,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildDefaultIcon();
          },
        ),
      );
    } else if (initials != null) {
      return Center(
        child: Text(
          initials!,
          style: TextStyle(
            color: foregroundColor ?? const Color(0xFF1F2024),
            fontSize: _getSize * 0.4,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    } else {
      return _buildDefaultIcon();
    }
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Icon(
        Icons.person,
        size: _getIconSize,
        color: foregroundColor ?? const Color(0xFF1F2024),
      ),
    );
  }
}
