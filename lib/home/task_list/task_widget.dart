import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class TaskWidgetItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // delete task
            },
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            backgroundColor: MyTheme.redColor,
            foregroundColor: MyTheme.whiteColor,
            icon: Icons.delete,
            label: AppLocalizations.of(context)!.delete,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: provider.isDarkMode() ? MyTheme.blackDark : MyTheme.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              height: 80,
              width: 4,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.task_title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Theme.of(context).primaryColor)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(AppLocalizations.of(context)!.description,
                      style: provider.isDarkMode()
                          ? Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.whiteColor)
                          : Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: MyTheme.blackColor)),
                ),
              ],
            )),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
              ),
              child: Icon(Icons.check, color: MyTheme.whiteColor, size: 35),
            ),
          ],
        ),
      ),
    );
  }
}

//const VerticalDivider(
//             width: 20,
//             thickness: 1,
//             indent: 20,
//             endIndent: 0,
//             color: Colors.grey,
//           ),
