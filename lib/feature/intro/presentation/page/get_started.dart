part of '_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.illustration2,
                height: 200,
                width: 200,
              ),
              const SizedBox(height: 12),
              Text(
                'Welcome',
                style: BaseTextStyle.header1Regular(
                  color: BaseColor.darkPrimary,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Bookpedia: Your Reading Companion.',
                style: BaseTextStyle.paragraph1Semibold(
                  color: BaseColor.primary,
                ),
                textAlign: TextAlign.left,
              ),
              BaseButton(
                text: 'Log In',
                outerPadding: const EdgeInsets.only(
                  top: 20,
                  left: 30,
                  right: 30,
                ),
                onPressed: () {
                  Get.toNamed(BaseRouter.login);
                },
              ),
              BaseButton(
                text: 'Register',
                outerPadding: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 30,
                ),
                transparent: true,
                onPressed: () {
                  Get.toNamed(BaseRouter.register);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
