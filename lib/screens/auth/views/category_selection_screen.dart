import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trubuy/components/skleton/others/discover_categories_skelton.dart';
import 'package:trubuy/components/tap_widget.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/data/blocs/category_bloc/category_bloc.dart';
import 'package:trubuy/extension/app_extension.dart';
import 'package:trubuy/models/category_model.dart';
import 'package:trubuy/screens/auth/views/plan_selection_screen.dart';
import 'package:trubuy/screens/discover/views/components/expansion_category.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
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

            BlocConsumer<CategoryBloc, CategoryState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state is CategoryLoading
                    ? Expanded(
                        child: DiscoverCategoriesSkelton(),
                      )
                    : state is CategoryLoaded
                        ? Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 2,
                                      mainAxisExtent: 100),
                              itemCount: state.categoryList.length,
                              itemBuilder: (context, index) {
                                return TapWidget(
                                  onTap: (){
                                    context.read<CategoryBloc>().add(TapCategoryEvent(list: state.categoryList, index: index)) ;
                                  },
                                  child: Container(
                                    height: 100,
                                    padding: const EdgeInsets.all(5),
                                    margin: EdgeInsets.all(5),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border:
                                          (state.categoryList[index].isSelect ??
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
                                        "${state.categoryList[index].categoryName}",
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
            context.pushScreen(nextScreen: PlanSelectionScreen()) ;
          },
          child: const Text("Continue"),
        ),
      ),
    );
  }
}
