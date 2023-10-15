import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
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
                provider.changeLanguage('en');
              },
              child: provider.appLanguage == 'en'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.english)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.english)),
          InkWell(
              onTap: () {
                provider.changeLanguage('ar');
              },
              child: provider.appLanguage == 'ar'
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.arabic)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.arabic)),
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
