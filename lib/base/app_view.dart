import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karachi_biennale/constants/app_colors.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_controller.dart';
import 'package:karachi_biennale/presentation/artist/controller/artist_id_controller.dart';
import 'package:karachi_biennale/presentation/event/controller/my_event_controller.dart';
import 'package:karachi_biennale/presentation/forgot/controller/forget_password_controller.dart';
import 'package:karachi_biennale/presentation/home/controller/logout_controller.dart';
import 'package:karachi_biennale/presentation/home/controller/user_controller.dart';
import 'package:karachi_biennale/presentation/login/controller/login_controller.dart';
import 'package:karachi_biennale/presentation/program/controller/program_controller.dart';
import 'package:karachi_biennale/presentation/program/controller/program_detailed_controller.dart';
import 'package:karachi_biennale/presentation/register/controller/signup_controller.dart';
import 'package:karachi_biennale/presentation/splash/splash_view.dart';
import 'package:karachi_biennale/presentation/venues/controller/venue_controller.dart';
import 'package:karachi_biennale/presentation/venues/controller/venue_detail_controller.dart';
import 'package:karachi_biennale/route_generator.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyEventController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => ForgetPasswordController()),
        ChangeNotifierProvider(create: (_) => LogoutController()),
        ChangeNotifierProvider(create: (_) => ArtistController()),
        ChangeNotifierProvider(create: (_) => ProgramController()),
        ChangeNotifierProvider(create: (_) => VenueController()),
        ChangeNotifierProvider(create: (_) => UserController()),
        ChangeNotifierProvider(create: (_) => VenueDetailController()),
        ChangeNotifierProvider(create: (_) => ArtistIdController()),
        ChangeNotifierProvider(create: (_) => ProgramDetailedController()),
      ],
      child: MaterialApp(
        initialRoute: SplashView.id,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.whiteColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          ),
        ),
      ),
    );
  }
}
