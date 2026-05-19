import 'package:flutter/material.dart';
import 'sections/navbar_section.dart';
import 'sections/hero_section.dart';
import 'sections/services_section.dart';
import 'sections/about_section.dart';
import 'sections/doctors_section.dart';
import 'sections/appointment_section.dart';
import 'sections/testimonial_section.dart';
import 'sections/contact_section.dart';
import 'sections/footer_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeKey = GlobalKey();
    final servicesKey = GlobalKey();
    final doctorsKey = GlobalKey();
    final aboutKey = GlobalKey();
    final contactKey = GlobalKey();
    final appointmentKey = GlobalKey();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavbarSection(
                homeKey: homeKey,
                servicesKey: servicesKey,
                doctorsKey: doctorsKey,
                aboutKey: aboutKey,
                contactKey: contactKey,
                appointmentKey: appointmentKey,
              ),
              KeyedSubtree(
                key: homeKey,
                child: HeroSection(
                  appointmentKey: appointmentKey,
                  aboutKey: aboutKey,
                ),
              ),
              KeyedSubtree(key: servicesKey, child: const ServicesSection()),
              KeyedSubtree(key: aboutKey, child: const AboutSection()),
              KeyedSubtree(key: doctorsKey, child: const DoctorsSection()),
              KeyedSubtree(key: appointmentKey, child: const AppointmentSection()),
              const TestimonialSection(),
              KeyedSubtree(key: contactKey, child: const ContactSection()),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }
}