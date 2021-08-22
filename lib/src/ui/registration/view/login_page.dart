import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_map/src/domain/repository/auth.dart';
import 'package:test_map/src/ui/registration/cubit/login_cubit.dart';

import 'login_form.dart';

class RegistrationPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => RegistrationPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: RegistrationForm(),
    );
  }
}
