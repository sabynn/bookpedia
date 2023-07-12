part of '_page.dart';

class UpdateBookPage extends StatelessWidget {
  const UpdateBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withAppBar: true,
      appBarTitle: 'Update Book',
      withBackAppBar: true,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              'Update your book',
              style: BaseTextStyle.header3Semibold(
                color: BaseColor.primary,
              ),
            ),
          ),
          const UpdateBookInputSection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
