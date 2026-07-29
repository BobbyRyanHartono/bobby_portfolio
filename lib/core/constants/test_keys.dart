import 'package:flutter/material.dart';

/// Centralized test_ids (Widget Keys) for widget and integration testing.
abstract class TestKeys {
  static const Key app = Key('bobby_portfolio_app');
  static const Key themeToggle = Key('theme_toggle_button');
  
  // Navigation bar item keys
  static Key navItem(String section) => Key('nav_item_$section');
  
  // Hero section keys
  static const Key heroProjectsButton = Key('hero_view_projects_button');
  static const Key heroContactButton = Key('hero_contact_me_button');
  
  // Contact section form keys
  static const Key contactNameInput = Key('contact_name_input');
  static const Key contactEmailInput = Key('contact_email_input');
  static const Key contactSubjectInput = Key('contact_subject_input');
  static const Key contactMessageInput = Key('contact_message_input');
  static const Key contactSubmitButton = Key('contact_submit_button');

  // Section keys
  static Key section(String name) => Key('section_$name');
}
