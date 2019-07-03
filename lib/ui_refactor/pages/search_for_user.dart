import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/core/viewmodels/search_user_viewmodel.dart';
import 'package:astrobin_app/ui_refactor/widgets/astrobin_image_card_refactor.dart';
import 'package:astrobin_app/ui_refactor/widgets/model_widgets.dart';
import 'package:astrobin_app/ui_refactor/widgets/search_bar.dart';
import 'package:flutter/material.dart';

import 'base_page.dart';

class SearchUserWidgetRefactor extends StatefulWidget {
  _SearchUserWidgetRefactorState createState() =>
      _SearchUserWidgetRefactorState();
}

class _SearchUserWidgetRefactorState extends State<SearchUserWidgetRefactor> {
  final _scrollController = ScrollController();
  SearchUserViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return BasePage<SearchUserViewModel>(
      onModelReady: (viewmodel) => _viewModel = viewmodel,
      builder: (context, viewmodel, child) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: SearchBar(
                viewModel: viewmodel,
              ),
            ),
            body: buildWidget(context),
          ),
    );
  }

  Widget buildWidget(BuildContext context) {
    switch (_viewModel.state) {
      case ViewState.Initial:
        return CenteredMessage(
          message: 'Empieza a buscar',
          icon: Icons.brightness_7,
        );
      case ViewState.Loading:
        return Center(
          child: CircularProgressIndicator(),
        );
        break;
      case ViewState.Failure:
        return CenteredMessage(
          message: _viewModel.error,
          icon: Icons.error_outline,
        );
        break;
      case ViewState.EndOfResults:
      case ViewState.Success:
        return _buildResultList();
        break;
    }
  }

  Widget _buildResultList() {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: ListView.builder(
        itemCount: _calculateListItemCount(),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return index >= _viewModel.astrobinList.length
              ? _buildLoaderListItem()
              : _buildImageListItem(_viewModel.astrobinList[index]);
        },
      ),
    );
  }

  int _calculateListItemCount() {
    if (_viewModel.hasReachedEndOfResults) {
      return _viewModel.astrobinList.length;
    } else {
      return _viewModel.astrobinList.length + 1;
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification &&
        _scrollController.position.extentAfter == 0) {
      _viewModel.fetchNextResultsForUser();
    }
    return false;
  }

  Widget _buildImageListItem(AstrobinItem astro) {
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

  void _handleFavoritesListChanged(AstrobinItem astroItem) {
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
