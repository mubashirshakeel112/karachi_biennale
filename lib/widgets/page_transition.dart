// // import 'package:flutter/cupertino.dart';
// //
// // class PageTransition {
// //   static transition(Widget views) {
// //     return PageRouteBuilder(
// //       pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
// //         return views;
// //       },
// //       transitionDuration: Duration(milliseconds: 300),
// //       transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
// //         var begin = Offset(1, 0);
// //         var end = Offset.zero;
// //         var curve = Curves.ease;
// //         var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
// //         var offsetAnimation = animation.drive(tween);
// //         return SlideTransition(position: offsetAnimation, child: child,);
// //       }
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// /// A professional page transition utility class that provides smooth,
// /// customizable page transitions for Flutter applications.
// class PageTransition {
//   /// Creates a slide transition that slides the new page in from the right.
//   ///
//   /// [page] - The widget/page to transition to
//   /// [duration] - Duration of the transition animation (default: 300ms)
//   /// [curve] - Animation curve to use (default: Curves.easeInOut)
//   /// [direction] - Direction of the slide transition (default: right to left)
//   static PageRouteBuilder<T> slideTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//         SlideDirection direction = SlideDirection.rightToLeft,
//       }) {
//     return PageRouteBuilder<T>(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionDuration: duration,
//       reverseTransitionDuration: duration,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final begin = _getBeginOffset(direction);
//         const end = Offset.zero;
//
//         final tween = Tween(begin: begin, end: end)
//             .chain(CurveTween(curve: curve));
//         final offsetAnimation = animation.drive(tween);
//
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//     );
//   }
//
//   /// Creates a fade transition between pages.
//   ///
//   /// [page] - The widget/page to transition to
//   /// [duration] - Duration of the transition animation (default: 300ms)
//   /// [curve] - Animation curve to use (default: Curves.easeInOut)
//   static PageRouteBuilder<T> fadeTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//       }) {
//     return PageRouteBuilder<T>(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionDuration: duration,
//       reverseTransitionDuration: duration,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final fadeAnimation = animation.drive(
//           Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve)),
//         );
//
//         return FadeTransition(
//           opacity: fadeAnimation,
//           child: child,
//         );
//       },
//     );
//   }
//
//   /// Creates a scale transition that scales the new page in.
//   ///
//   /// [page] - The widget/page to transition to
//   /// [duration] - Duration of the transition animation (default: 300ms)
//   /// [curve] - Animation curve to use (default: Curves.easeInOut)
//   static PageRouteBuilder<T> scaleTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//       }) {
//     return PageRouteBuilder<T>(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionDuration: duration,
//       reverseTransitionDuration: duration,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final scaleAnimation = animation.drive(
//           Tween(begin: 0.8, end: 1.0).chain(CurveTween(curve: curve)),
//         );
//
//         return ScaleTransition(
//           scale: scaleAnimation,
//           child: child,
//         );
//       },
//     );
//   }
//
//   /// Creates a combined slide and fade transition for a more polished effect.
//   ///
//   /// [page] - The widget/page to transition to
//   /// [duration] - Duration of the transition animation (default: 300ms)
//   /// [curve] - Animation curve to use (default: Curves.easeInOut)
//   /// [direction] - Direction of the slide transition (default: right to left)
//   static PageRouteBuilder<T> slideFadeTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//         SlideDirection direction = SlideDirection.rightToLeft,
//       }) {
//     return PageRouteBuilder<T>(
//       pageBuilder: (context, animation, secondaryAnimation) => page,
//       transitionDuration: duration,
//       reverseTransitionDuration: duration,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         final begin = _getBeginOffset(direction);
//         const end = Offset.zero;
//
//         final slideAnimation = animation.drive(
//           Tween(begin: begin, end: end).chain(CurveTween(curve: curve)),
//         );
//
//         final fadeAnimation = animation.drive(
//           Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve)),
//         );
//
//         return SlideTransition(
//           position: slideAnimation,
//           child: FadeTransition(
//             opacity: fadeAnimation,
//             child: child,
//           ),
//         );
//       },
//     );
//   }
//
//   /// Legacy method for backward compatibility.
//   /// Consider using [slideTransition] instead.
//   @Deprecated('Use slideTransition instead')
//   static PageRouteBuilder transition(Widget views) {
//     return slideTransition(views);
//   }
//
//   /// Helper method to get the begin offset based on slide direction.
//   static Offset _getBeginOffset(SlideDirection direction) {
//     switch (direction) {
//       case SlideDirection.rightToLeft:
//         return const Offset(1.0, 0.0);
//       case SlideDirection.leftToRight:
//         return const Offset(-1.0, 0.0);
//       case SlideDirection.topToBottom:
//         return const Offset(0.0, -1.0);
//       case SlideDirection.bottomToTop:
//         return const Offset(0.0, 1.0);
//     }
//   }
// }
//
// /// Enum defining the direction of slide transitions.
// enum SlideDirection {
//   /// Slides from right to left (default)
//   rightToLeft,
//
//   /// Slides from left to right
//   leftToRight,
//
//   /// Slides from top to bottom
//   topToBottom,
//
//   /// Slides from bottom to top
//   bottomToTop,
// }
//
// /// Extension methods for easier navigation with transitions.
// extension NavigationExtensions on BuildContext {
//   /// Navigate to a new page with a slide transition.
//   Future<T?> pushWithSlideTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//         SlideDirection direction = SlideDirection.rightToLeft,
//       }) {
//     return Navigator.of(this).push<T>(
//       PageTransition.slideTransition(
//         page,
//         duration: duration,
//         curve: curve,
//         direction: direction,
//       ),
//     );
//   }
//
//   /// Navigate to a new page with a fade transition.
//   Future<T?> pushWithFadeTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//       }) {
//     return Navigator.of(this).push<T>(
//       PageTransition.fadeTransition(
//         page,
//         duration: duration,
//         curve: curve,
//       ),
//     );
//   }
//
//   /// Navigate to a new page with a scale transition.
//   Future<T?> pushWithScaleTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//       }) {
//     return Navigator.of(this).push<T>(
//       PageTransition.scaleTransition(
//         page,
//         duration: duration,
//         curve: curve,
//       ),
//     );
//   }
//
//   /// Navigate to a new page with a combined slide and fade transition.
//   Future<T?> pushWithSlideFadeTransition<T>(
//       Widget page, {
//         Duration duration = const Duration(milliseconds: 300),
//         Curve curve = Curves.easeInOut,
//         SlideDirection direction = SlideDirection.rightToLeft,
//       }) {
//     return Navigator.of(this).push<T>(
//       PageTransition.slideFadeTransition(
//         page,
//         duration: duration,
//         curve: curve,
//         direction: direction,
//       ),
//     );
//   }
// }