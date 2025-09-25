import 'package:flutter/material.dart';
import 'package:karachi_biennale/presentation/about/about_view.dart';
import 'package:karachi_biennale/presentation/artist/artist_view.dart';
import 'package:karachi_biennale/presentation/event/my_event_view.dart';
import 'package:karachi_biennale/presentation/forgot/forgot_password_view.dart';
import 'package:karachi_biennale/presentation/home/home_view.dart';
import 'package:karachi_biennale/presentation/login/login_view.dart';
import 'package:karachi_biennale/presentation/program/program_detail/program_detail_view.dart';
import 'package:karachi_biennale/presentation/program/program_dropdown/program_view.dart';
import 'package:karachi_biennale/presentation/register/register_view.dart';
import 'package:karachi_biennale/presentation/search/search_view.dart';
import 'package:karachi_biennale/presentation/splash/splash_view.dart';
import 'package:karachi_biennale/presentation/venues/venue/venue_view.dart';
import 'package:karachi_biennale/presentation/venues/venue_detail/venue_detail_view.dart';
import 'package:karachi_biennale/presentation/venues/venue_full_image/venues_full_image_view.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.id:
        return MaterialPageRoute(builder: (_) => SplashView());
      case LoginView.id:
        return PageTransition(child: LoginView(), type: PageTransitionType.rightToLeft);
      case RegisterView.id:
        return PageTransition(child: RegisterView(), type: PageTransitionType.rightToLeft);
      case ForgotPasswordView.id:
        return PageTransition(child: ForgotPasswordView(), type: PageTransitionType.rightToLeft);
      case HomeView.id:
        return PageTransition(child: HomeView(), type: PageTransitionType.rightToLeft);
      case MyEventView.id:
        return PageTransition(child: MyEventView(), type: PageTransitionType.rightToLeft);
      case AboutView.id:
        return PageTransition(child: AboutView(), type: PageTransitionType.rightToLeft);
      case SearchView.id:
        return PageTransition(child: SearchView(), type: PageTransitionType.rightToLeft);
      case VenueView.id:
        return PageTransition(child: VenueView(), type: PageTransitionType.rightToLeft);
      case VenueDetailView.id:
        String args = settings.arguments as String;
        return PageTransition(child: VenueDetailView(venueId: args,), type: PageTransitionType.rightToLeft);
      case VenuesFullImageView.id:
        return PageTransition(child: VenuesFullImageView(), type: PageTransitionType.rightToLeft);
      case ProgramView.id:
        return PageTransition(child: ProgramView(), type: PageTransitionType.rightToLeft);
      case ProgramDetailView.id:
        final args = settings.arguments as String;
        return PageTransition(child: ProgramDetailView(programId: args,), type: PageTransitionType.rightToLeft);
      case ArtistView.id:
        return PageTransition(child: ArtistView(), type: PageTransitionType.rightToLeft);
      default:
        return error();
    }
  }

  static Route<dynamic> error() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(appBar: AppBar(title: Text("Error")));
      },
    );
  }
}
