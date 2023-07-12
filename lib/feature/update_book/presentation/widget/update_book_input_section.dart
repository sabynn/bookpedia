part of '_widget.dart';

class UpdateBookInputSection extends StatefulWidget {
  const UpdateBookInputSection({Key? key}) : super(key: key);

  @override
  State<UpdateBookInputSection> createState() => _UpdateBookInputSectionState();
}

class _UpdateBookInputSectionState extends State<UpdateBookInputSection> {
  late final UpdateBookController controller;

  @override
  void initState() {
    controller = Get.find<UpdateBookController>();
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
            initialValue: controller.isbn.value,
          ),
          BaseTextFormField(
            title: 'Title',
            hintText: 'Title of the book',
            onTextChanged: (text) {
              controller.title.value = text;
            },
            initialValue: controller.title.value,
          ),
          BaseTextFormField(
            title: 'Subtitle',
            hintText: 'Subtitle of the book',
            onTextChanged: (text) {
              controller.subtitle.value = text;
            },
            initialValue: controller.subtitle.value,
          ),
          BaseTextFormField(
            title: 'Author',
            hintText: 'Author of the book',
            onTextChanged: (text) {
              controller.author.value = text;
            },
            initialValue: controller.author.value,
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
            initialValue: controller.publisher.value,
          ),
          BaseTextFormField(
            title: 'Pages',
            hintText: 'Total pages of the book',
            onTextChanged: (text) {
              controller.pages.value = text;
            },
            inputType: TextInputType.number,
            initialValue: controller.pages.value,
          ),
          BaseTextFormField(
            title: 'Description',
            hintText: 'Description of the book',
            onTextChanged: (text) {
              controller.description.value = text;
            },
            initialValue: controller.description.value,
          ),
          BaseTextFormField(
              title: 'Website',
              hintText: 'Website of the book',
              onTextChanged: (text) {
                controller.website.value = text;
              },
              initialValue: controller.website.value),
          Obx(
            () => BaseButton(
              isLoading: controller.updateBookLoading.value,
              text: 'Update Book',
              onPressed: () {
                controller.updateBook();
              },
            ),
          )
        ],
      ),
    );
  }
}
