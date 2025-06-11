import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 48, 32, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose your\nsubscription plan',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF1F2024),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'And get a 7-day free trial',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF71727A),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      _buildPlanOption(
                        title: 'Yearly',
                        price: '€ 94.80',
                        period: 'every year',
                        discount: '-66% discount',
                        isSelected: true,
                        isRecommended: true,
                      ),
                      const SizedBox(height: 12),
                      _buildPlanOption(
                        title: 'Monthly',
                        price: '€ 10.90',
                        period: 'every month',
                        discount: '-53% discount',
                      ),
                      const SizedBox(height: 12),
                      _buildPlanOption(
                        title: 'Weekly',
                        price: '€ 5.90',
                        period: 'every week',
                      ),
                      const SizedBox(height: 32),
                      _buildBenefitsCard(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006FFD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Subscribe',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanOption({
    required String title,
    required String price,
    required String period,
    String? discount,
    bool isSelected = false,
    bool isRecommended = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFEAF2FF) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            !isSelected
                ? Border.all(color: const Color(0xFFD4D6DD), width: 0.5)
                : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildRadioButton(isSelected),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1F2024),
                        ),
                      ),
                      if (discount != null)
                        Text(
                          discount,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF006FFD),
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
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1F2024),
                      ),
                    ),
                    Text(
                      period,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF1F2024),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isRecommended)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFF006FFD),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.star, color: Colors.white, size: 14),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(bool isSelected) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? const Color(0xFF006FFD) : const Color(0xFFC5C6CC),
          width: isSelected ? 1 : 1.5,
        ),
      ),
      child:
          isSelected
              ? Center(
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              )
              : null,
    );
  }

  Widget _buildBenefitsCard() {
    return Container(
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
              fontFamily: 'Inter',
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
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF71727A),
          ),
        ),
      ],
    );
  }
}
