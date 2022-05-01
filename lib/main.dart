import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:framework_test/core/auth/presentation/blocs/login_bloc.dart';
import 'package:framework_test/core/auth/presentation/blocs/splash_bloc.dart';
import 'package:framework_test/core/auth/presentation/screens/splash_screen.dart';
import 'package:framework_test/core/resources/global_context.dart';
import 'package:framework_test/modules/cart/presentation/blocs/cart_cubit.dart';
import 'package:framework_test/modules/cart/presentation/blocs/checkout_cubit.dart';
import 'package:framework_test/modules/cart/usecases/checkout_usecase.dart';
import 'package:framework_test/modules/home/data/datasources/mock_item_data_source.dart';
import 'package:framework_test/modules/home/data/repositories/item_repository.dart';
import 'package:framework_test/modules/home/domain/usecases/item_usecase.dart';
import 'package:framework_test/modules/home/presentation/blocs/item_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemCubit>(
          create: (_) => ItemCubit(
            ItemUsecase(
              itemRepository: ItemRepository(
                mockItemDataSource: MockItemDataSource(),
              ),
            ),
          ),
        ),
        BlocProvider<CartCubit>(
          create: (_) => CartCubit(),
        ),
        BlocProvider<CheckoutCubit>(
          create: (_) => CheckoutCubit(CheckoutUseCase()),
        ),
        BlocProvider<SplashBloc>(
          create: (_) => SplashBloc()..initializeApp(),
        ),
        BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Framework Digital App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('pt', ''),
        ],
        navigatorKey: GlobalContext.globalKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
