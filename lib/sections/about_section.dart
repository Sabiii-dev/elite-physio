import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
                children: [
                  _image(height: 280),
                  const SizedBox(height: 28),
                  _content(context, centerAlign: true),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _image()),
                  const SizedBox(width: 40),
                  Expanded(child: _content(context, centerAlign: false)),
                ],
              ),
      ),
    );
  }

  Widget _image({double height = 520}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: SizedBox(
        height: height,
        child: Image.asset(
          'assets/images/about1.0.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _content(BuildContext context, {required bool centerAlign}) {
    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'About Me',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'At ElitePhysio, I combine hands-on therapy, guided exercise, and modern rehab methods to help you return to the activities you love.',
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 22),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: const [
            _FeatureChip(icon: Icons.verified, text: 'Licensed Therapists'),
            _FeatureChip(icon: Icons.favorite, text: 'Patient-first Care'),
            _FeatureChip(icon: Icons.biotech, text: 'Modern Techniques'),
            _FeatureChip(icon: Icons.schedule, text: 'Flexible Scheduling'),
          ],
        ),
        const SizedBox(height: 28),
        const _Bullet(title: '1:1 Sessions', text: 'Focused time with your therapist.'),
        const SizedBox(height: 10),
        const _Bullet(
          title: 'Clear Plans',
          text: 'Simple, step-by-step home program for faster recovery.',
        ),
        const SizedBox(height: 10),
        const _Bullet(
          title: 'Measurable Progress',
          text: 'We track improvements and adjust your plan as you improve.',
        ),
      ],
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureChip({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF7FAFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xffEAF2FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: const Color(0xff0F6FFF)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String title;
  final String text;

  const _Bullet({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2),
          child: Icon(Icons.check_circle, color: Color(0xff0F6FFF), size: 20),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style.copyWith(height: 1.6),
              children: [
                TextSpan(
                  text: '$title: ',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: text,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
