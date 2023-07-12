part of '_page.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller;

  SplashScreen({super.key}) : controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BaseColor.neutral0,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                Assets.illustration1,
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 12),
              Text(
                'Bookpedia',
                style: BaseTextStyle.header1Semibold(
                  color: BaseColor.primary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
