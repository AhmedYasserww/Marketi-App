import 'package:flutter/material.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffB2CCFF).withOpacity(0.7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffB2CCFF).withOpacity(0.5),
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                'Subtotal (3 items)',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                'EGP 1,120.00',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 14),
         CustomButton(text: "Checkout", onTap: (){},)
        ],
      ),
    );
  }
}
