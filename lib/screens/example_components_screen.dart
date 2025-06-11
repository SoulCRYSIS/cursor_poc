import 'package:flutter/material.dart';
import '../components/avatar.dart';
import '../components/toast.dart';

class ExampleComponentsScreen extends StatelessWidget {
  const ExampleComponentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Components')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
