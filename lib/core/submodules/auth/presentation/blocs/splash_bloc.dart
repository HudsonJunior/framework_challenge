import 'package:bloc/bloc.dart';
import 'package:framework_test/core/submodules/firebase/firebase.dart';

part 'splash_state.dart';

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(SplashIdleState());

  void initializeApp() async {
    emit(SplashInitializingApp());

    await FirebaseService.initializeFirebase();

    // Just for UI puporse
    await Future.delayed(const Duration(seconds: 2));

    emit(SplashAppInitialized());
  }
}
