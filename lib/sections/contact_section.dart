import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _info(),
                  const SizedBox(height: 22),
                  _mapPlaceholder(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _info()),
                  const SizedBox(width: 26),
                  Expanded(child: _mapPlaceholder()),
                ],
              ),
      ),
    );
  }

  Widget _info() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 14),
        Text(
          'Have questions? Reach out and our team will help you choose the right service.',
          style: TextStyle(fontSize: 16, height: 1.7, color: Colors.grey.shade700),
        ),
        const SizedBox(height: 24),
        _row(icon: Icons.location_on, title: 'Address', value: '1246, F block, Shah Rukne Alam Colony, Multan'),
        const SizedBox(height: 14),
        _row(icon: Icons.call, title: 'Phone', value: '+923166558710'),
        const SizedBox(height: 14),
        _row(icon: Icons.email, title: 'Email', value: 'muqadasbano7812@gmail.com'),
        const SizedBox(height: 14),
        _row(icon: Icons.schedule, title: 'Hours', value: 'Mon–Sat: 12pm–7:pm'),
      ],
    );
  }

  Widget _row({required IconData icon, required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: const Color(0xffEAF2FF),
          child: Icon(icon, color: const Color(0xff0F6FFF), size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(value, style: TextStyle(color: Colors.grey.shade700, height: 1.5)),
            ],
          ),
        )
      ],
    );
  }

  Widget _mapPlaceholder() {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=30.190836,71.508491');
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 360,
          color: const Color(0xffF7FAFF),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/m.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(color: Colors.black.withOpacity(0.25)),
              ),
              Positioned(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.location_on, color: Colors.redAccent, size: 50),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Open in Google Maps', style: TextStyle(fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
