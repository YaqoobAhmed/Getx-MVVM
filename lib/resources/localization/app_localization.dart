import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Email',
          'password_hint': 'Password',
          'internet_exception':
              'We are unable to show results\nPlease check your data\ninternet connetion',
          'general_exception':
              'We are unable to show results\nPlease Try again',
          'welcome_back': 'Welcome\nback',
          'login': 'Login'
        },
        'ur_PK': {'email_hint': 'ای میل درج کریں۔'},
      };
}
