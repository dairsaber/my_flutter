import 'package:flutter/material.dart';

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
                //让 maxWidth 使用屏幕宽度
                maxWidth: constraints.maxWidth),
            child: child,
          ),
        );
      },
    );
  }
}
