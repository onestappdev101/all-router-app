import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HowToConnectRouterHeaderSection extends StatelessWidget {
  const HowToConnectRouterHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/images/router_image.webp",
          height: 80,
          fit: BoxFit.contain,
        ),
        const Icon(Icons.compare_arrows_outlined),
        Lottie.asset(
          'assets/animations/Phone Wifi, Mobile internet, Network, Wifi, Communication, connection, smartphone animation.json',
          height: 120,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.router_rounded,
              size: 110,
              color: Colors.grey,
            );
          },
        ),
      ],
    );
  }
}
