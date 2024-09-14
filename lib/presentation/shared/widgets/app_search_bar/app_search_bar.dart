import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../application/services/app/search_history/search_history.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../handlers/failure_handler/failure_handler_manager.dart';
import '../../theme/theme.dart';
import '../app_bar/common_app_bar.dart';
import '../app_icon_button.dart';
import '../textfields/common_textfield.dart';
import 'blocs/app_search_bar_cubit.dart';
import 'search_entry.dart';

class AppSearchBar extends StatefulWidget implements PreferredSizeWidget {
  const AppSearchBar({
    super.key,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.onLogoTap,
    this.height = 50,
    this.title,
    this.titleSpacing,
    this.closeIcon,
    this.centerTitle = false,
    this.color,
    this.onQuery,
    this.initialQuery,
    this.leading,
    this.hintText,
    this.animationDuration = const Duration(milliseconds: 300),
    this.enable = true,
  });

  final String? initialQuery;
  final ValueChanged<String>? onQuery;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final VoidCallback? onLogoTap;
  final double height;
  final Widget? title;
  final bool centerTitle;
  final double? titleSpacing;
  final Widget? closeIcon;
  final Color? color;
  final Widget? leading;
  final String? hintText;
  final Duration animationDuration;
  final bool enable;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppSearchBarState extends State<AppSearchBar> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppSearchBarCubit>(
      create: (BuildContext context) {
        return AppSearchBarCubit(
          failureHandlerManager: context.read<FailureHandlerManager>(),
          searchHistoryService: context.read<SearchHistoryService>(),
        );
      },
      child: BlocBuilder<AppSearchBarCubit, AppSearchBarState>(
          builder: (context, state) {
        return _AppSearchBarInternal(
          focusNode: _focusNode,
          searchEntries: state.entries
              .map(
                (e) => SearchEntryItem(
                  title: e.searchText,
                  onSelected: () {
                    _controller.text = e.searchText;
                    _focusNode.unfocus();
                    widget.onQuery?.call(e.searchText);
                    context.read<AppSearchBarCubit>().saveEntry(e.searchText);
                  },
                  onDelete: () {
                    context.read<AppSearchBarCubit>().deleteEntry(e.id);
                  },
                ),
              )
              .toList(),
          controller: _controller,
          actions: widget.actions,
          automaticallyImplyLeading: widget.automaticallyImplyLeading,
          onLogoTap: widget.onLogoTap,
          height: widget.height,
          title: widget.title,
          titleSpacing: widget.titleSpacing,
          closeIcon: widget.closeIcon,
          centerTitle: widget.centerTitle,
          color: widget.color,
          initialQuery: widget.initialQuery,
          leading: widget.leading,
          hintText: widget.hintText,
          animationDuration: widget.animationDuration,
          enable: widget.enable,
          onQuery: (searchText) {
            widget.onQuery?.call(searchText);
            context.read<AppSearchBarCubit>().saveEntry(searchText);
          },
          onFocus: () {
            context.read<AppSearchBarCubit>().reload();
          },
          onDeleteAll: () {
            context.read<AppSearchBarCubit>().deleteEntries();
          },
        );
      }),
    );
  }
}

class _AppSearchBarInternal extends StatefulWidget {
  const _AppSearchBarInternal({
    this.actions,
    required this.automaticallyImplyLeading,
    this.onLogoTap,
    required this.height,
    this.title,
    this.titleSpacing,
    this.closeIcon,
    required this.centerTitle,
    this.color,
    this.onQuery,
    this.initialQuery,
    this.leading,
    this.hintText,
    required this.animationDuration,
    required this.searchEntries,
    this.onDeleteAll,
    required this.focusNode,
    required this.controller,
    required this.enable,
    this.onFocus,
  });

  final String? initialQuery;
  final ValueChanged<String>? onQuery;
  final List<Widget>? actions;
  final bool automaticallyImplyLeading;
  final VoidCallback? onLogoTap;
  final double height;
  final Widget? title;
  final bool centerTitle;
  final double? titleSpacing;
  final Widget? closeIcon;
  final Color? color;
  final Widget? leading;
  final String? hintText;
  final Duration animationDuration;
  final List<Widget> searchEntries;
  final VoidCallback? onDeleteAll;
  final FocusNode focusNode;
  final TextEditingController controller;
  final VoidCallback? onFocus;
  final bool enable;

  @override
  State<_AppSearchBarInternal> createState() => _AppSearchBarInternalState();
}

class _AppSearchBarInternalState extends State<_AppSearchBarInternal>
    with TickerProviderStateMixin {
  late final FocusNode _focusNode;
  late final TextEditingController _textController;

  bool _searchBarShowing = false;
  late final AnimationController _searchBarAnimationController;
  late final AnimationController _historySheetAnimationController;
  late final Animation<double> _searchIconScale;
  late final Animation<double> _searchBarSize;
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _searchBarAnimationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _historySheetAnimationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    _searchIconScale = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
          parent: _searchBarAnimationController, curve: Curves.easeIn),
    );
    _searchBarSize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _searchBarAnimationController, curve: Curves.easeIn),
    );
    _focusNode = widget.focusNode;
    _textController = widget.controller;
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant _AppSearchBarInternal oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animationDuration != oldWidget.animationDuration) {
      _searchBarAnimationController.duration = widget.animationDuration;
    }
    if (widget.searchEntries != oldWidget.searchEntries ||
        widget.onDeleteAll != oldWidget.onDeleteAll) {
      _updateHistory();
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChanged);
    _searchBarAnimationController.dispose();
    _historySheetAnimationController.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (_focusNode.hasFocus) {
      widget.onFocus?.call();
      _showSearchHistory();
      return;
    }
    _hideSearchHistory();
    setState(() {});
  }

  void _hideSearchHistory() {
    _historySheetAnimationController.reverse().then((value) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  void _showSearchHistory() {
    if (_overlayEntry != null) {
      return;
    }
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final y = renderBox.localToGlobal(Offset.zero).dy + size.height;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height),
            child: TextFieldTapRegion(
              child: _SearchHistory(
                width: size.width,
                onDeleteAll: () {
                  widget.onDeleteAll?.call();
                  _focusNode.unfocus();
                },
                searchEntries: widget.searchEntries,
                animation: _historySheetAnimationController,
                y: y,
              ),
            ),
          ),
        );
      },
    );
    _historySheetAnimationController.forward();
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _showSearchBar() {
    setState(() {
      _searchBarShowing = true;
    });
    _searchBarAnimationController.forward();
    _historySheetAnimationController.forward();
  }

  void _updateHistory() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _overlayEntry?.markNeedsBuild();
    });
  }

  void _hideSearchBar() {
    _historySheetAnimationController.reverse();
    _searchBarAnimationController.reverse().then((value) {
      setState(() {
        _searchBarShowing = false;
      });
    });
  }

  Widget _buildCloseButton(BuildContext context,
      {required VoidCallback onClose, Size? size}) {
    return AppIconButton(
      size: size,
      icon: widget.closeIcon ?? Assets.svgs.chevronLeft24.svg(),
      onTap: onClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? resolvedLeading;
    if (_searchBarShowing) {
      resolvedLeading = AnimatedBuilder(
        animation: _searchIconScale,
        builder: (BuildContext context, Widget? child) {
          return _buildCloseButton(
            context,
            onClose: _hideSearchBar,
            size: Size(
              40 * (1 - _searchIconScale.value),
              40 * (1 - _searchIconScale.value),
            ),
          );
        },
      );
    } else {
      final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
      final bool canPop = parentRoute?.impliesAppBarDismissal ?? false;
      if (widget.leading != null) {
        resolvedLeading = widget.leading;
      } else if (canPop && widget.automaticallyImplyLeading) {
        resolvedLeading = _buildCloseButton(context, onClose: () {
          context.pop();
        });
      }
    }

    return PopScope(
      canPop: !_searchBarShowing,
      onPopInvoked: (value) {
        if (value) {
          return;
        }
        _hideSearchBar();
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextFieldTapRegion(
          child: CommonAppBar(
            automaticallyImplyLeading: false,
            height: widget.height,
            centerTitle: widget.centerTitle,
            titleSpacing: _searchBarShowing ? 8 : widget.titleSpacing,
            leading: resolvedLeading,
            onLogoTap: widget.onLogoTap,
            color: widget.color,
            actions: [
              AnimatedBuilder(
                builder: (context, child) {
                  return AppIconButton(
                    size: Size(40 * _searchIconScale.value,
                        40 * _searchIconScale.value),
                    icon: Assets.svgs.searchIcon.svg(),
                    onTap: () {
                      _showSearchBar();
                    },
                  );
                },
                animation: _searchIconScale,
              ),
              ...widget.actions ?? [],
            ],
            title: _searchBarShowing
                ? SizeTransition(
                    axis: Axis.horizontal,
                    axisAlignment: -1,
                    sizeFactor: _searchBarSize,
                    child: IgnorePointer(
                      ignoring: !widget.enable,
                      child: CommonTextField.slim(
                        hintText: widget.hintText,
                        textInputAction: TextInputAction.search,
                        focusNode: _focusNode,
                        onEditingComplete: () {
                          widget.onQuery?.call(_textController.text);
                          _focusNode.unfocus();
                        },
                        textEditingController: _textController,
                      ),
                    ),
                  )
                : widget.title,
          ),
        ),
      ),
    );
  }
}

class _SearchHistory extends StatelessWidget {
  const _SearchHistory({
    required this.searchEntries,
    required this.animation,
    this.onDeleteAll,
    required this.width,
    required this.y,
  });

  final List<Widget> searchEntries;
  final Animation<double> animation;
  final VoidCallback? onDeleteAll;
  final double width;
  final double y;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final maxHeight =
        min(screenHeight - keyboardHeight - y - 10, 270).toDouble();

    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return SizeTransition(
          axisAlignment: -1,
          sizeFactor: animation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.gray.shade70,
            border: Border(
              bottom: BorderSide(color: AppColors.gray.shade300),
            ),
          ),
          width: width,
          constraints: BoxConstraints(
              maxHeight: maxHeight,
              minHeight: searchEntries.isNotEmpty ? maxHeight : 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (searchEntries.isNotEmpty)
                  _ClearAllTile(onDeleteAll: onDeleteAll),
                ...searchEntries,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ClearAllTile extends StatelessWidget {
  const _ClearAllTile({
    this.onDeleteAll,
  });

  final VoidCallback? onDeleteAll;

  @override
  Widget build(BuildContext context) {
    final recentSearchStyle = Styles.s12()
        .withLetterSpacing(-2.5 / 100)
        .withColor(AppColors.text.common);
    final onDeleteStyle = recentSearchStyle.withColor(AppColors.text.bodyText);
    return Material(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
            child: Text(
              S.of(context).recentSearches,
              style: recentSearchStyle,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: InkWell(
              onTap: () {
                onDeleteAll?.call();
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(
                  S.of(context).clearAllHistory,
                  style: onDeleteStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
