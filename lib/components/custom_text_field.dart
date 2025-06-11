import 'package:flutter/material.dart';

enum TextFieldState { normal, focused, error, disabled }

class CustomTextField extends StatefulWidget {
  final String? title;
  final String? placeholder;
  final String? supportText;
  final String? unit;
  final String? initialValue;
  final bool showTitle;
  final bool showPlaceholder;
  final bool showSupportText;
  final bool showIcon;
  final bool showUnit;
  final IconData? icon;
  final TextFieldState state;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType? keyboardType;
  final int maxLines;

  const CustomTextField({
    super.key,
    this.title,
    this.placeholder,
    this.supportText,
    this.unit,
    this.initialValue,
    this.showTitle = true,
    this.showPlaceholder = true,
    this.showSupportText = false,
    this.showIcon = false,
    this.showUnit = false,
    this.icon,
    this.state = TextFieldState.normal,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle && widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2F3036), // Neutral/Dark/Dark
              height: 1.0,
            ),
          ),
          const SizedBox(height: 8),
        ],
        Container(
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getBorderColor(),
              width: _getBorderWidth(),
            ),
          ),
          child: Row(
            children: [
              if (widget.showUnit && widget.unit != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    widget.unit!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8F9098), // Neutral/Dark/Lightest
                      height: 1.28,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.state != TextFieldState.disabled,
                  readOnly: widget.readOnly,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  keyboardType: widget.keyboardType,
                  maxLines: widget.maxLines,
                  style: TextStyle(
                    fontSize: 14,
                    color:
                        widget.state == TextFieldState.disabled
                            ? const Color(0xFF8F9098)
                            : const Color(0xFF1F2024), // Neutral/Dark/Darkest
                    height: 1.43,
                  ),
                  decoration: InputDecoration(
                    hintText:
                        widget.showPlaceholder ? widget.placeholder : null,
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF8F9098), // Neutral/Dark/Lightest
                      height: 1.43,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      left: widget.showUnit ? 0 : 16,
                      right: widget.showIcon ? 8 : 16,
                      top: 12,
                      bottom: 12,
                    ),
                  ),
                ),
              ),
              if (widget.showIcon && widget.icon != null) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    widget.icon,
                    size: 16,
                    color: const Color(0xFF8F9098), // Neutral/Dark/Lightest
                  ),
                ),
              ],
            ],
          ),
        ),
        if (widget.showSupportText && widget.supportText != null) ...[
          const SizedBox(height: 8),
          Text(
            widget.supportText!,
            style: TextStyle(
              fontSize: 10,
              color:
                  widget.state == TextFieldState.error
                      ? const Color(0xFFFF616D) // Support/Error/Medium
                      : const Color(0xFF8F9098), // Neutral/Dark/Lightest
              height: 1.4,
              letterSpacing: 0.15,
            ),
          ),
        ],
      ],
    );
  }

  Color _getBorderColor() {
    if (widget.state == TextFieldState.disabled) {
      return const Color(0xFFC5C6CC); // Lighter border for disabled
    }
    if (widget.state == TextFieldState.error) {
      return const Color(0xFFFF616D); // Support/Error/Medium
    }
    if (_isFocused || widget.state == TextFieldState.focused) {
      return const Color(0xFF006FFD); // Highlight/Darkest
    }
    return const Color(0xFFC5C6CC); // Default border color
  }

  double _getBorderWidth() {
    if (_isFocused ||
        widget.state == TextFieldState.focused ||
        widget.state == TextFieldState.error) {
      return 1.5;
    }
    return 1.0;
  }
}

// Helper extension for easy text field creation
extension TextFieldExtensions on CustomTextField {
  static CustomTextField basic({
    String? title,
    String? placeholder,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return CustomTextField(
      title: title,
      placeholder: placeholder,
      controller: controller,
      onChanged: onChanged,
    );
  }

  static CustomTextField withIcon({
    String? title,
    String? placeholder,
    IconData? icon,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return CustomTextField(
      title: title,
      placeholder: placeholder,
      showIcon: true,
      icon: icon,
      controller: controller,
      onChanged: onChanged,
    );
  }

  static CustomTextField withUnit({
    String? title,
    String? placeholder,
    String? unit,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return CustomTextField(
      title: title,
      placeholder: placeholder,
      showUnit: true,
      unit: unit,
      controller: controller,
      onChanged: onChanged,
    );
  }

  static CustomTextField withSupport({
    String? title,
    String? placeholder,
    String? supportText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return CustomTextField(
      title: title,
      placeholder: placeholder,
      showSupportText: true,
      supportText: supportText,
      controller: controller,
      onChanged: onChanged,
    );
  }

  static CustomTextField error({
    String? title,
    String? placeholder,
    String? supportText,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) {
    return CustomTextField(
      title: title,
      placeholder: placeholder,
      showSupportText: true,
      supportText: supportText,
      state: TextFieldState.error,
      controller: controller,
      onChanged: onChanged,
    );
  }
}
