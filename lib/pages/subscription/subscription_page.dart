import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropay_app/constants/colors.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('subscriptions_title'.tr, style: TextStyle(color: black)),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[100],
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            _buildSubscriptionCard(
              context:context,
              title: 'basic_plan'.tr,
              price: '₹199/month',
              features: [
                'basic_plan_features'.tr,
              ],
            ),
            const SizedBox(height: 16),
            _buildSubscriptionCard(
              context:context,
              title: 'pro_plan'.tr,
              price: '₹399/month',
              features: [
                'pro_plan_features'.tr,
              ],
              isHighlighted: true,
            ),
            const SizedBox(height: 16),
            _buildSubscriptionCard(
              context:context,
              title: 'premium_plan'.tr,
              price: '₹599/month',
              features: [
                'premium_plan_features'.tr,
                // 'Track water usage for unlimited devices',
                // 'Real-time usage analytics',
                // '24/7 premium support',
                // '30% discount on repairs',
                // 'Advanced leak & wastage alerts',
                // 'Custom water-saving tips',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard({
    required String title,
    required String price,
    required List<String> features,
    bool isHighlighted = false,
    required BuildContext context,
  }) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isHighlighted
                ? [Colors.blue[100]!, Colors.blue[200]!]
                : [Colors.white, Colors.grey[200]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isHighlighted ? Colors.white : primaryBlue,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isHighlighted ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            ...features.map((feature) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Colors.green, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          feature,
                          style: TextStyle(
                            fontSize: 14,
                            color: isHighlighted ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                // Add subscription logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isHighlighted ? Colors.white : primaryBlue,
                foregroundColor: isHighlighted ? primaryBlue : Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text('subscribe_now'.tr, style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}