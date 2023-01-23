import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/di_container.dart';
import 'package:frontend/widgets/app_card.dart';

import 'bloc/send_bloc.dart';
import 'send_form.dart';

class SendPage extends StatelessWidget implements AutoRouteWrapper {
  final phoneCtrl = TextEditingController();
  final textCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SendBloc>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gammu Admin'),
      ),
      body: BlocBuilder<SendBloc, SendState>(
        bloc: bloc,
        builder: (context, state) {
          final Widget? header;
          if (state is Error) {
            header = Text(
              state.message,
              style: const TextStyle(color: Colors.red),
            );
          } else {
            if (state is Sent) {
              header = const Text(
                'The message has been sent',
                style: TextStyle(color: Colors.green),
              );
            } else {
              header = null;
            }
          }

          return Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              if (state is Loading)
                const LinearProgressIndicator(
                  minHeight: 5,
                  color: Colors.indigo,
                ),
              AppCard(
                child: SendForm(
                  formKey: formKey,
                  phoneCtrl: phoneCtrl,
                  header: header,
                  textCtrl: textCtrl,
                  onPressed: () => onPressed(bloc),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void onPressed(SendBloc bloc) {
    if (formKey.currentState == null) return;
    if (formKey.currentState!.validate()) {
      bloc.add(Send(
        phone: phoneCtrl.text,
        text: textCtrl.text,
      ));
    }
  }

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<SendBloc>(),
        child: this,
      );
}
