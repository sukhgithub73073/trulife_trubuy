import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trubuy/all_enums/user_type_enum.dart';
import 'package:trubuy/components/tap_widget.dart';
import 'package:trubuy/data/blocs/user_type_bloc/user_type_bloc.dart';

import '../../../../constants.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  void initState() {
    super.initState();
    // context
    //     .read<UserTypeBloc>()
    //     .add(ChangeUserTypeEvent(type: UserTypeEnum.User.name));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: BlocConsumer<UserTypeBloc, UserTypeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      TapWidget(
                        onTap: () {
                          context.read<UserTypeBloc>().add(ChangeUserTypeEvent(
                              type: UserTypeEnum.User.name));
                        },
                        child: Container(
                            width: 100,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: state is UserTypeUser
                                    ? primaryColor
                                    : transparentColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "User",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      color: state is UserTypeUser
                                          ? whiteColor
                                          : blackColor,
                                    ),
                              ),
                            )),
                      ),
                      TapWidget(
                        onTap: () {
                          context.read<UserTypeBloc>().add(ChangeUserTypeEvent(
                              type: UserTypeEnum.Vendor.name));
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: state is UserTypeVendor
                                  ? primaryColor
                                  : transparentColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Vendor",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: state is UserTypeVendor
                                        ? whiteColor
                                        : blackColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      // TapWidget(
                      //   onTap: () {
                      //     context.read<UserTypeBloc>().add(ChangeUserTypeEvent(
                      //         type: UserTypeEnum.TruOrder.name));
                      //   },
                      //   child: Container(
                      //     width: 100,
                      //     padding: EdgeInsets.all(10),
                      //     decoration: BoxDecoration(
                      //         color: state is UserTypeTruOrder
                      //             ? primaryColor
                      //             : transparentColor,
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: Center(
                      //       child: Text(
                      //         "TruOrder",
                      //         style: Theme.of(context)
                      //             .textTheme
                      //             .titleMedium!
                      //             .copyWith(
                      //               color: state is UserTypeVendor
                      //                   ? whiteColor
                      //                   : blackColor,
                      //             ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      TapWidget(
                        onTap: () {
                          context.read<UserTypeBloc>().add(ChangeUserTypeEvent(
                              type: UserTypeEnum.Ryder.name));
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: state is UserTypeRyder
                                  ? primaryColor
                                  : transparentColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Rider",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: state is UserTypeRyder
                                        ? whiteColor
                                        : blackColor,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              if (state is! UserTypeUser) ...[
                TextFormField(
                  onSaved: (name) {},
                  validator: emaildValidator.call,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Invite Code",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding * 0.75),
                      child: SvgPicture.asset(
                        "assets/icons/Gift.svg",
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.3),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding),
              ],
              TextFormField(
                onSaved: (name) {},
                validator: emaildValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Full name",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/Profile.svg",
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                onSaved: (name) {},
                validator: emaildValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Mobile number",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/Call.svg",
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                onSaved: (emal) {},
                validator: emaildValidator.call,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email address",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/Message.svg",
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              TextFormField(
                onSaved: (pass) {
                  // Password
                },
                validator: passwordValidator.call,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75),
                    child: SvgPicture.asset(
                      "assets/icons/Lock.svg",
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .color!
                            .withOpacity(0.3),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
