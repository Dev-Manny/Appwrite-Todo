import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/registration/registration_bloc.dart';
import '../resources/user_repository.dart';
import '../screens/registration.dart';

class RegistrationScreen extends StatelessWidget {
  final UserRepository _userRepository;
  final String name;
  final String phoneNumber;

  RegistrationScreen(
      {Key key,
      @required UserRepository userRepository,
      this.name,
      this.phoneNumber})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(
              userRepository: _userRepository,
           ),
          child: Registration(
              userRepository: _userRepository,
              name: name,
              phoneNumber: phoneNumber),
        ),
      ),
    );
  }
}
