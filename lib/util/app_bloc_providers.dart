import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trubuy/all_enums/theme_enum.dart';
import 'package:trubuy/data/blocs/bookmark_bloc/bookmark_bloc.dart';
import 'package:trubuy/data/blocs/category_bloc/category_bloc.dart';
import 'package:trubuy/data/blocs/plan_bloc/plan_bloc.dart';
import 'package:trubuy/data/blocs/product_bloc/product_bloc.dart';
import 'package:trubuy/data/blocs/theme_bloc/theme_bloc.dart';
import 'package:trubuy/data/blocs/user_type_bloc/user_type_bloc.dart';

class AppBlocProvider extends StatelessWidget {
  final Widget child;
  final bool lazy;
//ddd
  const AppBlocProvider({
    Key? key,
    required this.child,
    this.lazy = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(lazy: lazy, create: (_) => UserTypeBloc()),
        BlocProvider(
            lazy: lazy, create: (_) => BookmarkBloc()..add(GetBookmarkEvent())),
        BlocProvider(
            lazy: lazy,
            create: (_) =>
                ThemeBloc()..add(ChangeThemeEvent(themeEnum: ThemeEnum.light))),
        BlocProvider(
            lazy: lazy, create: (_) => PlanBloc()..add(GetPlanEvent())),
        BlocProvider(
            lazy: lazy, create: (_) => CategoryBloc()..add(GetCategoryEvent())),
        BlocProvider(
            lazy: lazy,
            create: (_) => ProductBloc()
              ..add(
                  GetProductEvent(map: {"type": "shirt", "category_id": ""}))),
      ],
      child: child,
    );
  }
}
