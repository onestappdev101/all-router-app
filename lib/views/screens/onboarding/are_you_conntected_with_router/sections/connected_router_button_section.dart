import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onest_all_router_app/views/screens/onboarding/how_to_connect_router/how_to_connect_to_router_screen.dart';
import 'package:onest_all_router_app/views/screens/onboarding/select_router/select_router_screen.dart';

class ConnectedRouterButtonSection extends StatelessWidget {
  const ConnectedRouterButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Yes, Connected Button
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectRouterScreen()));
            },
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF2D29D4),
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: Text(
              'Yes, Connected',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Need Help? Button
        GestureDetector(
          onTap: () {
            // Add logic for Need Help?
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HowToConnectToRouterScreen()));
          },
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            alignment: Alignment.center,
            child: Text(
              'Need Help?',
              style: GoogleFonts.outfit(
                color: const Color(0xFF2D29D4),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
