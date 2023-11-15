part of '../../views.dart';

class TodoCreateSection extends StatefulWidget {
  const TodoCreateSection({super.key});

  @override
  State<TodoCreateSection> createState() => _TodoCreateSectionState();
}

class _TodoCreateSectionState extends State<TodoCreateSection> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<String> todoList = [];

  @override
  void initState() {
    super.initState();
    _getTodosList();
  }

  //Retrieve Data from Table
  _getTodosList() async {
    Box box = await Hive.openBox(DBUtils.dbName);
    List<String>? dataList = box.get(DBUtils.todoTableName);
    if (dataList != null) {
      setState(() {
        todoList = dataList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getTodoCreateScaffold;
  }

  //Todo Create
  Widget get _getTodoCreateScaffold {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _getAppBar,
      body: _getTodoCreateContainer,
    );
  }

  //Appbar
  get _getAppBar => AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          StringConst.newTodoText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        leading: GestureDetector(
          onTap: () => Get.offNamed(rootRoute),
          child: const Icon(
            Iconsax.arrow_left,
            color: AppColors.black,
          ),
        ),
        leadingWidth: 52,
        elevation: 0.0,
        titleSpacing: 0.0,
        centerTitle: true,
      );

  Widget get _getTodoCreateContainer => Stack(
    children: [
      Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                _getTitleField,
                const SizedBox(
                  height: 20,
                ),
                _getDescriptionField,
              ],
            ),
          ),

      Positioned(
        left: 10, 
        right: 10,
        bottom: 10,
        child: _getAddTodoButton,
      )
    ],
  );

  //Title TextField
  get _getTitleField => CustomTextField(
        controller: _titleController,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cardColor.withOpacity(0.5)),
        maxLine: 1,
        backgroundColor: AppColors.primaryGrey.withOpacity(0.5),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
        hasPrefixIcon: false,
        hasTitle: true,
        isRequired: true,
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: Sizes.textSize14,
        ),
        hasTitleIcon: false,
        enabledBorder: Borders.noBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        hintTextStyle:
            const TextStyle(color: AppColors.primaryGrey, fontSize: 14),
        textStyle: const TextStyle(color: AppColors.black),
        hintText: StringConst.titleText,
      );

  //Description TextField
  get _getDescriptionField => CustomTextField(
        controller: _descriptionController,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cardColor.withOpacity(0.5)),
        maxLine: 5,
        backgroundColor: AppColors.primaryGrey.withOpacity(0.5),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
        hasPrefixIcon: false,
        hasTitle: true,
        isRequired: true,
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: Sizes.textSize14,
        ),
        hasTitleIcon: false,
        enabledBorder: Borders.noBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        hintTextStyle:
            const TextStyle(color: AppColors.primaryGrey, fontSize: 14),
        textStyle: const TextStyle(color: AppColors.black),
        hintText: StringConst.descriptionText,
      );

  //Add Button
  Widget get _getAddTodoButton => CustomPrimaryButton(
        onPressed: () => _checkValidation(),
        widthButton: MediaQuery.of(context).size.width - 40,
        heightButton: 47,
        text: StringConst.addText,
        fontSize: 15,
      );

  //Check Validation
  _checkValidation() {
    if (_titleController.text.isEmpty) {
      SnackBarUtils.showTopErrorMessage(context, StringConst.invalidTitleText);
    } else {
      _callAddNewTodo();
    }
  }

  //Add New Item
  _callAddNewTodo() {
    Todo data = Todo(
        title: _titleController.text.toString(),
        description: _descriptionController.text.toString(),
        createDate:
            DateFormat(StringConst.dateFormatText).format(DateTime.now()),
        completed: false);
    todoList.add(json.encode(data.toJson()));
    DBUtils.saveListData(todoList);
    SnackBarUtils.showTopSuccessMessage(context, StringConst.createSuccessText);
    _clearFields();
  }

  _clearFields() {
    setState(() {
      _titleController.text = '';
      _descriptionController.text = '';
    });
  }
}
