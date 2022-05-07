import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/submodules/auth/presentation/blocs/splash_bloc.dart';
import 'package:framework_test/core/submodules/auth/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (_, state) {
        if (state is SplashAppInitialized) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      },
      child: Scaffold(
        body: Hero(
          tag: 'splash_image',
          child: Image.asset(
            'assets/framework.jpg',
            fit: BoxFit.fill,
            height: double.infinity,
          ),
        ),
      ),
    );
  }
}
