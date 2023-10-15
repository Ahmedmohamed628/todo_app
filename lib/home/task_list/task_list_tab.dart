import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/task_list/task_widget.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor:
              provider.isDarkMode() ? MyTheme.whiteColor : MyTheme.blackColor,
          dayColor:
              provider.isDarkMode() ? MyTheme.whiteColor : MyTheme.blackColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: MyTheme.whiteColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskWidgetItem();
            },
            itemCount: 30,
          ),
        ),
      ],
    );
  }
}
