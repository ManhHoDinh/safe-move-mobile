import '../../../../application/services/user_order/user_order.dart';
import '../../../../utilities/api_status/api_status.dart';
import '../../../../utilities/failure/failure.dart';
import '../../../shared/base_infinite_loading/infinite_loading_cubit.dart';

class GetOrderListState extends InfiniteLoaderState<OrderResponse> {
  const GetOrderListState({
    super.data,
    super.infiniteLoadingFailure,
    super.infiniteLoadingStatus,
    super.isFirstLoad,
    super.totalItems,
    this.filterOrderStatus,
  });

  final OrderStatusType? filterOrderStatus;

  @override
  InfiniteLoaderState<OrderResponse> loadingManagementStateChanged(
      {List<OrderResponse>? data,
      bool? isFirstLoad,
      Failure? infiniteLoadingFailure,
      ApiStatus? infiniteLoadingStatus,
      int? totalItems}) {
    return GetOrderListState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      filterOrderStatus: filterOrderStatus,
    );
  }

  GetOrderListState copyWithFilterOrderStatus({
    OrderStatusType? filterOrderStatus,
  }) {
    return GetOrderListState(
      data: data,
      infiniteLoadingStatus: infiniteLoadingStatus,
      infiniteLoadingFailure: infiniteLoadingFailure,
      filterOrderStatus: filterOrderStatus,
      isFirstLoad: isFirstLoad,
      totalItems: totalItems,
    );
  }

  GetOrderListState copyWith({
    List<OrderResponse>? data,
    bool? isFirstLoad,
    Failure? infiniteLoadingFailure,
    ApiStatus? infiniteLoadingStatus,
    int? totalItems,
    OrderStatusType? filterOrderStatus,
  }) {
    return GetOrderListState(
      data: data ?? this.data,
      isFirstLoad: isFirstLoad ?? this.isFirstLoad,
      infiniteLoadingFailure:
          infiniteLoadingFailure ?? this.infiniteLoadingFailure,
      infiniteLoadingStatus:
          infiniteLoadingStatus ?? this.infiniteLoadingStatus,
      totalItems: totalItems ?? this.totalItems,
      filterOrderStatus: filterOrderStatus ?? this.filterOrderStatus,
    );
  }
}
