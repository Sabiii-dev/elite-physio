import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 700;

    return Container(
      width: double.infinity,
      color: const Color(0xff0B2A5B),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 40,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            isMobile ? _mobileTop() : _desktopTop(),
            const SizedBox(height: 26),
            Divider(color: Colors.white.withValues(alpha: 0.12)),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '© ${DateTime.now().year} ElitePhysio. All rights reserved.',
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
                  ),
                ),
                Text(
                  'Made with Flutter',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _desktopTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: _brand(),
        ),
        Expanded(child: _links('Company', const ['About', 'Doctors', 'Careers'])),
        Expanded(child: _links('Services', const ['Rehab', 'Home Therapy', 'Manual Therapy'])),
        Expanded(child: _links('Support', const ['Contact', 'FAQ', 'Privacy'])),
      ],
    );
  }

  Widget _mobileTop() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _brand(),
        const SizedBox(height: 18),
        _links('Company', const ['About', 'Doctors', 'Careers']),
        const SizedBox(height: 12),
        _links('Services', const ['Rehab', 'Home Therapy', 'Manual Therapy']),
        const SizedBox(height: 12),
        _links('Support', const ['Contact', 'FAQ', 'Privacy']),
      ],
    );
  }

  Widget _brand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ElitePhysio',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Physiotherapy & rehabilitation clinic dedicated to helping you move better and live stronger.',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.78), height: 1.6),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          children: const [
            _SocialIcon(Icons.facebook),
            _SocialIcon(Icons.language),
            _SocialIcon(Icons.play_circle_outline),
          ],
        )
      ],
    );
  }

  Widget _links(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.92),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...items.map(
          (t) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              t,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
            ),
          ),
        )
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;

  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }
}
