part of '_widget.dart';

class AddBookInputSection extends StatefulWidget {
  const AddBookInputSection({Key? key}) : super(key: key);

  @override
  State<AddBookInputSection> createState() => _AddBookInputSectionState();
}

class _AddBookInputSectionState extends State<AddBookInputSection> {
  late final AddBookController controller;

  @override
  void initState() {
    controller = Get.find<AddBookController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: BaseColor.neutral100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          BaseTextFormField(
            title: 'ISBN',
            hintText: 'ISBN of the book',
            onTextChanged: (text) {
              controller.isbn.value = text;
            },
            inputType: TextInputType.number,
          ),
          BaseTextFormField(
            title: 'Title',
            hintText: 'Title of the book',
            onTextChanged: (text) {
              controller.title.value = text;
            },
          ),
          BaseTextFormField(
            title: 'Subtitle',
            hintText: 'Subtitle of the book',
            onTextChanged: (text) {
              controller.subtitle.value = text;
            },
          ),
          BaseTextFormField(
            title: 'Author',
            hintText: 'Author of the book',
            onTextChanged: (text) {
              controller.author.value = text;
            },
          ),
          DateTextField(
            title: 'Published Date',
            hintText: 'ex:2023/02/25',
            initialDate: DateTime.now(),
            controller: controller.published,
          ),
          BaseTextFormField(
            title: 'Publisher',
            hintText: 'Publisher of the book',
            onTextChanged: (text) {
              controller.publisher.value = text;
            },
          ),
          BaseTextFormField(
            title: 'Pages',
            hintText: 'Total pages of the book',
            onTextChanged: (text) {
              controller.pages.value = text;
            },
            inputType: TextInputType.number,
          ),
          BaseTextFormField(
            title: 'Description',
            hintText: 'Description of the book',
            onTextChanged: (text) {
              controller.description.value = text;
            },
          ),
          BaseTextFormField(
            title: 'Website',
            hintText: 'Website of the book',
            onTextChanged: (text) {
              controller.website.value = text;
            },
          ),
          Obx(
            () => BaseButton(
              isLoading: controller.addBookLoading.value,
              text: 'Add Book',
              onPressed: () {
                controller.addBook();
              },
            ),
          )
        ],
      ),
    );
  }
}
