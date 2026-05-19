import 'package:flutter/material.dart';

class DoctorsSection extends StatelessWidget {
  const DoctorsSection({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Meet Your Doctor',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 780),
              child: Text(
                'Specialized care with a focused, one-to-one approach — led by the clinic owner.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 40),
            _DoctorProfileCard(isMobile: isMobile),
          ],
        ),
      ),
    );
  }
}

class _DoctorProfileCard extends StatelessWidget {
  final bool isMobile;

  const _DoctorProfileCard({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: EdgeInsets.all(isMobile ? 18 : 26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: isMobile ? _mobile(context) : _desktop(context),
    );

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 980),
      child: card,
    );
  }

  Widget _photo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          'assets/images/dr.jpeg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _details(BuildContext context, {required bool centerAlign}) {
    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Dr Muqadas Bano',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Clinical Physiotherapist',
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
        ),
        const SizedBox(height: 14),
        _infoRow(
          icon: Icons.work_outline,
          text:
              'Former physiotherapist at Ibne e Sina Hospital, Multan (House-officer)',
          centerAlign: centerAlign,
        ),
        const SizedBox(height: 18),
        Wrap(
          alignment: centerAlign ? WrapAlignment.center : WrapAlignment.start,
          spacing: 10,
          runSpacing: 10,
          children: const [
            _Tag('Rehabilitation'),
            _Tag('Pain Management'),
            _Tag('Post-surgery Care'),
          ],
        ),
      ],
    );
  }

  Widget _infoRow({
    required IconData icon,
    required String text,
    required bool centerAlign,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          centerAlign ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 20, color: const Color(0xff0F6FFF)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            textAlign: centerAlign ? TextAlign.center : TextAlign.left,
            style: TextStyle(height: 1.6, color: Colors.grey.shade700),
          ),
        )
      ],
    );
  }

  Widget _desktop(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 260, child: _photo()),
        const SizedBox(width: 26),
        Expanded(child: _details(context, centerAlign: false)),
      ],
    );
  }

  Widget _mobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(width: 220, child: _photo()),
        const SizedBox(height: 18),
        _details(context, centerAlign: true),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;

  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffF7FAFF),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xffEAF2FF)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

