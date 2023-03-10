import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';

Widget loginRouteBloc() {
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => context.read<AppBloc>().authenticationBloc,
      ),
      BlocProvider<LoginFormBloc>(
        create: (context) => LoginFormBloc(
            repository: loginRepository,
            authenticationBloc: context.read<AppBloc>().authenticationBloc),
      )
    ],
    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationUninitialized) {
        return SplashPage();
      }
      if (state is AuthenticationAuthenticated) {
        return MenuNavigatorScreen(
          tokenUser: state.token,
          userName: state.userName,
          role: state.role,
          partnerId: state.partnerId
        );
      }
      if (state is AuthenticationUnauthenticated) {
        return LoginScreen();
      }
      if (state is AuthenticationLoading) {
        return LoadingIndicatorScreen();
      }
      return null;
    }),
  );
}
