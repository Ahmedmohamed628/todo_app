import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color: provider.isDarkMode() ? MyTheme.blackDark : MyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? getSelectedItemWidget(
                      AppLocalizations.of(context)!.dark_mode)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.dark_mode)),
          InkWell(
              onTap: () {
                provider.changeTheme(ThemeMode.light);
              },
              child: provider.isDarkMode()
                  ? getUnselectedItemWidget(
                      AppLocalizations.of(context)!.light_mode)
                  : getSelectedItemWidget(
                      AppLocalizations.of(context)!.light_mode)),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: MyTheme.primaryLight)),
          Icon(Icons.check_box_rounded, color: MyTheme.primaryLight, size: 25)
        ],
      ),
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}

//Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(AppLocalizations.of(context)!.english, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: MyTheme.primaryLight)),
//                 Icon(Icons.check_box_rounded, color: MyTheme.primaryLight, size: 25)
//               ],
//             ),
//           ),
//=====================================================================================================

//Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
//             child: Text(AppLocalizations.of(context)!.arabic, style: Theme.of(context).textTheme.titleMedium),
//           ),
