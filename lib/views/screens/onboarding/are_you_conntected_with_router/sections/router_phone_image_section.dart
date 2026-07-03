import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RouterPhoneImageSection extends StatelessWidget {
  const RouterPhoneImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Router Image
          Image.asset(
            'assets/images/router_image.webp',
            height: 105,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 24),

          Lottie.asset(
            'assets/animations/wifi_connect.json',
            width: 50,
            height: 50,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wifi_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              );
            },
          ),
          const SizedBox(width: 36),

          // Phone Image
          Image.asset(
            'assets/images/phone.webp',
            height: 105,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
