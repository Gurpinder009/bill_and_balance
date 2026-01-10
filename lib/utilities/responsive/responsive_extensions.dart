
import 'package:flutter/material.dart';
import 'responsive_builder.dart';
import 'responsive.dart';

/// Extension methods for easy responsive access
extension ResponsiveContext on BuildContext {
  // Screen dimensions
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  Size get screenSize => MediaQuery.of(this).size;
  Orientation get orientation => MediaQuery.of(this).orientation;

  // Safe area
  EdgeInsets get safePadding => MediaQuery.of(this).padding;
  double get safeHeight {
    final mq = MediaQuery.of(this);
    return mq.size.height - mq.padding.top - mq.padding.bottom;
  }
  double get safeWidth {
    final mq = MediaQuery.of(this);
    return mq.size.width - mq.padding.left - mq.padding.right;
  }

  // Device type
  bool get isMobile => screenWidth < Responsive.mobileBreakpoint;
  bool get isTablet =>
      screenWidth >= Responsive.mobileBreakpoint &&
          screenWidth < Responsive.tabletBreakpoint;
  bool get isDesktop => screenWidth >= Responsive.tabletBreakpoint;

  DeviceType get deviceType {
    if (screenWidth >= Responsive.tabletBreakpoint) return DeviceType.desktop;
    if (screenWidth >= Responsive.mobileBreakpoint) return DeviceType.tablet;
    return DeviceType.mobile;
  }

  // Percentage sizing
  double percentWidth(double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return screenWidth * (percent / 100);
  }

  double percentHeight(double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return screenHeight * (percent / 100);
  }

  double percentSafeWidth(double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return safeWidth * (percent / 100);
  }

  double percentSafeHeight(double percent) {
    assert(percent >= 0 && percent <= 100, 'Percent must be between 0 and 100');
    return safeHeight * (percent / 100);
  }

  // Responsive value
  T responsiveValue<T>({
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    if (isDesktop) {
      return desktop ?? tablet ?? mobile;
    } else if (isTablet) {
      return tablet ?? mobile;
    }
    return mobile;
  }

  // Scaled font size
  double scaledFontSize(double baseFontSize) {
    const double baseWidth = 375.0;
    final scale = screenWidth / baseWidth;
    return baseFontSize * scale;
  }
}
