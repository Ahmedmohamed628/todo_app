import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode() ? MyTheme.blackDark : MyTheme.whiteColor,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(AppLocalizations.of(context)!.add_new_task,
              style: provider.isDarkMode()
                  ? Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: MyTheme.whiteColor)
                  : Theme.of(context).textTheme.titleMedium),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        // de function btdeeny elly el user katbo w trg3ly nullable string
                        // btshof elly el user katbo da valid wla la
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!
                                .please_enter_task_title;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.enter_task_title,
                            hintStyle: Theme.of(context).textTheme.titleSmall)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return AppLocalizations.of(context)!
                                .please_enter_task_description;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!
                                .enter_task_description,
                            hintStyle: Theme.of(context).textTheme.titleSmall),
                        maxLines: 4),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(AppLocalizations.of(context)!.select_date,
                        style: provider.isDarkMode()
                            ? Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: MyTheme.grayColor)
                            : Theme.of(context).textTheme.titleMedium),
                  ),
                  InkWell(
                    onTap: () {
                      showCalender();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //'${DateFormat('dd/mm/yy')}'
                      //'${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                      child: Text(
                          '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                          textAlign: TextAlign.center,
                          style: provider.isDarkMode()
                              ? Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: MyTheme.whiteColor)
                              : Theme.of(context).textTheme.titleSmall),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(AppLocalizations.of(context)!.add,
                          style: Theme.of(context).textTheme.titleLarge))
                ],
              ))
        ],
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      // add task to firebase
    }
  }
}
