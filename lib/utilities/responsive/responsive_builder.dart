import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, BoxConstraints constraints, DeviceType deviceType)? builder;
  final Widget Function(BuildContext context, BoxConstraints constraints)? mobile;
  final Widget Function(BuildContext context, BoxConstraints constraints)? tablet;
  final Widget Function(BuildContext context, BoxConstraints constraints)? desktop;

  const ResponsiveBuilder({
    super.key,
    this.builder,
    this.mobile,
    this.tablet,
    this.desktop,
  }) : assert(
  builder != null || mobile != null,
  'Either builder or mobile must be provided',
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final deviceType = _getDeviceType(constraints.maxWidth);

        // If builder is provided, use it
        if (builder != null) {
          return builder!(context, constraints, deviceType);
        }

        // Otherwise use specific builders
        switch (deviceType) {
          case DeviceType.desktop:
            if (desktop != null) {
              return desktop!(context, constraints);
            }
            continue tablet;
          tablet:
          case DeviceType.tablet:
            if (tablet != null) {
              return tablet!(context, constraints);
            }
            continue mobile;
          mobile:
          case DeviceType.mobile:
            return mobile!(context, constraints);
        }
      },
    );
  }

  static DeviceType _getDeviceType(double width) {
    if (width >= 1200) return DeviceType.desktop;
    if (width >= 600) return DeviceType.tablet;
    return DeviceType.mobile;
  }
}

/// Device type enum
enum DeviceType {
  mobile,
  tablet,
  desktop;

  bool get isMobile => this == DeviceType.mobile;
  bool get isTablet => this == DeviceType.tablet;
  bool get isDesktop => this == DeviceType.desktop;
}