import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 849;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 850 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= 1200) {
      return desktop;
    } else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

enum DeviceType { desktop, tablet, mobile }

DeviceType getDeviceType(BuildContext context) {
  if (Responsive.isDesktop(context)) {
    return DeviceType.desktop;
  } else if (Responsive.isTablet(context)) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}
