part of 'tags_imports.dart';

@RoutePage<Tag>()
class Tags extends StatefulWidget {
  const Tags({
    super.key,
    required this.navigationType,
  });

  final NavigationType navigationType;

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  late TagsViewModel tagsViewModel;

  @override
  void initState() {
    tagsViewModel = TagsViewModel(repository: context.read<Repository>());
    tagsViewModel.fetchAllTags();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: "Tags".text.size(16.sp).bold.white.make(),
        automaticallyImplyLeading:
            NavigationType.outer == widget.navigationType ? false : true,
        actions: [
          IconButton(
              onPressed: () => tagsViewModel.gotToAddTags(context),
              icon: const Icon(
                FeatherIcons.plus,
                color: Colors.white,
              ))
        ],
      ),
      body: BlocBuilder<VelocityBloc<TagsModel>, VelocityState<TagsModel>>(
          bloc: tagsViewModel.tagsModelBloc,
          builder: (context, state) {
            if (state is VelocityInitialState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (state is VelocityUpdateState) {
              return ListView.separated(
                itemCount: state.data.tags!.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.h,
                ),
                itemBuilder: (context, index) {
                  var tagData = state.data.tags![index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        NavigationType.outer == widget.navigationType
                            ? null
                            : AutoRouter.of(context).maybePop<Tag>(tagData);
                      },
                      leading: '${index + 1}'.text.size(16.sp).make(),
                      title: tagData.title!.text.size(16.sp).make(),
                      trailing: SizedBox(
                        width: 100.w,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => tagsViewModel.gotToUpdateTags(
                                  context, tagData),
                              icon: const Icon(
                                color: Colors.green,
                                FeatherIcons.edit,
                              ),
                            ),
                            IconButton(
                              onPressed: () => tagsViewModel.deleteTags(
                                context,
                                tagData.id.toString(),
                                index,
                              ),
                              icon: const Icon(
                                color: Colors.red,
                                FeatherIcons.trash,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          }),
    );
  }
}
