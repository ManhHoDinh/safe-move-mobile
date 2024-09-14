import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utilities/api_status/api_status.dart';
import '../../../utilities/failure/failure.dart';
import '../../../utilities/result/result.dart';
import '../../gen/locale/app_localizations.dart';
import '../handlers/failure_handler/failure_handler_manager.dart';
import 'infinite_loader_calculator_helper.dart';
import 'infinite_loader_wrapper.dart';
import 'infinite_loading_cubit.dart';

class TestInfiniteLoadingScreen extends StatelessWidget {
  const TestInfiniteLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TestScreen'),
      ),
      body: InfiniteLoaderWrapper<InfiniteCounter, InfiniteCounterState>(
        create: (BuildContext context) {
          return InfiniteCounter(
            failureHandlerManager: context.read<FailureHandlerManager>(),
          );
        },
        builder: (context, controller, state) {
          final helper = InfiniteLoaderCalculatorHelper(state);
          if (helper.firstLoadInProgress) {
            // preferred AppShimmer
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              context.read<InfiniteCounter>().reload();
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (helper.firstLoadError) {
                  return helper.fullPageScrollable(context, constraints,
                      builder: (context) {
                    return const Center(
                      child: Text('first load error'),
                    );
                  });
                }
                if (helper.emptyResult) {
                  return helper.fullPageScrollable(context, constraints,
                      builder: (context) {
                    return Center(
                      child: Text(S.of(context).emptyList),
                    );
                  });
                }
                return ListView.builder(
                  controller: controller,
                  itemCount: helper.length,
                  itemBuilder: (BuildContext context, int index) {
                    return helper.renderItem(
                      context,
                      index,
                      loadingItemBuilder: (context) {
                        return Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: const CircularProgressIndicator(),
                        );
                      },
                      itemBuilder: (context) {
                        return Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          child: Text('Item ${state.data[index]}'),
                        );
                      },
                      errorItemBuilder: (context) {
                        return Container(
                          alignment: Alignment.center,
                          height: 100,
                          child: const Text('Error'),
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class InfiniteCounterState extends InfiniteLoaderState<int> {
  const InfiniteCounterState({
    super.totalItems,
    super.data,
    super.infiniteLoadingFailure,
    super.isFirstLoad,
    super.infiniteLoadingStatus,
  });

  @override
  InfiniteLoaderState<int> loadingManagementStateChanged({
    List<int>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
  }) {
    return InfiniteCounterState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}

class InfiniteCounter extends InfiniteLoaderCubit<InfiniteCounterState, int> {
  InfiniteCounter({
    required super.failureHandlerManager,
  }) : super(initialState: const InfiniteCounterState());

  @override
  void handleError(Failure failure) {
    // optional
    // failureHandlerManager.handle(failure);
  }

  @override
  Future<Result<Failure, PageableData<int>>> fetchMore(
      int page, int pageSize, String? searchText) async {
    await Future.delayed(const Duration(seconds: 2));
    // return const Right(PageableData(
    //   totalPages: 0,
    //   data: [],
    // ));
    // return const Left(GenericFailure());
    final result = List.generate(20, (index) => (page - 1) * 20 + index);
    // if (page == 5) {
    //   return const Left(GenericFailure());
    // }
    if (page == 10) {
      return const Right(PageableData(
        totalPages: 10,
        data: [],
      ));
    }
    return Right(PageableData(totalPages: 10, data: result));
  }
}
