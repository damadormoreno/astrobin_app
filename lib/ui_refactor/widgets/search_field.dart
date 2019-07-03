import 'package:astrobin_app/core/viewmodels/base_viewmodel.dart';
import 'package:astrobin_app/core/viewmodels/search_title_viewmodel.dart';
import 'package:astrobin_app/core/viewmodels/search_user_viewmodel.dart';
import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final BaseViewModel viewModel;
  const SearchField({Key key, @required this.viewModel}) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection =
            TextSelection(baseOffset: 0, extentOffset: _controller.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Empieza a buscar',
        border: InputBorder.none,
        icon: Icon(
          Icons.search,
          color: Colors.black.withOpacity(0.5),
        ),
      ),
      onSubmitted: (title) {
        /*BlocProvider.of<SearchForTitleBloc>(context).onSearchInitiated(title);*/
        if (widget.viewModel is SearchTitleViewModel) {
          SearchTitleViewModel searchTitleViewModel = widget.viewModel;
          searchTitleViewModel.getSearchResultsForTitle(title);
        } else {
          SearchUserViewModel searchUserViewModel = widget.viewModel;
          searchUserViewModel.getSearchResultsForUser(title);
        }
      },
      controller: _controller,
      focusNode: _focusNode,
    );
  }
}
