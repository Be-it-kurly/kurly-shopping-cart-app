import 'package:flutter/material.dart';

import '../theme/sizes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/shopping_cart.png',
            height: 200,
          ),
        ),
      ),
    );
  }
}
