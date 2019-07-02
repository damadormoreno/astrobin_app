import 'package:astrobin_app/core/viewmodels/search_title_viewmodel.dart';
import 'package:astrobin_app/ui_refactor/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool isSearchUser;
  final SearchTitleViewModel viewModel;
  const SearchBar({Key key, @required this.isSearchUser, this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: SearchField(
          isSearchUser: this.isSearchUser,
          viewModel: viewModel,
        ),
      ),
    );
  }
}
