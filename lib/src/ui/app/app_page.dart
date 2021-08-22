import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_map/src/domain/bloc/app_cubit.dart';
import 'package:test_map/src/domain/bloc/authentication/authentication.dart';
import 'package:test_map/src/domain/bloc/error_handle_cubit.dart';
import 'package:test_map/src/domain/bloc/loading_cubit.dart';
import 'package:test_map/src/domain/repository/auth.dart';
import 'package:test_map/src/domain/repository/user.dart';
import 'package:test_map/src/ui/home/home_page.dart';
import 'package:test_map/src/widgets/image_loader.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.authenticationRepository})
      : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationRepository: authenticationRepository,
                userRepository: UserRepository()),
          ),
          BlocProvider(create: (context) => ErrorHandlerCubit())
        ],
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingCubit(),
      child: ImageLoader(
        child: MaterialApp(
            // localizationsDelegates: [
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            debugShowCheckedModeBanner: false,
            navigatorKey: _navigatorKey,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: GoogleFonts.ralewayTextTheme(),
              appBarTheme: AppBarTheme(
                  brightness: Brightness.light,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  textTheme: TextTheme(
                    headline6: GoogleFonts.ralewayTextTheme()
                        .headline6!
                        .copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                  ),
                  toolbarTextStyle: TextStyle(color: Colors.black),
                  titleTextStyle: TextStyle(color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black)),
              primaryColor: Color(0xFF1940FF),
              backgroundColor: Color(0xffbbdefb),
            ),
            builder: (context, child) {
              return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => AppCubit(),
                    ),
                  ],
                  child: BlocListener<ErrorHandlerCubit, ErrorType>(
                    listener: (context, state) {
                      var text = '';
                      switch (state) {
                        case ErrorType.wrongCredentials:
                          text = 'Неправильная почта или пароль';
                          break;
                        case ErrorType.serverError:
                          text = 'Произошла ошибка, попробуйте позднее';
                          break;
                        case ErrorType.noError:
                          text = '';
                          break;
                      }
                      if (text.isNotEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text(text, style: TextStyle(color: Colors.black)),
                          behavior: SnackBarBehavior.floating,
                          margin: const EdgeInsets.all(10),
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(16),
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ));
                      }
                    },
                    child:
                        BlocListener<AuthenticationBloc, AuthenticationState>(
                            listener: (context, state) {
                              switch (state.status) {
                                case AuthenticationStatus.authenticated:
                                  context
                                      .read<AppCubit>()
                                      .updateUser(state.user, false);
                                  _navigator.pushAndRemoveUntil<void>(
                                    HomePage.route(),
                                    (route) => false,
                                  );
                                  break;
                                case AuthenticationStatus.unauthenticated:
                                  _navigator.pushAndRemoveUntil<void>(
                                    HomePage.route(),
                                    (route) => false,
                                  );
                                  break;
                                default:
                                  _navigator.pushAndRemoveUntil<void>(
                                    HomePage.route(),
                                    (route) => false,
                                  );
                                  break;
                              }
                            },
                            child: child!),
                  ));
            },
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Scaffold(
                      body: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ))),
      ),
    );
  }
}
