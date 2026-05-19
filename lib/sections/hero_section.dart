import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey appointmentKey;
  final GlobalKey aboutKey;

  const HeroSection({
    super.key,
    required this.appointmentKey,
    required this.aboutKey,
  });

  void _scrollToAppointment() {
    final ctx = appointmentKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  void _scrollToAbout() {
    final ctx = aboutKey.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 40 : 70,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile ? _mobileLayout(context) : _desktopLayout(context),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _content(context, centerAlign: false)),
        const SizedBox(width: 30),
        Expanded(child: _image()),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Column(
      children: [
        _image(height: 320),
        const SizedBox(height: 24),
        _content(context, centerAlign: true),
      ],
    );
  }

  Widget _content(BuildContext context, {required bool centerAlign}) {
    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xffEAF2FF),
            borderRadius: BorderRadius.circular(999),
          ),
          child: const Text(
            'Trusted Physiotherapy & Rehabilitation',
            style: TextStyle(
              color: Color(0xff0F6FFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Move better.\nFeel stronger.\nLive pain-free.',
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            fontSize: 54,
            height: 1.08,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'ElitePhysio helps you recover with modern treatment plans, licensed therapists, and a friendly care team.',
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 26),
        Wrap(
          alignment: centerAlign ? WrapAlignment.center : WrapAlignment.start,
          spacing: 14,
          runSpacing: 12,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0F6FFF),
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                _scrollToAppointment();
              },
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                _scrollToAbout();
              },
              child: const Text('Learn More'),
            ),
          ],
        ),
        const SizedBox(height: 34),
        Wrap(
          alignment: centerAlign ? WrapAlignment.center : WrapAlignment.start,
          spacing: 18,
          runSpacing: 18,
          children: const [
            _StatCard('5+', 'Years Experience'),
            _StatCard('500+', 'Patients'),
            _StatCard('24/7', 'Support'),
          ],
        )
      ],
    );
  }

  Widget _image({double? height}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: SizedBox(
        height: height ?? 560,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/elite.png',
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.0),
                    Colors.black.withValues(alpha: 0.25),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _StatCard(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.12),
            blurRadius: 15,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xff0F6FFF),
            ),
          ),
          const SizedBox(height: 6),
          Text(subtitle),
        ],
      ),
    );
  }
}
