
import 'package:flutter/widgets.dart';

bool isSmallScreen(BuildContext context) {
  return (MediaQuery.of(context).size.width < 600);
}

abstract class AdaptativeStatelessWidget extends StatelessWidget {
  const AdaptativeStatelessWidget({super.key});

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

abstract class AdaptativeState<T extends StatefulWidget> extends State<T> {
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