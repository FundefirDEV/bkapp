import 'package:flutter/material.dart';
import 'package:bkapp_flutter/core/bloc/blocs.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:bkapp_flutter/core/services/repositories/http_repositories.dart';
import 'package:bkapp_flutter/src/screens/screens.dart';

Widget loginRouteBloc() {
  return MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => AuthenticationBloc(
          loginRepository: loginRepository
        )..add(AppStarted()),
      ),
      BlocProvider<LoginFormBloc>(
        create: (context) => LoginFormBloc(
          repository: loginRepository,
          authenticationBloc: context.bloc<AuthenticationBloc>()
        ),
      )
    ],
    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationUninitialized) {
          return SplashPage();
        }
        if (state is AuthenticationAuthenticated) {
          return HomeTestScreen(title: 'Home DATA',);
        }
        if (state is AuthenticationUnauthenticated) {
          return LoginScreen();
        }
        if (state is AuthenticationLoading) {
          return LoadingIndicatorScreen();
        }
      }
    ),
  );
}
