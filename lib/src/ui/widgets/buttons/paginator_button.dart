import 'package:flutter/material.dart';
import 'package:number_paginator/src/ui/widgets/inherited_number_paginator.dart';

class PaginatorButton extends StatelessWidget {
  /// Callback for button press.
  final VoidCallback? onPressed;

  /// The child of the button.
  final Widget child;

  /// Whether the button is currently selected.
  final bool selected;

  /// Margin around the button.
  /// Defaults to EdgeInsets.all(4.0).
  final EdgeInsets margin;

  /// Creates an instance of [PaginatorButton].
  const PaginatorButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.selected = false,
    this.margin = const EdgeInsets.all(4.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = InheritedNumberPaginator.of(context).config;
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: margin,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            shape: config.buttonShape ?? const CircleBorder(),
            backgroundColor: _backgroundColor(context, selected),
            foregroundColor: _foregroundColor(context, selected),
            textStyle: config.buttonTextStyle,
            padding: config.buttonPadding,
          ),
          child: child,
        ),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedBackgroundColor ??
          Theme.of(context).colorScheme.secondary)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedBackgroundColor;

  Color? _foregroundColor(BuildContext context, bool selected) => selected
      ? (InheritedNumberPaginator.of(context)
              .config
              .buttonSelectedForegroundColor ??
          Colors.white)
      : InheritedNumberPaginator.of(context)
          .config
          .buttonUnselectedForegroundColor;
}
