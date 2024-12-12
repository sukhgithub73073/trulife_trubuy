import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/extension/app_extension.dart';
import 'package:trubuy/screens/auth/views/category_selection_screen.dart';

class VendorStoreScreen extends StatefulWidget {
  const VendorStoreScreen({super.key});

  @override
  State<VendorStoreScreen> createState() => _VendorStoreScreenState();
}

class _VendorStoreScreenState extends State<VendorStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/signUp_dark.png",
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Store Information",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: defaultPadding / 2),
                  const Text(
                    "Provide detailed information about your store ",
                  ),
                  const SizedBox(height: defaultPadding),
                  Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onSaved: (name) {},
                        validator: emaildValidator.call,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Store name",
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
                          hintText: "GSIN number",
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
                          hintText: "Complete address",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding * 0.75),
                            child: SvgPicture.asset(
                              "assets/icons/Address.svg",
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
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Location.svg",
                            height: 20,
                            width: 20,
                            colorFilter: ColorFilter.mode(
                              Colors.blue,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Use Corrent location",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(height: defaultPadding * 2),
                  ElevatedButton(
                    onPressed: () {
                      context.pushScreen(nextScreen: CategorySelectionScreen());
                    },
                    child: const Text("Continue"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
