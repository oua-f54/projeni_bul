import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_auth_form_provider.dart';

class LoginViewProvider extends BaseAuthFormChangeNotifier{
    
}

final loginViewProvider = ChangeNotifierProvider((ref) => LoginViewProvider());