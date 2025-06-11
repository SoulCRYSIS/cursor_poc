import 'package:flutter/material.dart';
import '../components/avatar.dart';
import '../components/toast.dart';
import '../components/custom_button.dart';
import '../components/custom_text_field.dart';
import '../components/custom_radio_button.dart';

class ExampleComponentsScreen extends StatefulWidget {
  const ExampleComponentsScreen({super.key});

  @override
  State<ExampleComponentsScreen> createState() =>
      _ExampleComponentsScreenState();
}

class _ExampleComponentsScreenState extends State<ExampleComponentsScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Avatar Component',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Different sizes:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Avatar(size: AvatarSize.small),
                    SizedBox(width: 16),
                    Avatar(size: AvatarSize.medium),
                    SizedBox(width: 16),
                    Avatar(size: AvatarSize.large),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('With initials:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                const Avatar(size: AvatarSize.medium, initials: 'JD'),
                const SizedBox(height: 40),
              ],
            ),

            // Toast Component
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Toast Component',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Different variants:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                Toast(
                  title: 'Title',
                  description: 'Description. Lorem ipsum dolor sit amet.',
                  style: ToastStyle.informative,
                  onClose:
                      () => ToastHelper.show(
                        context: context,
                        title: 'Informative Toast',
                        description: 'This is an informative toast message.',
                        style: ToastStyle.informative,
                      ),
                ),
                const SizedBox(height: 12),
                Toast(
                  title: 'Title',
                  description: 'Description. Lorem ipsum dolor sit amet.',
                  style: ToastStyle.success,
                  onClose:
                      () => ToastHelper.show(
                        context: context,
                        title: 'Success Toast',
                        description: 'This is a success toast message.',
                        style: ToastStyle.success,
                      ),
                ),
                const SizedBox(height: 12),
                Toast(
                  title: 'Title',
                  description: 'Description. Lorem ipsum dolor sit amet.',
                  style: ToastStyle.warning,
                  onClose:
                      () => ToastHelper.show(
                        context: context,
                        title: 'Warning Toast',
                        description: 'This is a warning toast message.',
                        style: ToastStyle.warning,
                      ),
                ),
                const SizedBox(height: 12),
                Toast(
                  title: 'Title',
                  description: 'Description. Lorem ipsum dolor sit amet.',
                  style: ToastStyle.error,
                  onClose:
                      () => ToastHelper.show(
                        context: context,
                        title: 'Error Toast',
                        description: 'This is an error toast message.',
                        style: ToastStyle.error,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Button Component
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Button Component',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Different variants:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Primary Buttons
                    Row(
                      children: [
                        CustomButton(
                          text: 'Button',
                          variant: ButtonVariant.primary,
                          onPressed: () => debugPrint('Primary button pressed'),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Primary',
                          style: TextStyle(color: Color(0xFF8F9098)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Secondary Buttons
                    Row(
                      children: [
                        CustomButton(
                          text: 'Button',
                          variant: ButtonVariant.secondary,
                          onPressed:
                              () => debugPrint('Secondary button pressed'),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Secondary',
                          style: TextStyle(color: Color(0xFF8F9098)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Tertiary Buttons
                    Row(
                      children: [
                        CustomButton(
                          text: 'Button',
                          variant: ButtonVariant.tertiary,
                          onPressed:
                              () => debugPrint('Tertiary button pressed'),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Tertiary',
                          style: TextStyle(color: Color(0xFF8F9098)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Buttons with Icons
                    const Text('With Icons:', style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 12),

                    Row(
                      children: [
                        CustomButton(
                          text: 'Button',
                          variant: ButtonVariant.primary,
                          showLeftIcon: true,
                          leftIcon: Icons.add,
                          onPressed:
                              () => debugPrint('Button with left icon pressed'),
                        ),
                        const SizedBox(width: 12),
                        CustomButton(
                          text: 'Button',
                          variant: ButtonVariant.primary,
                          showRightIcon: true,
                          rightIcon: Icons.arrow_forward,
                          onPressed:
                              () =>
                                  debugPrint('Button with right icon pressed'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Icon only button
                    CustomButton(
                      text: '',
                      showText: false,
                      variant: ButtonVariant.primary,
                      showLeftIcon: true,
                      leftIcon: Icons.favorite,
                      width: 40,
                      onPressed: () => debugPrint('Icon only button pressed'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Text Field Component
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Text Field Component',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Different variants:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),
                Column(
                  children: [
                    // Basic Text Field
                    CustomTextField(
                      title: 'Title',
                      placeholder: 'Placeholder',
                      onChanged: (value) => debugPrint('Basic field: $value'),
                    ),
                    const SizedBox(height: 16),

                    // Text Field with Focus State
                    CustomTextField(
                      title: 'Title',
                      initialValue: 'Text',
                      state: TextFieldState.focused,
                      onChanged: (value) => debugPrint('Focused field: $value'),
                    ),
                    const SizedBox(height: 16),

                    // Text Field with Error State
                    CustomTextField(
                      title: 'Title',
                      initialValue: 'Text',
                      state: TextFieldState.error,
                      showSupportText: true,
                      supportText: 'This field has an error',
                      onChanged: (value) => debugPrint('Error field: $value'),
                    ),
                    const SizedBox(height: 16),

                    // Disabled Text Field
                    CustomTextField(
                      title: 'Title',
                      initialValue: 'Text',
                      state: TextFieldState.disabled,
                      onChanged:
                          (value) => debugPrint('Disabled field: $value'),
                    ),
                    const SizedBox(height: 16),

                    // Text Field with Icon
                    CustomTextField(
                      title: 'Title',
                      placeholder: 'Placeholder',
                      showIcon: true,
                      icon: Icons.search,
                      showSupportText: true,
                      supportText: 'Support text',
                      onChanged: (value) => debugPrint('Icon field: $value'),
                    ),
                    const SizedBox(height: 16),

                    // Text Field with Unit
                    CustomTextField(
                      title: 'Title',
                      initialValue: 'Text',
                      showUnit: true,
                      unit: '€',
                      state: TextFieldState.focused,
                      onChanged: (value) => debugPrint('Unit field: $value'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Radio Button Component
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Radio Button Component',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text('Different sizes:', style: TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Column(
                      children: [
                        CustomRadioButton<String>(
                          value: 'small',
                          groupValue: selectedOption,
                          size: RadioButtonSize.small,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                            debugPrint('Selected: $value');
                          },
                        ),
                        const SizedBox(height: 4),
                        const Text('Small', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      children: [
                        CustomRadioButton<String>(
                          value: 'medium',
                          groupValue: selectedOption,
                          size: RadioButtonSize.medium,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                            debugPrint('Selected: $value');
                          },
                        ),
                        const SizedBox(height: 4),
                        const Text('Medium', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      children: [
                        CustomRadioButton<String>(
                          value: 'large',
                          groupValue: selectedOption,
                          size: RadioButtonSize.large,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                            debugPrint('Selected: $value');
                          },
                        ),
                        const SizedBox(height: 4),
                        const Text('Large', style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                const Text(
                  'Radio Button Group:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 12),

                CustomRadioButtonGroup<String>(
                  options: const [
                    RadioButtonOption(value: 'option1', label: 'Option 1'),
                    RadioButtonOption(value: 'option2', label: 'Option 2'),
                    RadioButtonOption(value: 'option3', label: 'Option 3'),
                  ],
                  value: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                    debugPrint('Group selected: $value');
                  },
                  size: RadioButtonSize.medium,
                  spacing: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
