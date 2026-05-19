import 'package:flutter/material.dart';

class TestimonialSection extends StatelessWidget {
  const TestimonialSection({super.key});

  static const _items = <_Testimonial>[
    _Testimonial(
      name: 'Hassan R.',
      role: 'Runner',
      quote:
          'Within a few sessions, my knee pain improved a lot. The plan was clear and easy to follow at home.',
    ),
    _Testimonial(
      name: 'Maria S.',
      role: 'Office Worker',
      quote:
          'Professional team and great results for my neck and posture issues. Highly recommended!',
    ),
    _Testimonial(
      name: 'Ahmed K.',
      role: 'Post-surgery recovery',
      quote:
          'Amazing guidance after surgery. Each week I could see progress and gained confidence in movement again.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < 800;

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
            'What Patients Say',
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              'Real feedback from people who trusted us with their recovery.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1150),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.9 : 1.25,
              ),
              itemBuilder: (context, index) => _Card(item: _items[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class _Testimonial {
  final String name;
  final String role;
  final String quote;

  const _Testimonial({
    required this.name,
    required this.role,
    required this.quote,
  });
}

class _Card extends StatelessWidget {
  final _Testimonial item;

  const _Card({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, size: 34, color: Color(0xff0F6FFF)),
          const SizedBox(height: 14),
          Expanded(
            child: Text(
              item.quote,
              style: TextStyle(
                fontSize: 15,
                height: 1.7,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xffEAF2FF),
                child: Icon(Icons.person, color: Color(0xff0F6FFF)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.role,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

