part of '../../views.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  final TextEditingController _searchTodoController = TextEditingController();
  //Color
  static const List<Color> homeGridColorList = [
    AppColors.primaryColor,
    AppColors.green,
    AppColors.red,
  ];

  //IconData
  static const List<IconData> homeGridIconDataList = [
    Iconsax.task_square,
    Iconsax.task_square,
    Iconsax.task_square,
    Iconsax.task_square,
  ];

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
    return _getHomeScaffold;
  }

  //Home
  Widget get _getHomeScaffold {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _getAppBar,
      body: _getHomeContainer,
    );
  }

  //Appbar
  get _getAppBar => AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          StringConst.appTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
        titleSpacing: 0.0,
        centerTitle: true,
      );

  //Home Container
  get _getHomeContainer => Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getHomeSearchField,
                const SizedBox(
                  height: Sizes.height10,
                ),
                _getHomeGrid,
                const SizedBox(
                  height: Sizes.height20,
                ),
                _getTodoListContainer
              ],
            ),
          ),
        ),
      );

  //Home Search TextField
  get _getHomeSearchField => CustomTextField(
        controller: _searchTodoController,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.cardColor.withOpacity(0.5)),
        maxLine: 1,
        backgroundColor: AppColors.primaryGrey.withOpacity(0.5),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
        hasPrefixIcon: true,
        hasTitle: true,
        isRequired: true,
        titleStyle: const TextStyle(
          color: AppColors.white,
          fontSize: Sizes.textSize14,
        ),
        onChanged: (value) => _searchTodo(value),
        hasTitleIcon: false,
        enabledBorder: Borders.noBorder,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1),
          borderSide: const BorderSide(color: AppColors.white),
        ),
        prefixIcon: const Icon(Iconsax.search_normal),
        hintTextStyle:
            const TextStyle(color: AppColors.primaryGrey, fontSize: 14),
        textStyle: const TextStyle(color: AppColors.black),
        hintText: StringConst.searchText,
      );

  //HomeGrid
  get _getHomeGrid {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.6,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: StringConst.homeGridTextList.length,
        itemBuilder: (BuildContext ctx, index) {
          return HomeItem(
            title: StringConst.homeGridTextList[index],
            iconColor: homeGridColorList[index],
            iconData: homeGridIconDataList[index],
          );
        });
  }

  Widget get _getTodoListContainer => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getTodoTitle,
          const SizedBox(
            height: Sizes.height10,
          ),
          _getTodoList
        ],
      );

  //Todo Title
  get _getTodoTitle => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            StringConst.myTodoText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          _getCreateNewTodoButton,
        ],
      );

  //Create New Todo Button
  get _getCreateNewTodoButton => TextButton.icon(
        label: const Text(
          StringConst.addText,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        onPressed: () => Get.offNamed(createTodoPageRoute),
        icon: const Icon(
          Iconsax.add_circle,
          color: AppColors.black,
        ),
      );

  //Todo List
  get _getTodoList => todoList.isNotEmpty
      ? ListView.builder(
          itemCount: todoList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Todo data = TodoModel.fromJson(jsonDecode(todoList[index]));
            return TodoItem(
              todo: data,
              onValueDeleteChanged: (Todo value) {
                setState(() {
                  todoList.remove(json.encode(value.toJson()));
                });
                DBUtils.saveListData(todoList);
                SnackBarUtils.showTopSuccessMessage(
                    context, StringConst.deleteSuccessText);
              },
              onValueCompletedChanged: (Todo value) => _updateTodo(value),
            );
          })
      : const EmptyToDoItem();

  //Search Todo
  _searchTodo(String value) {
    if (value == '') {
      _getTodosList();
    } else {
      setState(() {
        todoList = todoList
            .where((data) => TodoModel.fromJson(json.decode(data))
                .title!
                .toLowerCase()
                .contains(value.toLowerCase()))
            .toList();
      });
    }
  }

  //Completed
  _updateTodo(Todo value) {
    Todo data = Todo(
        title: value.title,
        description: value.description,
        createDate: value.createDate,
        completed: true);

    var index = todoList.indexOf(json.encode(value.toJson()));
    setState(() {
      todoList.replaceRange(index, index + 1, [json.encode(data.toJson())]);
    });
    DBUtils.saveListData(todoList);
    SnackBarUtils.showTopSuccessMessage(context, StringConst.updateSuccessText);
  }
}
