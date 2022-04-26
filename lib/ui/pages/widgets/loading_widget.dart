import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isTranspraent;

  const LoadingWidget({Key? key, this.isTranspraent = false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: isTranspraent ? Colors.transparent : Color.fromRGBO(0, 0, 0, 0.4),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
