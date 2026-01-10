import 'package:flutter/material.dart';
import 'responsive_builder.dart';


class Responsive {
  Responsive._();

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1200;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  static EdgeInsets safePadding(BuildContext context) =>
      MediaQuery.of(context).padding;

  static double safeHeight(BuildContext context) {
    final mq = MediaQuery.of(context);
    return mq.size.height - mq.padding.top - mq.padding.bottom;
  }

  static double safeWidth(BuildContext context) {
    final mq = MediaQuery.of(context);
    return mq.size.width - mq.padding.left - mq.padding.right;
  }

  static bool isMobile(BuildContext context) =>
      screenWidth(context) < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= mobileBreakpoint &&
          screenWidth(context) < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      screenWidth(context) >= tabletBreakpoint;

  static DeviceType deviceType(BuildContext context) {
    final width = screenWidth(context);
    if (width >= tabletBreakpoint) return DeviceType.desktop;
    if (width >= mobileBreakpoint) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  static double percentWidth(BuildContext context, double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return screenWidth(context) * (percent / 100);
  }

  static double percentHeight(BuildContext context, double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return screenHeight(context) * (percent / 100);
  }

  static double percentSafeWidth(BuildContext context, double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return safeWidth(context) * (percent / 100);
  }

  static double percentSafeHeight(BuildContext context, double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return safeHeight(context) * (percent / 100);
  }

  static const int horizontalBlocks = 12;
  static const int verticalBlocks = 12;

  static double blockWidth(BuildContext context) =>
      screenWidth(context) / horizontalBlocks;

  static double blockHeight(BuildContext context) =>
      screenHeight(context) / verticalBlocks;

  static double scaledFontSize(BuildContext context, double baseFontSize) {
    final width = screenWidth(context);
    const double baseWidth = 375.0;
    final scale = width / baseWidth;
    return baseFontSize * scale;
  }

  static T value<T>(
      BuildContext context, {
        required T mobile,
        T? tablet,
        T? desktop,
      }) {
    if (isDesktop(context)) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet(context)) {
      return tablet ?? mobile;
    }
    return mobile;
  }
}
