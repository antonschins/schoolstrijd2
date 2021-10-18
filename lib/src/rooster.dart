import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';

import 'pluto/constants/pluto_grid_example_colors.dart';
import 'pluto/screen/development_screen.dart';
import 'pluto/screen/feature/add_and_remove_rows_screen.dart';
import 'pluto/screen/feature/cell_renderer_screen.dart';
import 'pluto/screen/feature/cell_selection_screen.dart';
import 'pluto/screen/feature/column_filtering_screen.dart';
import 'pluto/screen/feature/column_freezing_screen.dart';
import 'pluto/screen/feature/column_hiding_screen.dart';
import 'pluto/screen/feature/column_moving_screen.dart';
import 'pluto/screen/feature/column_resizing_screen.dart';
import 'pluto/screen/feature/column_sorting_screen.dart';
import 'pluto/screen/feature/copy_and_paste_screen.dart';
import 'pluto/screen/feature/dark_mode_screen.dart';
import 'pluto/screen/feature/date_type_column_screen.dart';
import 'pluto/screen/feature/dual_mode_screen.dart';
import 'pluto/screen/feature/grid_as_popup_screen.dart';
import 'pluto/screen/feature/listing_mode_screen.dart';
import 'pluto/screen/feature/moving_screen.dart';
import 'pluto/screen/feature/number_type_column_screen.dart';
import 'pluto/screen/feature/row_moving_screen.dart';
import 'pluto/screen/feature/row_pagination_screen.dart';
import 'pluto/screen/feature/row_selection_screen.dart';
import 'pluto/screen/feature/row_with_checkbox_screen.dart';
import 'pluto/screen/feature/selection_type_column_screen.dart';
import 'pluto/screen/feature/text_type_column_screen.dart';
import 'pluto/screen/feature/time_type_column_screen.dart';
import 'pluto/screen/feature/value_formatter_screen.dart';
import 'pluto/screen/home_screen.dart';

class Rooster2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:
      kReleaseMode ? HomeScreen.routeName : DevelopmentScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        ColumnMovingScreen.routeName: (context) => ColumnMovingScreen(),
        ColumnFreezingScreen.routeName: (context) => ColumnFreezingScreen(),
        ColumnResizingScreen.routeName: (context) => ColumnResizingScreen(),
        ColumnSortingScreen.routeName: (context) => ColumnSortingScreen(),
        ColumnFilteringScreen.routeName: (context) => ColumnFilteringScreen(),
        ColumnHidingScreen.routeName: (context) => ColumnHidingScreen(),
        TextTypeColumnScreen.routeName: (context) => TextTypeColumnScreen(),
        NumberTypeColumnScreen.routeName: (context) => NumberTypeColumnScreen(),
        DateTypeColumnScreen.routeName: (context) => DateTypeColumnScreen(),
        TimeTypeColumnScreen.routeName: (context) => TimeTypeColumnScreen(),
        SelectionTypeColumnScreen.routeName: (context) =>
            SelectionTypeColumnScreen(),
        ValueFormatterScreen.routeName: (context) => ValueFormatterScreen(),
        RowSelectionScreen.routeName: (context) => RowSelectionScreen(),
        RowMovingScreen.routeName: (context) => RowMovingScreen(),
        RowPaginationScreen.routeName: (context) => RowPaginationScreen(),
        RowWithCheckboxScreen.routeName: (context) => RowWithCheckboxScreen(),
        CellSelectionScreen.routeName: (context) => CellSelectionScreen(),
        CellRendererScreen.routeName: (context) => CellRendererScreen(),
        CopyAndPasteScreen.routeName: (context) => CopyAndPasteScreen(),
        MovingScreen.routeName: (context) => MovingScreen(),
        AddAndRemoveRowsScreen.routeName: (context) => AddAndRemoveRowsScreen(),
        DualModeScreen.routeName: (context) => DualModeScreen(),
        GridAsPopupScreen.routeName: (context) => GridAsPopupScreen(),
        ListingModeScreen.routeName: (context) => ListingModeScreen(),
        DarkModeScreen.routeName: (context) => DarkModeScreen(),
        // only development
        DevelopmentScreen.routeName: (context) => DevelopmentScreen(),
      },
      theme: ThemeData(
        primaryColor: PlutoGridExampleColors.primaryColor,
        fontFamily: 'OpenSans',
        backgroundColor: PlutoGridExampleColors.backgroundColor,
        scaffoldBackgroundColor: PlutoGridExampleColors.backgroundColor,
      ),
    );
  }
}
