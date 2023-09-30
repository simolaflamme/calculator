import 'dart:async';

import 'package:my_app/events/authentication_events.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/repositories/authentication_repository.dart';

class AuthenticationBloc {
  final AuthenticationRepository _authenticationRepository;
  final StreamController<User> _userController = StreamController<User>();

  Stream<User> get userStream => _userController.stream;

  AuthenticationBloc(this._authenticationRepository);

  void signUp(String email, String password) async {
    try {
      User user = await _authenticationRepository.signUp(email, password);
      _userController.add(user);
    } catch (e) {
      // Handle signup error
    }
  }

  void dispose() {
    _userController.close();
  }
}