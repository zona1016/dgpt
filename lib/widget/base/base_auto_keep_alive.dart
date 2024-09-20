import 'package:flutter/material.dart';

class BaseAutomaticKeepAlive extends StatefulWidget {
  final Widget child;

  const BaseAutomaticKeepAlive({
    super.key,
    required this.child,
  });

  @override
  State<BaseAutomaticKeepAlive> createState() => BaseAutomaticKeepAliveState();
}

class BaseAutomaticKeepAliveState extends State<BaseAutomaticKeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
