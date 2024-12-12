import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trubuy/components/skleton/others/discover_categories_skelton.dart';
import 'package:trubuy/components/tap_widget.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/data/blocs/plan_bloc/plan_bloc.dart';
import 'package:trubuy/extension/app_extension.dart';
import 'package:trubuy/screens/auth/views/waiting_screen.dart';

class PlanSelectionScreen extends StatefulWidget {
  const PlanSelectionScreen({super.key});

  @override
  State<PlanSelectionScreen> createState() =>
      _PlanSelectionScreenState();
}

class _PlanSelectionScreenState extends State<PlanSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Category",
          maxLines: 2,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            BlocConsumer<PlanBloc, PlanState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state is PlanLoading
                    ? Expanded(
                  child: DiscoverCategoriesSkelton(),
                )
                    : state is PlanLoaded
                    ? Expanded(
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        mainAxisExtent: 100),
                    itemCount: state.planList.length,
                    itemBuilder: (context, index) {
                      return TapWidget(
                        onTap: (){

                        },
                        child: Container(
                          height: 100,
                          padding: const EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border:
                            (state.planList[index].isSelect ??
                                false)
                                ? Border.all(color: Colors.red)
                                : null,
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.035),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(defaultBorderRadious)),
                          ),
                          child: Center(
                            child: Text(
                              "${state.planList[index].title}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          onPressed: () {
            context.pushScreen(nextScreen: WaitingScreen());
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
