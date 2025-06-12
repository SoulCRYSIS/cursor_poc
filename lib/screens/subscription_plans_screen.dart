import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_radio_button.dart';

class SubscriptionPlansScreen extends StatefulWidget {
  const SubscriptionPlansScreen({super.key});

  @override
  State<SubscriptionPlansScreen> createState() =>
      _SubscriptionPlansScreenState();
}

class _SubscriptionPlansScreenState extends State<SubscriptionPlansScreen> {
  String selectedPlan = 'yearly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose your\nsubscription plan',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1F2024),
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'And get a 7-day free trial',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF71727A),
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildPlanOption(
                        'yearly',
                        'Yearly',
                        '€ 94.80',
                        'every year',
                        '-66% discount',
                        true,
                      ),
                      const SizedBox(height: 12),
                      _buildPlanOption(
                        'monthly',
                        'Monthly',
                        '€ 10.90',
                        'every month',
                        '-53% discount',
                        false,
                      ),
                      const SizedBox(height: 12),
                      _buildPlanOption(
                        'weekly',
                        'Weekly',
                        '€ 5.90',
                        'every week',
                        '',
                        false,
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F9FE),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'You\'ll get:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1F2024),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildBenefitItem('Unlimited access'),
                            const SizedBox(height: 16),
                            _buildBenefitItem('200GB storage'),
                            const SizedBox(height: 16),
                            _buildBenefitItem('Sync all your devices'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Subscribe',
                onPressed: () {
                  // TODO: Implement subscription logic
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption(
    String value,
    String title,
    String price,
    String period,
    String discount,
    bool isRecommended,
  ) {
    final isSelected = selectedPlan == value;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFEAF2FF) : Colors.white,
            border: Border.all(color: const Color(0xFFD4D6DD), width: 0.5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              CustomRadioButton(
                value: value,
                groupValue: selectedPlan,
                onChanged: (value) {
                  setState(() {
                    selectedPlan = value!;
                  });
                },
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2024),
                      ),
                    ),
                    if (discount.isNotEmpty)
                      Text(
                        discount,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFF006FFD),
                          height: 1.4,
                        ),
                      ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2024),
                    ),
                  ),
                  Text(
                    period,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF1F2024),
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (isRecommended)
          Positioned(
            top: 8,
            right: -8,
            child: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFF006FFD),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.star, color: Colors.white, size: 16),
            ),
          ),
      ],
    );
  }

  Widget _buildBenefitItem(String text) {
    return Row(
      children: [
        const Icon(Icons.star, color: Color(0xFF006FFD), size: 10),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF71727A),
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
