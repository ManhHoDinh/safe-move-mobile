// class CommunityFilter extends StatelessWidget {
//   const CommunityFilter(
//       {super.key,
//       required this.filterWhatYouWrote,
//       required this.filterPostWithComment,
//       required this.filterLikedPost});
//
//   final SelectableChips<PostFilterType> filterWhatYouWrote;
//   final SelectableChips<PostFilterType> filterPostWithComment;
//   final SelectableChips<PostFilterType> filterLikedPost;
//
//   @override
//   Widget build(BuildContext context) {
//     return SliverPersistentHeader(
//       pinned: true,
//       delegate: _FilterPersistentDelegate(
//           filterWhatYouWrote: filterWhatYouWrote,
//           filterLikedPost: filterLikedPost,
//           filterPostWithComment: filterPostWithComment),
//     );
//   }
// }
//
// class _FilterPersistentDelegate extends SliverPersistentHeaderDelegate {
//   const _FilterPersistentDelegate(
//       {required this.filterWhatYouWrote,
//       required this.filterPostWithComment,
//       required this.filterLikedPost});
//
//   final SelectableChips<PostFilterType> filterWhatYouWrote;
//   final SelectableChips<PostFilterType> filterPostWithComment;
//   final SelectableChips<PostFilterType> filterLikedPost;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: AppColors.gray.shade70,
//       padding: const EdgeInsets.symmetric(vertical: 12),
//       child: TabBarView(
//         children: [filterWhatYouWrote, filterPostWithComment, filterLikedPost],
//       ),
//     );
//   }
//
//   @override
//   double get maxExtent => 62;
//
//   @override
//   double get minExtent => 62;
//
//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return true;
//   }
// }
