import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/di_container.dart';
import 'package:frontend/pages/login/bloc/login_bloc.dart';
import 'package:frontend/pages/login/widgets/login_form.dart';
import 'package:frontend/widgets/app_card.dart';

class LoginPage extends StatelessWidget implements AutoRouteWrapper {
  final void Function(bool) onResult;
  final loginCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  LoginPage({Key? key, required this.onResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gammu Admin'),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: bloc,
        builder: (context, state) {
          return Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              if (state is Loading)
                const LinearProgressIndicator(
                  minHeight: 5,
                  color: Colors.indigo,
                ),
              AppCard(
                child: LoginForm(
                  formKey: formKey,
                  loginCtrl: loginCtrl,
                  error: (state is Error) ? state.message : null,
                  passwordCtrl: passwordCtrl,
                  onPressed: () => onPressed(bloc),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onPressed(LoginBloc bloc) {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {
      bloc.add(Login(
        login: loginCtrl.text,
        password: passwordCtrl.text,
        onResult: onResult,
      ));
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: this,
      );
}
