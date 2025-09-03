import 'package:flutter/material.dart';
class CustomBrandItem extends StatelessWidget {
  const CustomBrandItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300,width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 100,
          width: 105,

          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              "assets/images/SONY_Brand_test.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
