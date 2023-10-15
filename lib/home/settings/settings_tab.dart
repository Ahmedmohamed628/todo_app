import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/settings/language_bottom_sheet.dart';
import 'package:todo_app/home/settings/theme_bottom_sheet.dart';
import 'package:todo_app/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(AppLocalizations.of(context)!.language,
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleMedium),
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyTheme.blackDark
                      : MyTheme.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyTheme.primaryDark)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.primaryLight)),
                  Icon(Icons.arrow_drop_down, color: MyTheme.primaryDark)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(AppLocalizations.of(context)!.theme,
                style: provider.isDarkMode()
                    ? Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleMedium),
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: provider.isDarkMode()
                      ? MyTheme.blackDark
                      : MyTheme.whiteColor,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: MyTheme.primaryDark)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark_mode
                          : AppLocalizations.of(context)!.light_mode,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: MyTheme.primaryLight)),
                  Icon(Icons.arrow_drop_down, color: MyTheme.primaryDark)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
