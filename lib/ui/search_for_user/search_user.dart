import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_bloc.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_state.dart';
import 'package:astrobin_app/ui_refactor/widgets/astrobin_image_card.dart';
import 'package:astrobin_app/ui_refactor/widgets/model_widgets.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchUserWidget extends StatefulWidget {
  @override
  _SearchUserWidgetState createState() => _SearchUserWidgetState();
}

class _SearchUserWidgetState extends State<SearchUserWidget> {
  final _searchUserBloc = kiwi.Container().resolve<SearchUserBloc>();
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => _searchUserBloc,
      child: _buildScaffold(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchUserBloc.dispose();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SearchBar(
          isSearchUser: true,
        ),
      ),
      body: BlocBuilder(
        bloc: _searchUserBloc,
        builder: (context, SearchUserState state) {
          if (state.isInitial) {
            return CenteredMessage(
              message: 'Empieza a buscar',
              icon: Icons.people,
            );
          }

          if (state.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.isSuccessful) {
            return _buildResultList(state);
          } else {
            return CenteredMessage(
              message: state.error,
              icon: Icons.error_outline,
            );
          }
        },
      ),
    );
  }

  Widget _buildResultList(SearchUserState state) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(state),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= state.searchResults.length
              ? _buildLoaderListItem()
              : _buildImageListItem(state.searchResults[index]);
        },
      ),
    );
  }

  int _calculateListItemCount(SearchUserState state) {
    if (state.hasReachedEndOfResults) {
      return state.searchResults.length;
    } else {
      return state.searchResults.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _searchUserBloc.fetchNextUserResultPage();
    }
    return false;
  }

  Widget _buildImageListItem(SearchTitleItem astro) {
    return AstrobinImageCard(
      searchTitleItem: astro,
      inFavorites: false,
      onFavoriteButtonPressed: _handleFavoritesListChanged,
    );
  }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _handleFavoritesListChanged(SearchTitleItem astroItem) {
    //TODO; Llamar al método de lectura y guardado en base de datos
    print(astroItem.title);
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to favorite'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
