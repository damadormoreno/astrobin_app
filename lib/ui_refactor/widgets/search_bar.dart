import 'package:astrobin_app/core/viewmodels/base_viewmodel.dart';
import 'package:astrobin_app/ui_refactor/widgets/search_field.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final BaseViewModel viewModel;
  const SearchBar({Key key, @required this.viewModel}) : super(key: key);

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
          viewModel: viewModel,
        ),
      ),
    );
  }
}
