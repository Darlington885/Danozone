
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';


part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {}

abstract class _LoginStore with Store {
  final LoginErrorStore error = LoginErrorStore();
  var localAuth = LocalAuthentication();

  @observable
  bool loading = false;

  @observable
  bool absorb = false;

  @observable
  bool passwordVisible = true;

  @observable
  String email;

  @observable
  String token;

  @observable
  String name;

  @observable
  String username;

  @observable
  String contactNumber;

  @observable
  String countryCode;

  @observable
  String password;

  @action
  void load(bool load) {
    loading = load;
  }

  @action
  void validatePassword(String value) {
    error.password =
    isNull(value) || value.isEmpty ? 'Password is required' : null;
  }

  @action
  void validateEmail(String value) {
    if (isNull(value) || value.isEmpty) {
      error.email = 'Email is required';
    } else if (!isEmail(value)) {
      error.email = 'Enter a valid email';
    } else {
      error.email = null;
    }
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  bool get hasErrors {
    absorb = false;
    validateEmail(email);
    validatePassword(password);
    return error.hasErrors;
  }



}

class LoginErrorStore = _LoginErrorStore with _$LoginErrorStore;

abstract class _LoginErrorStore with Store {

  @observable
  String name;

  @observable
  String username;

  @observable
  String confirmPassword;

  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => name != null || username != null || email != null || password != null;
  bool get regHasErrors => username != null || email != null || password != null;
}