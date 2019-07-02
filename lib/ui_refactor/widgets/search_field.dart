import 'package:astrobin_app/core/viewmodels/search_title_viewmodel.dart';
import 'package:astrobin_app/ui/search_for_title/search_title_bloc.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class SearchField extends StatefulWidget {
  final bool isSearchUser;
  final SearchTitleViewModel viewModel;
  const SearchField({Key key, @required this.isSearchUser, this.viewModel})
      : super(key: key);

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
        if (widget.isSearchUser) {
          BlocProvider.of<SearchUserBloc>(context).onSearchInitiated(title);
        } else {
          /*BlocProvider.of<SearchForTitleBloc>(context).onSearchInitiated(title);*/
          widget.viewModel.getSearchResultsForTitle(title);
        }
      },
      controller: _controller,
      focusNode: _focusNode,
    );
  }
}
