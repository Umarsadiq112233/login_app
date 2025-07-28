import 'package:flutter/material.dart';

class SignUpFormValidators {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static void handleSignUp(
    BuildContext context,
    String username,
    String password,
    String confirmPassword,
  ) {
    final usernameError = validateUsername(username);
    final passwordError = validatePassword(password);
    final confirmPasswordError = validateConfirmPassword(confirmPassword, password);

    if (usernameError == null && passwordError == null && confirmPasswordError == null) {
      // ✅ Sign up success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign Up Successful")),
      );
    } else {
      // ❌ Show first error
      final error = usernameError ?? passwordError ?? confirmPasswordError!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }
}

class LoginScreenValidators {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  static void handleLogin(BuildContext context, String username, String password) {
    final usernameError = validateUsername(username);
    final passwordError = validatePassword(password);

    if (usernameError == null && passwordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful")),
      );
    } else {
      final error = usernameError ?? passwordError!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }
}
