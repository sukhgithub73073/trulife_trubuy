import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trubuy/all_enums/user_type_enum.dart';
import 'package:trubuy/components/tap_widget.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/data/blocs/user_type_bloc/user_type_bloc.dart';
import 'package:trubuy/route/route_constants.dart';

import 'components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_dark.png",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back TruBuy Online",
                    style: Theme.of(context).textTheme.headlineSmall!
                        .copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Log in with your data that you intered during your registration.",
                  ),
                  const SizedBox(height: defaultPadding),
                  LogInForm(formKey: _formKey),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text("Forgot password"),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, passwordRecoveryScreenRoute);
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height > 700
                        ? size.height * 0.01
                        : defaultPadding * 0.5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            entryPointScreenRoute,
                            ModalRoute.withName(logInScreenRoute));
                      }
                    },
                    child: const Text("Log in"),
                  ),
                  const SizedBox(height: defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      dividerLine(),
                      socialIconButton(
                          () {}, "assets/images/facebook_logo.png"),
                      FutureBuilder(
                        builder: (context, snapshot) {
                          return socialIconButton(
                              () async {}, "assets/images/google_sign.png");
                        },
                        future: null,
                      ),
                      Platform.isIOS
                          ? socialIconButton(
                              () {}, "assets/images/apple_logo.png")
                          : const SizedBox.shrink(),
                      dividerLine(),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TapWidget(
                          onTap: () {
                            context.read<UserTypeBloc>().add(
                                ChangeUserTypeEvent(
                                    type: UserTypeEnum.Vendor.name));
                            Navigator.pushNamed(context, signUpScreenRoute);
                          },
                          child: Text(
                            "Become  a  Vendor",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // const SizedBox(height: defaultPadding),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TapWidget(
                          onTap: () {
                            context.read<UserTypeBloc>().add(
                                ChangeUserTypeEvent(
                                    type: UserTypeEnum.Vendor.name));
                            Navigator.pushNamed(context, signUpScreenRoute);
                          },
                          child: Text(
                            "Become  a  TruOrder",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?"),
            TextButton(
              onPressed: () {
                context
                    .read<UserTypeBloc>()
                    .add(ChangeUserTypeEvent(type: UserTypeEnum.User.name));
                Navigator.pushNamed(context, signUpScreenRoute);
              },
              child: const Text("Sign up"),
            )
          ],
        ),
      ),
    );
  }

  Widget socialIconButton(VoidCallback onClick, String iconPath) {
    return IconButton(
        onPressed: onClick,
        icon: Image.asset(
          iconPath,
        ));
  }

  Widget dividerLine() {
    return Container(
      height: 1,
      width: 30,
      color: blackColor,
    );
  }
}
