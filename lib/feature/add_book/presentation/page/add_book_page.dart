part of '_page.dart';

class AddBookPage extends StatelessWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withAppBar: true,
      appBarTitle: 'Add Book',
      withBackAppBar: true,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: Text(
              'Add new book',
              style: BaseTextStyle.header3Semibold(
                color: BaseColor.primary,
              ),
            ),
          ),
          const AddBookInputSection(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
