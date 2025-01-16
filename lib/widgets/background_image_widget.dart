import 'package:flutter/cupertino.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/painel.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.5),
      ),
      child: child,
    );
  }
}
