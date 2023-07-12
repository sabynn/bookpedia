part of '_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;

  @override
  void initState() {
    controller = Get.find<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withAppBar: true,
      withFab: true,
      withTrailingAppBar: true,
      appBarTitle: 'Bookpedia',
      onTapTrailingAppBar: controller.logout,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Welcome, ${controller.nameOfUser.value}',
                    style: BaseTextStyle.header1Semibold(
                      color: BaseColor.primary,
                    ),
                  )),
              const ListBook(),
              // const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
