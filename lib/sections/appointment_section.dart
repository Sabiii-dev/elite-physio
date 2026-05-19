import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentSection extends StatefulWidget {
  const AppointmentSection({super.key});

  @override
  State<AppointmentSection> createState() => _AppointmentSectionState();
}

class _AppointmentSectionState extends State<AppointmentSection> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _message = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 900;

    return Container(
      width: double.infinity,
      color: const Color(0xff0F6FFF),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: isMobile ? 50 : 80,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: isMobile
            ? Column(
                children: [
                  _cta(context, centerAlign: true),
                  const SizedBox(height: 22),
                  _form(context),
                ],
              )
            : Row(
                children: [
                  Expanded(child: _cta(context, centerAlign: false)),
                  const SizedBox(width: 26),
                  Expanded(child: _form(context)),
                ],
              ),
      ),
    );
  }

  Widget _cta(BuildContext context, {required bool centerAlign}) {
    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        const Text(
          'Book an Appointment',
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'Tell us a bit about your concern and we\'ll get back to you quickly with available times.',
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            height: 1.7,
            color: Colors.white.withOpacity(0.85),
          ),
        ),
        const SizedBox(height: 18),
        Wrap(
          alignment: centerAlign ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 12,
          children: [
            _pill(icon: Icons.call, text: '+923166558710'),
            _pill(icon: Icons.schedule, text: 'Mon–Sat: 12am–7pm'),
          ],
        )
      ],
    );
  }

  Widget _pill({required IconData icon, required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Colors.white),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Request a callback',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: 'Full name',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your name' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _phone,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                border: OutlineInputBorder(),
              ),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter your phone number' : null,
            ),
            const SizedBox(height: 14),
            TextFormField(
              controller: _message,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Message (optional)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0F6FFF),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() != true) return;

                  final name = _name.text;
                  final phone = _phone.text;
                  final msg = _message.text;
                  final text = 'New Appointment Request:\nName: $name\nPhone: $phone\nMessage: $msg';

                  final url = Uri.parse('https://wa.me/923059816141?text=${Uri.encodeComponent(text)}');
                  try {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Thanks! Redirecting to WhatsApp...')),
                      );
                    }
                    _name.clear();
                    _phone.clear();
                    _message.clear();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Could not open WhatsApp.')),
                      );
                    }
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
