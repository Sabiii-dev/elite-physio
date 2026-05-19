import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  static const List<_Service> _services = [
    _Service(
      title: 'Rehabilitation',
      icon: Icons.accessibility_new,
      description:
          'Personalized rehab plans to restore strength, balance, and mobility.',
    ),
    _Service(
      title: 'Home Therapy',
      icon: Icons.home,
      description:
          'Convenient physiotherapy sessions at home with safe, guided exercises.',
    ),
    _Service(
      title: 'Post Surgery Care',
      icon: Icons.healing,
      description:
          'Step-by-step recovery support after surgery to help you return to normal life.',
    ),
    _Service(
      title: 'Sports Injury',
      icon: Icons.sports_soccer,
      description:
          'Assessment and treatment to reduce pain, speed recovery, and prevent re-injury.',
    ),
    _Service(
      title: 'Pain Management',
      icon: Icons.health_and_safety,
      description:
          'Evidence-based care for back/neck pain, joint pain, and posture-related issues.',
    ),
    _Service(
      title: 'Manual Therapy',
      icon: Icons.pan_tool_alt,
      description:
          'Hands-on therapy techniques designed to improve movement and reduce stiffness.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 650;
    final isTablet = width >= 650 && width < 1024;

    final crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      width: double.infinity,
      color: const Color(0xffF7FAFF),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: Column(
        children: [
          const Text(
            'Our Services',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              'Comprehensive physiotherapy services for recovery, performance, and long-term wellbeing.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _services.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.6 : 1.25,
              ),
              itemBuilder: (context, index) {
                final service = _services[index];
                return _ServiceCard(service: service);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Service {
  final String title;
  final IconData icon;
  final String description;

  const _Service({
    required this.title,
    required this.icon,
    required this.description,
  });
}

class _ServiceCard extends StatefulWidget {
  final _Service service;

  const _ServiceCard({required this.service});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final service = widget.service;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered ? const Color(0xff0F6FFF) : Colors.transparent,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: _hovered ? 0.16 : 0.08),
              blurRadius: _hovered ? 18 : 12,
              offset: const Offset(0, 8),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: const Color(0xffEAF2FF),
              child: Icon(
                service.icon,
                color: const Color(0xff0F6FFF),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              service.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Text(
                service.description,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _hovered ? const Color(0xff0F6FFF) : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
