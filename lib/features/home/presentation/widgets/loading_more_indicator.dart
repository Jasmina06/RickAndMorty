import 'package:flutter/material.dart';

class LoadingMoreIndicator extends StatelessWidget {
  const LoadingMoreIndicator();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: CircularProgressIndicator(
          color: Color(0xFF5C6BC0),
        ),
      ),
    );
  }
}
