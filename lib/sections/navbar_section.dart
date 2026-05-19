import 'package:flutter/material.dart';

class NavbarSection extends StatelessWidget {
  final GlobalKey homeKey;
  final GlobalKey servicesKey;
  final GlobalKey doctorsKey;
  final GlobalKey aboutKey;
  final GlobalKey contactKey;
  final GlobalKey appointmentKey;

  const NavbarSection({
    super.key,
    required this.homeKey,
    required this.servicesKey,
    required this.doctorsKey,
    required this.aboutKey,
    required this.contactKey,
    required this.appointmentKey,
  });

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOut,
      alignment: 0.02,
    );
  }

  void _openMobileMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                _mobileTile(ctx, 'Home', () => _scrollTo(homeKey)),
                _mobileTile(ctx, 'Services', () => _scrollTo(servicesKey)),
                _mobileTile(ctx, 'Doctor', () => _scrollTo(doctorsKey)),
                _mobileTile(ctx, 'About', () => _scrollTo(aboutKey)),
                _mobileTile(ctx, 'Appointment', () => _scrollTo(appointmentKey)),
                _mobileTile(ctx, 'Contact', () => _scrollTo(contactKey)),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _mobileTile(BuildContext context, String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;

    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.92),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 18,
              offset: const Offset(0, 10),
            )
          ],
          border: Border(
            bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.12)),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 60,
          vertical: 14,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () => _scrollTo(homeKey),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
                      'PhysioCare',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0F6FFF),
                      ),
                    ),
                  ),
                ),
                if (isMobile)
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff0F6FFF),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () => _scrollTo(appointmentKey),
                        child: const Text(
                          'Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () => _openMobileMenu(context),
                        icon: const Icon(Icons.menu),
                        tooltip: 'Menu',
                      ),
                    ],
                  )
                else
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Wrap(
                          alignment: WrapAlignment.end,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 6,
                          runSpacing: 6,
                          children: [
                            _NavButton('Home', () => _scrollTo(homeKey)),
                            _NavButton('Services', () => _scrollTo(servicesKey)),
                            _NavButton('Doctor', () => _scrollTo(doctorsKey)),
                            _NavButton('About', () => _scrollTo(aboutKey)),
                            _NavButton('Contact', () => _scrollTo(contactKey)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      FittedBox(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff0F6FFF),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () => _scrollTo(appointmentKey),
                          child: const Text(
                            'Book Appointment',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _NavButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
      child: Text(label),
    );
  }
}
