// 🎯 Dart imports:
import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
// 🐦 Flutter imports:
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart' as rf;

// 🌎 Project imports:
import 'package:acnoo_flutter_admin_panel/app/widgets/avatars/_avatar_widget.dart';
import 'package:acnoo_flutter_admin_panel/app/widgets/shadow_container/_shadow_container.dart';
import '../../../../generated/l10n.dart' as l;
import '../../../core/helpers/helpers.dart';
import '../../../core/theme/_app_colors.dart';
import '../../../widgets/widgets.dart';
import 'add_user_popup.dart';
import 'demo_model.dart';

class User {
  final String sicilNo;
  final String isim;
  final int inckeyNo;
  final String aciklama;
  final String durum;
  bool isSelected;

  User({
    required this.sicilNo,
    required this.isim,
    required this.inckeyNo,
    required this.aciklama,
    required this.durum,
    this.isSelected = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      sicilNo: json['SICILNO'],
      isim: json['ISIM'],
      inckeyNo: json['INCKEYNO'],
      aciklama: json['ACIKLAMA'],
      durum: json['DURUM'],
    );
  }
}

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  ///_____________________________________________________________________Variables_______________________________
  late List<UserDataModel> _filteredData;
  final ScrollController _scrollController = ScrollController();
  final List<UserDataModel> users = AllUsers.allData;
  List<User> userData = [];
  bool isLoading = false;
  int _currentPage = 0;
  int _rowsPerPage = 10;
  String _searchQuery = '';
  bool _selectAll = false;
 Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    const String apiUrl = 'http://192.168.21.46:1880/login';
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        setState(() {
          userData = jsonData.map((data) => User.fromJson(data)).toList();
        });
      } else {
        throw Exception('Veri alınamadı: ${response.statusCode}');
      }
    } catch (e) {
      print('Hata: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
  @override
  void initState() {
    super.initState();
      fetchData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///_____________________________________________________________________data__________________________________
  List<User> get _currentPageData {
    List<User> filteredData = userData;
    if (_searchQuery.isNotEmpty) {
      filteredData = userData.where((user) {
        return user.isim.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.sicilNo.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            user.aciklama.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    int start = _currentPage * _rowsPerPage;
    int end = start + _rowsPerPage;
    return filteredData.sublist(
        start, end > filteredData.length ? filteredData.length : end);
  }

  ///_____________________________________________________________________Search_query_________________________
  void _setSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
      _currentPage = 0;
    });
  }

  ///_____________________________________________________________________Add_User_____________________________
  void _showFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: const AddUserDialog());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _sizeInfo = rf.ResponsiveValue<_SizeInfo>(
      context,
      conditionalValues: [
        const rf.Condition.between(
          start: 0,
          end: 480,
          value: _SizeInfo(
            alertFontSize: 12,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 481,
          end: 576,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
        const rf.Condition.between(
          start: 577,
          end: 992,
          value: _SizeInfo(
            alertFontSize: 14,
            padding: EdgeInsets.all(16),
            innerSpacing: 16,
          ),
        ),
      ],
      defaultValue: const _SizeInfo(),
    ).value;

    TextTheme textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: _sizeInfo.padding,
        child: ShadowContainer(
          showHeader: false,
          contentPadding: EdgeInsets.zero,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final isMobile = constraints.maxWidth < 481;
                final isTablet =
                    constraints.maxWidth < 992 && constraints.maxWidth >= 481;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isMobile
                        ? Padding(
                            padding: _sizeInfo.padding,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: showingValueDropDown(
                                          isTablet: isTablet,
                                          isMobile: isMobile,
                                          textTheme: textTheme),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const SizedBox(height: 16.0),
                                searchFormField(textTheme: textTheme),
                              ],
                            ),
                          )
                        : Padding(
                            padding: _sizeInfo.padding,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: showingValueDropDown(
                                      isTablet: isTablet,
                                      isMobile: isMobile,
                                      textTheme: textTheme),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  flex: isTablet || isMobile ? 2 : 3,
                                  child: searchFormField(textTheme: textTheme),
                                ),
                                Spacer(flex: isTablet || isMobile ? 1 : 2),
                              ],
                            ),
                          ),

                    isMobile || isTablet
                        ? RawScrollbar(
                            padding: const EdgeInsets.only(left: 18),
                            trackBorderColor: theme.colorScheme.surface,
                            trackVisibility: true,
                            scrollbarOrientation: ScrollbarOrientation.bottom,
                            controller: ScrollController(),
                            thumbVisibility: true,
                            thickness: 8.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth,
                                    ),
                                    child: userListDataTable(context),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: constraints.maxWidth,
                              ),
                              child: userListDataTable(context),
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  ///_____________________________________________________________________add_user_button___________________________
  

  ///_____________________________________________________________________pagination_functions_______________________
  int get _totalPages => (_filteredData.length / _rowsPerPage).ceil();

  ///_____________________________________select_dropdown_val_________
  void _setRowsPerPage(int value) {
    setState(() {
      _rowsPerPage = value;
      _currentPage = 0;
    });
  }

  ///_____________________________________go_next_page________________
  void _goToNextPage() {
    if (_currentPage < _totalPages - 1) {
      setState(() {
        _currentPage++;
      });
    }
  }

  ///_____________________________________go_previous_page____________
  void _goToPreviousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
    }
  }

  ///_______________________________________________________________pagination_footer_______________________________
  Row paginatedSection(ThemeData theme, TextTheme textTheme) {
    //final lang = l.S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            '${l.S.of(context).showing} ${_currentPage * _rowsPerPage + 1} ${l.S.of(context).to} ${_currentPage * _rowsPerPage + _currentPageData.length} ${l.S.of(context).OF} ${_filteredData.length} ${l.S.of(context).entries}',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        DataTablePaginator(
          currentPage: _currentPage + 1,
          totalPages: _totalPages,
          onPreviousTap: _goToPreviousPage,
          onNextTap: _goToNextPage,
        )
      ],
    );
  }

  ///_______________________________________________________________Search_Field___________________________________
  TextFormField searchFormField({required TextTheme textTheme}) {
    final lang = l.S.of(context);
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        // hintText: 'Search...',
        hintText: '${lang.search}...',
        hintStyle: textTheme.bodySmall,
        suffixIcon: Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: AcnooAppColors.kPrimary700,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child:
              const Icon(IconlyLight.search, color: AcnooAppColors.kWhiteColor),
        ),
      ),
      onChanged: (value) {
        _setSearchQuery(value);
      },
    );
  }

  ///_______________________________________________________________DropDownList___________________________________
  Container showingValueDropDown(
      {required bool isTablet,
      required bool isMobile,
      required TextTheme textTheme}) {
    final _dropdownStyle = AcnooDropdownStyle(context);
    //final theme = Theme.of(context);
    final lang = l.S.of(context);
    return Container(
      constraints: const BoxConstraints(maxWidth: 100, minWidth: 100),
      child: DropdownButtonFormField2<int>(
        style: _dropdownStyle.textStyle,
        iconStyleData: _dropdownStyle.iconStyle,
        buttonStyleData: _dropdownStyle.buttonStyle,
        dropdownStyleData: _dropdownStyle.dropdownStyle,
        menuItemStyleData: _dropdownStyle.menuItemStyle,
        isExpanded: true,
        value: _rowsPerPage,
        items: [10, 20, 30, 40, 50].map((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(
              //isTablet || isMobile ? '$value' :
              '${lang.show} $value',
              style: textTheme.bodySmall,
            ),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            _setRowsPerPage(value);
          }
        },
      ),
    );
  }

  ///_______________________________________________________________User_List_Data_Table___________________________
  Widget userListDataTable(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return DataTable(
      columnSpacing: 16,
      headingRowColor: MaterialStateProperty.all(
          theme.colorScheme.primaryContainer),
      headingTextStyle: textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.bold,
      ),
      dataRowColor: MaterialStateProperty.all(
          theme.colorScheme.surfaceVariant),
      dataTextStyle: textTheme.bodySmall,
      columns: const [
        DataColumn(label: Text("Sicil No")),
        DataColumn(label: Text("İsim")),
        DataColumn(label: Text("INCKEYNO")),
        DataColumn(label: Text("Açıklama")),
        DataColumn(label: Text("Durum")),
      ],
      rows: _currentPageData.map((user) {
        return DataRow(
          selected: user.isSelected,
          onSelectChanged: (selected) {
            setState(() {
              user.isSelected = selected ?? false;
            });
          },
          cells: [
            DataCell(Text(user.sicilNo)),
            DataCell(Text(user.isim)),
            DataCell(Text(user.inckeyNo.toString())),
            DataCell(Text(user.aciklama)),
            DataCell(Text(user.durum == "Aktif" ? "Aktif" : "Pasif")),
          ],
        );
      }).toList(),
    );
  }

  ///_____________________________________________________________________Selected_datatable_________________________
  void _selectAllRows(bool select) {
    setState(() {
      for (var data in _currentPageData) {
        data.isSelected = select;
      }
      _selectAll = select;
    });
  }
}

class _SizeInfo {
  final double? alertFontSize;
  final EdgeInsetsGeometry padding;
  final double innerSpacing;
  const _SizeInfo({
    this.alertFontSize = 18,
    this.padding = const EdgeInsets.all(24),
    this.innerSpacing = 24,
  });
}