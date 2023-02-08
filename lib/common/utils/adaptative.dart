import 'package:flutter/widgets.dart';

enum DisplayType { mobile, desktop }

abstract class AdaptativeStatelessWidget extends StatelessWidget {
  const AdaptativeStatelessWidget({
    super.key,
    required this.displayType,
  });

  final DisplayType displayType;

  Widget buildMobile(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (displayType == DisplayType.mobile) {
      return buildMobile(context);
    } else {
      return buildDesktop(context);
    }
  }
}

abstract class AdaptativeState<T extends StatefulWidget> extends State<T> {
  AdaptativeState({
    required this.displayType,
  });

  final DisplayType displayType;

  Widget buildMobile(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (displayType == DisplayType.mobile) {
      return buildMobile(context);
    } else {
      return buildDesktop(context);
    }
  }
}

bool isSmallScreen(BuildContext context) {
  return (MediaQuery.of(context).size.width < 992);
}

abstract class AdaptativeScreen extends StatelessWidget {
  const AdaptativeScreen({super.key});

  Widget buildMobile(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (isSmallScreen(context)) {
      return buildMobile(context);
    } else {
      return buildDesktop(context);
    }
  }
}

abstract class AdaptativeScreenState<T extends StatefulWidget>
    extends State<T> {
  Widget buildMobile(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (isSmallScreen(context)) {
      return buildMobile(context);
    } else {
      return buildDesktop(context);
    }
  }
}
