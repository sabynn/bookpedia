part of '_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              'Sign In with your\nexisting account',
              style: BaseTextStyle.header3Semibold(
                color: BaseColor.primary,
              ),
            ),
          ),
          const LoginInputSection(),
          GestureDetector(
            onTap: () {
              Get.toNamed(BaseRouter.register);
            },
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 30,
                bottom: 80,
              ),
              child: Text(
                'Don\'t have an account? Register',
                style: BaseTextStyle.paragraph1Regular(
                  color: BaseColor.neutral700,
                ).copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
