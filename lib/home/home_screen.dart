import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/settings/settings_tab.dart';
import 'package:todo_app/home/task_list/add_task_bottom_sheet.dart';
import 'package:todo_app/home/task_list/task_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.app_title,
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.blackColor)
                  : Theme.of(context).textTheme.titleLarge)),
      bottomNavigationBar: BottomAppBar(
        color: provider.isDarkMode() ? MyTheme.blackDark : MyTheme.whiteColor,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: AppLocalizations.of(context)!.task_list),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings)
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet();
        },
        child: Icon(Icons.add, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [TaskListTab(), SettingsTab()];

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => AddTaskBottomSheet());
  }
}
