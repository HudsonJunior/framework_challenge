import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginIdleState());

  void login() async {
    emit(LoginLoadingState());
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

    final user = await _googleSignIn.signIn();

    if (user == null) return emit(LoginFailedState());

    emit(LoginSuccessState(user: user));
  }

  void logout() async {
    emit(LoginIdleState());

    GoogleSignIn().signOut();
  }
}
