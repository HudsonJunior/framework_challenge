import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/submodules/auth/presentation/blocs/login_bloc.dart';
import 'package:framework_test/core/submodules/auth/presentation/widgets/google_button.dart';
import 'package:framework_test/modules/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginBloc loginBloc;

  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        if (state is LoginSuccessState) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Column(
          children: [
            Hero(
              tag: 'splash_image',
              child: Image.asset(
                'assets/framework.jpg',
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purpleAccent,
                      Colors.purple,
                      Colors.deepPurple,
                      Colors.deepPurpleAccent,
                    ],
                  ),
                ),
                child: GoogleSignInButton(
                  onPress: () {
                    loginBloc.login();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
