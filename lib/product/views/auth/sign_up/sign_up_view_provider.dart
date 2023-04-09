import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_auth_form_provider.dart';

class SignUpViewProvider extends BaseAuthFormChangeNotifier{
  
}

final signUpViewProvider = ChangeNotifierProvider((ref) => SignUpViewProvider());