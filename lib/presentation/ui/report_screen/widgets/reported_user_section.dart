import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../presentation/ui/report_screen/widgets/item_user.dart';
import '../../../../application/services/user/dto/src/user_dto.dart';
import '../../../bases/user_cubit/user_cubit.dart';
import '../../../gen/app_colors.dart';
import '../../../gen/locale/app_localizations.dart';
import '../../../router/router_config/routes_gen/routes_gen.dart';
import '../../../shared/base_infinite_loading/app_shimmer.dart';
import '../../../shared/base_infinite_loading/infinite_loader_calculator_helper.dart';
import '../../../shared/base_infinite_loading/infinite_loader_wrapper.dart';
import '../../../shared/widgets/infinite_loading_error_item/listview.dart';
import '../cubit/reported_user_cubit.dart';

class ReportedUserSection extends StatelessWidget {
  const ReportedUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<UserLayout> itemUsers = [
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
      UserLayout(
        name: '댓글작성자',
        loading: true,
      ),
    ];
    return InfiniteLoaderUnControlledWrapper<ReportedUserCubit,
        ReportedUserState>.value(
      value: context.read<ReportedUserCubit>(),
      builder: (context, state) {
        final helper = InfiniteLoaderCalculatorHelper(state);
        if (helper.firstLoadInProgress) {
          return AppShimmer(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return UserItemWrapper(
                  child: itemUsers[index],
                );
              },
              itemCount: itemUsers.length,
            ),
          );
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            if (helper.firstLoadError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    S.of(context).someThingWentWrong,
                  ),
                ),
              );
            }
            if (helper.emptyResult) {
              return const SizedBox.shrink();
            }
            return ListView.builder(
              itemCount: helper.length,
              itemBuilder: (BuildContext context, int index) {
                return helper.renderItem(
                  context,
                  index,
                  loadingItemBuilder: (context) {
                    return const UserItemWrapper(
                      child: UserLayout(
                        name: '댓글작성자',
                        loading: true,
                      ),
                    );
                  },
                  itemBuilder: (context) {
                    final data = state.data[index];
                    final authority = <ItemUserAction>{};

                    authority.add(ItemUserAction.delete);

                    return UserItemWrapper(
                      child: UserLayout(
                        availableActions: authority,
                        onAction: (action) async {
                          if (action == ItemUserAction.delete) {
                            final agreed = await ConfirmRouteData(
                                    content: S
                                        .of(context)
                                        .areYouSureToDeleteThisUser)
                                .push<bool>(context);

                            if (agreed == null) {
                              return;
                            }
                            if (agreed == true && context.mounted) {
                              print(data);
                            }
                          }
                        },
                        imageUrl: data.avatarUrl,
                        name: data.name ?? '',
                      ),
                    );
                  },
                  errorItemBuilder: (context) {
                    return const InfiniteLoadingListItemError();
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

class UserItemWrapper extends StatelessWidget {
  const UserItemWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18, right: 10),
          child: child,
        ),
        Divider(
          height: 32,
          thickness: 1,
          color: AppColors.gray.shade100,
        ),
      ],
    );
  }
}

class UserLayout extends StatelessWidget {
  const UserLayout({
    super.key,
    this.imageUrl,
    required this.name,
    this.loading = false,
    this.availableActions,
    this.onAction,
  });

  final String? imageUrl;
  final String name;
  final bool loading;
  final Set<ItemUserAction>? availableActions;
  final ValueChanged<ItemUserAction>? onAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemUser(
          availableActions: availableActions ?? {},
          onAction: onAction,
          imageUrl: imageUrl,
          name: name,
          loading: loading,
        ),
      ],
    );
  }
}
