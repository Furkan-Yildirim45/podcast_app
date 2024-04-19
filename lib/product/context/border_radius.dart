

import 'package:flutter/cupertino.dart';
import 'package:musicapp/product/context/size.dart';

class _ContextBorderRadiusExtension{
  _ContextBorderRadiusExtension(BuildContext context) : _context = context;
  final BuildContext _context;

  BorderRadius get smallBorderRadius => BorderRadius.circular(_context.sized.height * 0.02); //12
  BorderRadius get largeBorderRadius => BorderRadius.circular(_context.sized.height * 0.04); //20

  BorderRadius dynamicBorderRadiusCircular({double? borderSize}) => BorderRadius.circular(_context.sized.height * (borderSize ?? 0.0));
}

extension ContextBorderRadiusExtension on BuildContext{
  _ContextBorderRadiusExtension get border => _ContextBorderRadiusExtension(this);
}