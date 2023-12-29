import 'package:flutter/material.dart';

class CustomExpandablePageView extends StatefulWidget {
  final List<Widget> children;
  PageController pageController;

  ///кастомный виджет для page view если размер его дочернего виджета неизвестен, а также если длина списка меняется
  CustomExpandablePageView({
    super.key,
    required this.children,
    required this.pageController,
  });

  @override
  _CustomExpandablePageViewState createState() =>
      _CustomExpandablePageViewState();
}

class _CustomExpandablePageViewState extends State<CustomExpandablePageView>
    with TickerProviderStateMixin {
  List<double> _heights = [];
  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    _heights = widget.children.map((e) => 0.0).toList();
    super.initState();
    widget.pageController.addListener(() {
      setState(() {
        _currentPage = widget.pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: Curves.easeInOutCubic,
      duration: const Duration(milliseconds: 100),
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        physics: const ClampingScrollPhysics(),
        controller: widget.pageController,
        children: _sizeReportingChildren,
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
          index,
          OverflowBox(
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeReportingWidget(
              onSizeChange: (size) =>
                  setState(() => _heights[index] = size.height ?? 0),
              child: child,
            ),
          ),
        ),
      )
      .values
      .toList();
}

class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    super.key,
    required this.child,
    required this.onSizeChange,
  });

  @override
  _SizeReportingWidgetState createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size _oldSize = const Size(0, 0);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    return widget.child;
  }

  void _notifySize() {
    if (mounted) {
      final size = context.size;
      if (_oldSize != size) {
        _oldSize = size!;
        widget.onSizeChange(size);
      }
    }
  }
}
