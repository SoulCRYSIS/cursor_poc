import 'package:flutter/material.dart';

enum RadioButtonSize { small, medium, large }

class CustomRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final RadioButtonSize size;
  final bool selected;

  const CustomRadioButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.size = RadioButtonSize.medium,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected =
        selected || (groupValue != null && value == groupValue);

    return GestureDetector(
      onTap: onChanged != null ? () => onChanged!(value) : null,
      child: Container(
        width: _getSize(),
        height: _getSize(),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isSelected
                    ? const Color(0xFF006FFD) // Highlight/Darkest
                    : const Color(0xFF8F9098), // Neutral/Dark/Lightest
            width: isSelected ? 2.0 : 1.5,
          ),
          color:
              isSelected
                  ? const Color(0xFF006FFD) // Highlight/Darkest
                  : Colors.transparent,
        ),
        child:
            isSelected
                ? Center(
                  child: Container(
                    width: _getInnerSize(),
                    height: _getInnerSize(),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFFFFF), // Neutral/Light/Lightest
                    ),
                  ),
                )
                : null,
      ),
    );
  }

  double _getSize() {
    switch (size) {
      case RadioButtonSize.small:
        return 20.0;
      case RadioButtonSize.medium:
        return 24.0;
      case RadioButtonSize.large:
        return 32.0;
    }
  }

  double _getInnerSize() {
    switch (size) {
      case RadioButtonSize.small:
        return 8.0;
      case RadioButtonSize.medium:
        return 10.0;
      case RadioButtonSize.large:
        return 12.0;
    }
  }
}

// Radio Button Group for easier management
class CustomRadioButtonGroup<T> extends StatelessWidget {
  final List<RadioButtonOption<T>> options;
  final T? value;
  final ValueChanged<T?>? onChanged;
  final RadioButtonSize size;
  final Axis direction;
  final double spacing;

  const CustomRadioButtonGroup({
    super.key,
    required this.options,
    this.value,
    this.onChanged,
    this.size = RadioButtonSize.medium,
    this.direction = Axis.vertical,
    this.spacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    if (direction == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _buildRadioButtons(),
      );
    } else {
      return Row(children: _buildRadioButtons());
    }
  }

  List<Widget> _buildRadioButtons() {
    List<Widget> buttons = [];

    for (int i = 0; i < options.length; i++) {
      final option = options[i];

      buttons.add(
        GestureDetector(
          onTap: onChanged != null ? () => onChanged!(option.value) : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomRadioButton<T>(
                value: option.value,
                groupValue: value,
                onChanged: onChanged,
                size: size,
              ),
              if (option.label != null) ...[
                const SizedBox(width: 8),
                Text(
                  option.label!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1F2024), // Neutral/Dark/Darkest
                    height: 1.43,
                  ),
                ),
              ],
            ],
          ),
        ),
      );

      if (i < options.length - 1) {
        if (direction == Axis.vertical) {
          buttons.add(SizedBox(height: spacing));
        } else {
          buttons.add(SizedBox(width: spacing));
        }
      }
    }

    return buttons;
  }
}

// Option class for radio button groups
class RadioButtonOption<T> {
  final T value;
  final String? label;

  const RadioButtonOption({required this.value, this.label});
}

// Helper extension for easy radio button creation
extension RadioButtonExtensions on CustomRadioButton {
  static CustomRadioButton<String> simple({
    required String value,
    String? groupValue,
    ValueChanged<String?>? onChanged,
    RadioButtonSize size = RadioButtonSize.medium,
  }) {
    return CustomRadioButton<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      size: size,
    );
  }

  static CustomRadioButton<int> numeric({
    required int value,
    int? groupValue,
    ValueChanged<int?>? onChanged,
    RadioButtonSize size = RadioButtonSize.medium,
  }) {
    return CustomRadioButton<int>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      size: size,
    );
  }
}
