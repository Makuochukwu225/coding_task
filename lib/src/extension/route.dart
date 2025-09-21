import 'package:flutter/material.dart';

// Extension on BuildContext for navigation
extension NavigationExtension on BuildContext {
  // Pop with optional result
  void pop([dynamic result]) {
    Navigator.of(this).maybePop(result);
  }

  // Push with fade transition
  Future<T?> push<T extends Object?>(Widget page) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(opacity: animation, child: page),
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // Push replacement with fade transition
  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return Navigator.pushReplacement<T, TO>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(opacity: animation, child: page),
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
      result: result,
    );
  }

  // Push and remove all previous routes
  Future<T?> pushRemoveAll<T extends Object?>(Widget page) {
    return Navigator.pushAndRemoveUntil<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(opacity: animation, child: page),
        transitionDuration: const Duration(milliseconds: 300),
        reverseTransitionDuration: const Duration(milliseconds: 300),
      ),
      (route) => false,
    );
  }

  // Additional navigation methods

  // Push with slide transition
  Future<T?> pushSlide<T extends Object?>(
    Widget page, {
    SlideDirection direction = SlideDirection.fromRight,
  }) {
    Offset begin;
    switch (direction) {
      case SlideDirection.fromRight:
        begin = const Offset(1.0, 0.0);
        break;
      case SlideDirection.fromLeft:
        begin = const Offset(-1.0, 0.0);
        break;
      case SlideDirection.fromTop:
        begin = const Offset(0.0, -1.0);
        break;
      case SlideDirection.fromBottom:
        begin = const Offset(0.0, 1.0);
        break;
    }

    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  // Push with scale transition
  Future<T?> pushScale<T extends Object?>(Widget page) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.elasticOut),
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }

  // Push with rotation transition
  Future<T?> pushRotation<T extends Object?>(Widget page) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return RotationTransition(
            turns: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  // Push with custom transition
  Future<T?> pushCustom<T extends Object?>({
    required Widget page,
    required Widget Function(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    )
    transitionBuilder,
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return Navigator.push<T>(
      this,
      PageRouteBuilder<T>(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: transitionBuilder,
        transitionDuration: duration,
        reverseTransitionDuration: duration,
      ),
    );
  }

  // Pop until specific route
  void popUntil(String routeName) {
    Navigator.popUntil(this, ModalRoute.withName(routeName));
  }

  // Check if can pop
  bool get canPop => Navigator.canPop(this);

  // Pop with confirmation dialog
  Future<bool> popWithConfirmation({
    String title = 'Confirm',
    String message = 'Are you sure you want to go back?',
    String confirmText = 'Yes',
    String cancelText = 'No',
  }) async {
    final result = await showDialog<bool>(
      context: this,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelText),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(confirmText),
            ),
          ],
        );
      },
    );

    if (result == true) {
      Navigator.of(this).pop();
      return true;
    }
    return false;
  }

  // Show snackbar (bonus utility)
  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), duration: duration, action: action),
    );
  }

  // Show bottom sheet (bonus utility)
  Future<T?> showBottomSheet<T>(Widget child) {
    return showModalBottomSheet<T>(
      context: this,
      builder: (context) => child,
      backgroundColor: Colors.transparent,
    );
  }

  // Navigation with result handling
  Future<T?> pushForResult<T extends Object?>(Widget page) async {
    final result = await push<T>(page);
    return result;
  }

  // Multiple pop operations
  void popMultiple(int count) {
    for (int i = 0; i < count && canPop; i++) {
      Navigator.of(this).pop();
    }
  }
}

// Enum for slide directions
enum SlideDirection { fromRight, fromLeft, fromTop, fromBottom }
