import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin { //هي الي بتحدد امتي القيمة هتطلع

  late AnimationController  animationController;   //its value is from 0 to 1 only
  late Animation<Offset> slidingAnimation;   // so we created this animation to put it above controller , to get the values from controller and give me the values i need

  @override
  void initState() {
    super.initState();

    InitSlidingAnimation();
    NavigateToHome();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),

           // to rebuild only this widget  to prevent update all ui
           AnimatedBuilder(
             animation: slidingAnimation,
             builder: (context,_) {
               return SlideTransition(
                 position: slidingAnimation,
                 child: const Text(
                   'Read Free Books',
                   textAlign: TextAlign.center,
                 ),
               );
             },
           ),
      ],
    );
  }

  void NavigateToHome() {

    Future.delayed(const Duration(seconds: 2) , (){
      GoRouter.of(context).push(AppRouter.homeViewPath);
    });
  }

  void InitSlidingAnimation() {
    animationController = AnimationController(vsync: this ,
        duration: const Duration(seconds: 1) ); //this refer to SingleTickerProviderStateMixin , duration => the animation will work for minute

    slidingAnimation = Tween<Offset>(begin: const Offset(0,10) ,end: const Offset(0,0)).animate(animationController);   // offsetالقيم الي هتدخلك من الكونترولر هتطلعهالي ع هيءة قيمة

    animationController.forward();
    //to make the ui update
    slidingAnimation.addListener(() {
    });
  }
}
