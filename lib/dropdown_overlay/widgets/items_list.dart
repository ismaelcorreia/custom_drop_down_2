part of '../../custom_dropdown.dart';

class _ItemsList extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> items;
  final bool excludeSelected;
  final String headerText;
  final ValueSetter<String> onItemSelect;
  final EdgeInsets padding;
  final TextStyle? itemTextStyle;
  final _ListItemBuilder listItemBuilder;
  final Color? indicatorBackgroundColor;

  _ItemsList({
    Key? key,
    required this.scrollController,
    required this.items,
    required this.excludeSelected,
    required this.headerText,
    required this.onItemSelect,
    required this.listItemBuilder,
    required this.padding,
    this.itemTextStyle,
    this.indicatorBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: scrollController,
      child: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        padding: padding,
        itemCount: items.length,
        itemBuilder: (_, index) {
          final selected = !excludeSelected && headerText == items[index];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Theme.of(context).primaryColor.withOpacity(.5),
              onTap: () => onItemSelect(items[index]),
              child: Container(
                color: selected
                    ? indicatorBackgroundColor ??
                        Theme.of(context).indicatorColor
                    : Colors.transparent,
                padding: _listItemPadding,
                child: listItemBuilder(context, items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
