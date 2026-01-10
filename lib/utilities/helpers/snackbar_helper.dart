import 'package:flutter/material.dart';

class SnackBarHelper {
  SnackBarHelper._();

  static const Duration _defaultDuration = Duration(seconds: 3);
  static const Duration _shortDuration = Duration(seconds: 2);
  static const Duration _longDuration = Duration(seconds: 5);

  static void showSuccess(
      BuildContext context,
      String message, {
        Duration? duration,
        SnackBarAction? action,
      }) {

    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.green[600],
      icon: Icons.check_circle,
      iconColor: Colors.white,
      duration: duration ?? _defaultDuration,
      action: action,
    );
  }

  static void showError(
      BuildContext context,
      String message, {
        Duration? duration,
        SnackBarAction? action,
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.red[600],
      icon: Icons.error,
      iconColor: Colors.white,
      duration: duration ?? _longDuration,
      action: action,
    );
  }

  static void showWarning(
      BuildContext context,
      String message, {
        Duration? duration,
        SnackBarAction? action,
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.orange[700],
      icon: Icons.warning,
      iconColor: Colors.white,
      duration: duration ?? _defaultDuration,
      action: action,
    );
  }

  static void showInfo(
      BuildContext context,
      String message, {
        Duration? duration,
        SnackBarAction? action,
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: Colors.blue[600],
      icon: Icons.info,
      iconColor: Colors.white,
      duration: duration ?? _defaultDuration,
      action: action,
    );
  }

  static void showCustom(
      BuildContext context, {
        required String message,
        Color? backgroundColor,
        Color? textColor,
        IconData? icon,
        Color? iconColor,
        Duration? duration,
        SnackBarAction? action,
      }) {
    _showSnackBar(
      context,
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      iconColor: iconColor,
      duration: duration ?? _defaultDuration,
      action: action,
    );
  }

  static void showLoading(
      BuildContext context,
      String message, {
        Duration? duration,
      }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[800],
      duration: duration ?? _longDuration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void _showSnackBar(
      BuildContext context, {
        required String message,
        Color? backgroundColor,
        Color? textColor,
        IconData? icon,
        Color? iconColor,
        required Duration duration,
        SnackBarAction? action,
      }) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: iconColor ?? Colors.white,
              size: 24,
            ),
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor ?? Colors.grey[800],
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      action: action,
      margin: const EdgeInsets.all(16),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void hide(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void clearAll(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
  }
}


enum SnackBarType {
  success,
  error,
  warning,
  info,
  loading;

  Color get backgroundColor {
    switch (this) {
      case SnackBarType.success:
        return Colors.green.shade600;
      case SnackBarType.error:
        return Colors.red.shade600;
      case SnackBarType.warning:
        return Colors.orange.shade700;
      case SnackBarType.info:
        return Colors.blue.shade600;
      case SnackBarType.loading:
        return Colors.grey.shade800;
    }
  }

  IconData get icon {
    switch (this) {
      case SnackBarType.success:
        return Icons.check_circle;
      case SnackBarType.error:
        return Icons.error;
      case SnackBarType.warning:
        return Icons.warning;
      case SnackBarType.info:
        return Icons.info;
      case SnackBarType.loading:
        return Icons.hourglass_empty;
    }
  }
}



extension SnackBarExtension on BuildContext {
  void showSuccess(String message, {Duration? duration, SnackBarAction? action}) {
    SnackBarHelper.showSuccess(this, message, duration: duration, action: action);
  }

  void showError(String message, {Duration? duration, SnackBarAction? action}) {
    SnackBarHelper.showError(this, message, duration: duration, action: action);
  }

  void showWarning(String message, {Duration? duration, SnackBarAction? action}) {
    SnackBarHelper.showWarning(this, message, duration: duration, action: action);
  }

  void showInfo(String message, {Duration? duration, SnackBarAction? action}) {
    SnackBarHelper.showInfo(this, message, duration: duration, action: action);
  }

  void showLoading(String message, {Duration? duration}) {
    SnackBarHelper.showLoading(this, message, duration: duration);
  }

  void showCustomSnackBar({
    required String message,
    Color? backgroundColor,
    Color? textColor,
    IconData? icon,
    Color? iconColor,
    Duration? duration,
    SnackBarAction? action,
  }) {
    SnackBarHelper.showCustom(
      this,
      message: message,
      backgroundColor: backgroundColor,
      textColor: textColor,
      icon: icon,
      iconColor: iconColor,
      duration: duration,
      action: action,
    );
  }

  void hideSnackBar() {
    SnackBarHelper.hide(this);
  }

  void clearAllSnackBars() {
    SnackBarHelper.clearAll(this);
  }
}