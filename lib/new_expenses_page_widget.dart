import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(home: NewExpensesPageWidget()));
}

class NewExpensesPageWidget extends StatefulWidget {
  const NewExpensesPageWidget({Key? key}) : super(key: key);
  static const String routeName = '/expenses';

  @override
  State<NewExpensesPageWidget> createState() => _NewExpensesPageWidgetState();
}

class _NewExpensesPageWidgetState extends State<NewExpensesPageWidget>
    with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String? _dropDownValue;
  final _amountController = TextEditingController();
  final _commentController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  // State
  int _expenseButtonStatus = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF0A1F44),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 392.6,
              height: 93.1,
              decoration: const BoxDecoration(),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 35, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 50),
                    Text(
                      'Expenses',
                      style: GoogleFonts.poppins(
                        color: const Color(0xFFFBFDFE),
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TabBar(
                      labelColor: const Color(0xFFF9FFFF),
                      unselectedLabelColor: const Color(0xFFB6BCC0),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      indicatorColor: const Color(0xFFF7F7F9),
                      indicatorWeight: 3,
                      padding: const EdgeInsets.all(2),
                      tabs: const [
                        Tab(text: 'Apply'),
                        Tab(text: 'Status'),
                        Tab(text: 'History'),
                      ],
                      controller: _tabController,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Apply Tab
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 767,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0EFEF),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          30,
                                          0,
                                          0,
                                        ),
                                    child: Form(
                                      key: _formKey,
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              25,
                                              0,
                                              25,
                                              0,
                                            ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    9,
                                                  ),
                                              child: Text(
                                                'Expense Category',
                                                style: TextStyle(
                                                  color: Color(0xFF474F56),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    10,
                                                  ),
                                              child: Container(
                                                height: 46.1,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                    color: const Color(
                                                      0xFF8F8585,
                                                    ),
                                                  ),
                                                ),
                                                child: DropdownButtonFormField<
                                                  String
                                                >(
                                                  value: _dropDownValue,
                                                  items: const [
                                                    DropdownMenuItem(
                                                      value: 'Food',
                                                      child: Text('Food'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'Travel',
                                                      child: Text('Travel'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'Internet',
                                                      child: Text('Internet'),
                                                    ),
                                                    DropdownMenuItem(
                                                      value: 'Other',
                                                      child: Text('Other'),
                                                    ),
                                                  ],
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _dropDownValue = val;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                        border:
                                                            InputBorder.none,
                                                        contentPadding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 12,
                                                            ),
                                                        hintText:
                                                            'Select Category',
                                                      ),
                                                  style: const TextStyle(
                                                    color: Color(0xFF1B1A1A),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  icon: const Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: Colors.grey,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    9,
                                                  ),
                                              child: Text(
                                                'Amount',
                                                style: TextStyle(
                                                  color: Color(0xFF474F56),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 338.2,
                                              child: TextFormField(
                                                controller: _amountController,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Enter amount',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xFF5E676E),
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                              color: Color(
                                                                0xFF8F8585,
                                                              ),
                                                              width: 1,
                                                            ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                          color:
                                                              Colors
                                                                  .transparent,
                                                          width: 1,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  errorBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          Theme.of(
                                                            context,
                                                          ).colorScheme.error,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .error,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                ),
                                                style: const TextStyle(
                                                  color: Color(0xFF2A3035),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter amount';
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    10,
                                                    0,
                                                    9,
                                                  ),
                                              child: Text(
                                                'Date',
                                                style: TextStyle(
                                                  color: Color(0xFF474F56),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                    -0.06,
                                                    0,
                                                  ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      0,
                                                      0,
                                                      0,
                                                      10,
                                                    ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        height: 49,
                                                        decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xFF8F8585,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional.fromSTEB(
                                                                      12,
                                                                      0,
                                                                      0,
                                                                      0,
                                                                    ),
                                                                child: Text(
                                                                  DateFormat(
                                                                    "d/M/y",
                                                                  ).format(
                                                                    _selectedDate,
                                                                  ),
                                                                  style: const TextStyle(
                                                                    color: Color(
                                                                      0xFF363A3B,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            IconButton(
                                                              icon: const Icon(
                                                                Icons
                                                                    .date_range_sharp,
                                                                color: Color(
                                                                  0xFF53575A,
                                                                ),
                                                                size: 24,
                                                              ),
                                                              onPressed:
                                                                  () =>
                                                                      _selectDate(
                                                                        context,
                                                                      ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    9,
                                                  ),
                                              child: Text(
                                                'Comment',
                                                style: TextStyle(
                                                  color: Color(0xFF474F56),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    10,
                                                  ),
                                              child: SizedBox(
                                                width: 335,
                                                child: TextFormField(
                                                  controller:
                                                      _commentController,
                                                  maxLines: 5,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText:
                                                        'Add any additional details',
                                                    hintStyle: const TextStyle(
                                                      color: Color(0xFF89949C),
                                                      fontSize: 15,
                                                      letterSpacing: 0.5,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFF8F8585,
                                                                ),
                                                                width: 1,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                            color:
                                                                Colors
                                                                    .transparent,
                                                            width: 1,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    errorBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).colorScheme.error,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                            color:
                                                                Theme.of(
                                                                      context,
                                                                    )
                                                                    .colorScheme
                                                                    .error,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                10,
                                                              ),
                                                        ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                  ),
                                                  style: const TextStyle(
                                                    color: Color(0xFF0F1011),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    9,
                                                  ),
                                              child: Text(
                                                'Supporting Document',
                                                style: TextStyle(
                                                  color: Color(0xFF474F56),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    0,
                                                    0,
                                                    7,
                                                  ),
                                              child: InkWell(
                                                onTap: () {
                                                  // File upload functionality would go here
                                                },
                                                child: Container(
                                                  width: 233.9,
                                                  height: 102.41,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 4,
                                                        color: Color(
                                                          0x33000000,
                                                        ),
                                                        offset: Offset(0, 2),
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: const Color(
                                                        0xFF8F8585,
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          15,
                                                          0,
                                                          5,
                                                          0,
                                                        ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .cloud_upload_rounded,
                                                          color: Color(
                                                            0xFF0A1F44,
                                                          ),
                                                          size: 42,
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          'Tap to upload receipt JPEG, PNG or PDF (Max 5MB)',
                                                          style: TextStyle(
                                                            color: Color(
                                                              0xFF62696E,
                                                            ),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0,
                                                    15,
                                                    0,
                                                    0,
                                                  ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                              0xFFF6F5F8,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          side:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFF0A1F44,
                                                                ),
                                                              ),
                                                        ),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        'Cancel',
                                                        style:
                                                            GoogleFonts.poppins(
                                                              color:
                                                                  const Color(
                                                                    0xFF0A1F44,
                                                                  ),
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 15),
                                                  Expanded(
                                                    child: TextButton(
                                                      onPressed: () {
                                                        if (_formKey
                                                            .currentState!
                                                            .validate()) {
                                                          // Submit form
                                                          print(
                                                            'Form submitted',
                                                          );
                                                        }
                                                      },
                                                      style: TextButton.styleFrom(
                                                        backgroundColor:
                                                            const Color(
                                                              0xFF0A1F44,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                          side:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFF544F4F,
                                                                ),
                                                              ),
                                                        ),
                                                        padding:
                                                            const EdgeInsets.symmetric(
                                                              vertical: 10,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        'Submit',
                                                        style:
                                                            GoogleFonts.poppins(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Status Tab
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 767,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF0EFEF),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          20,
                                          0,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _buildStatusFilterButton(
                                          'All',
                                          1,
                                          Icons.done_rounded,
                                        ),
                                        _buildStatusFilterButton(
                                          'Pending',
                                          2,
                                          Icons.timer_rounded,
                                        ),
                                        _buildStatusFilterButton(
                                          'Approved',
                                          3,
                                          Icons.check_circle_rounded,
                                        ),
                                        _buildStatusFilterButton(
                                          'Rejected',
                                          4,
                                          Icons.cancel_rounded,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            10,
                                            0,
                                            0,
                                          ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            _buildExpenseCard(
                                              'Travel',
                                              'Approved',
                                              '14 Apr 2025',
                                              '2000',
                                              'Client meeting transportation',
                                              const Color(0x81ACE7AF),
                                              const Color(0xFF0A480A),
                                              Icons.check_circle_rounded,
                                            ),
                                            _buildExpenseCard(
                                              'Food',
                                              'Pending',
                                              '14 Apr 2025',
                                              '800',
                                              'Team lunch',
                                              const Color(0xFFFCE2BD),
                                              const Color(0xFFB4700C),
                                              Icons.timer_rounded,
                                              showButtons: true,
                                            ),
                                            _buildExpenseCard(
                                              'Internet',
                                              'Rejected',
                                              '14 Apr 2025',
                                              '1999',
                                              'Mobile data for remote work',
                                              const Color(0xFFF9D9D7),
                                              const Color(0xFFCE3328),
                                              Icons.cancel_rounded,
                                            ),
                                            _buildExpenseCard(
                                              'Others',
                                              'Approved',
                                              '14 Apr 2025',
                                              '2000',
                                              'Client meeting transportation',
                                              const Color(0x81ACE7AF),
                                              const Color(0xFF0A480A),
                                              Icons.check_circle_rounded,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        // History Tab
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6E2E2),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: 362.69,
                                      height: 49.8,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          const Icon(
                                            Icons.filter_alt_sharp,
                                            color: Color(0xFF0A1F44),
                                            size: 24,
                                          ),
                                          const SizedBox(width: 10),
                                          Opacity(
                                            opacity: 0.8,
                                            child: Text(
                                              'Filter by date Range',
                                              style: GoogleFonts.poppins(
                                                color: const Color(0xFF3A4248),
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.keyboard_arrow_down_sharp,
                                              color: Color(0xFF0A1F44),
                                              size: 35,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0,
                                              20,
                                              0,
                                              0,
                                            ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              _buildHistoryExpenseCard(
                                                'Travel',
                                                'Approved',
                                                '14 Apr 2025',
                                                '2000',
                                                'Client meeting transportation',
                                              ),
                                              _buildHistoryExpenseCard(
                                                'Food',
                                                'Rejected',
                                                '14 Apr 2025',
                                                '1000',
                                                'Team lunch',
                                              ),
                                              _buildHistoryExpenseCard(
                                                'Travel',
                                                'Approved',
                                                '14 Apr 2025',
                                                '2000',
                                                'Client meeting transportation',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusFilterButton(String text, int status, IconData iconData) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
      child: InkWell(
        onTap: () {
          setState(() {
            _expenseButtonStatus = status;
          });
        },
        child: Container(
          width: text == 'Approved' ? 94 : 84.4,
          height: 36.8,
          decoration: BoxDecoration(
            color: const Color(0xFF0A1F44),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (_expenseButtonStatus == status)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                  child: Icon(
                    iconData,
                    color: const Color(0xFFF6F7F8),
                    size: 18,
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                child: Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpenseCard(
    String category,
    String status,
    String date,
    String amount,
    String comment,
    Color statusBgColor,
    Color statusTextColor,
    IconData statusIcon, {
    bool showButtons = false,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 13),
        width: 67.8,
        height: showButtons ? 166.8 : 122.61,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    category,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1A1F21),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Container(
                    width: 114,
                    height: 28,
                    decoration: BoxDecoration(
                      color: statusBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            status,
                            style: GoogleFonts.inter(
                              color: statusTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 3),
                          Icon(statusIcon, color: statusTextColor, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  const Icon(
                    Icons.calendar_today,
                    color: Color(0xFF0C0E0F),
                    size: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0E1112),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 25),
                  const Icon(
                    Icons.currency_rupee_sharp,
                    color: Color(0xFF0E1112),
                    size: 20,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    amount,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0C0F11),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.9,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(17, 15, 0, 0),
                  child: Text(
                    comment,
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF1E2224),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            if (showButtons)
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFF8F8F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFF0A1F44)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          'Modify',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0A1F44),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F5FB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Color(0xFFE12727)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFD52222),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryExpenseCard(
    String category,
    String status,
    String date,
    String amount,
    String comment,
  ) {
    Color statusBgColor;
    Color statusTextColor;
    IconData statusIcon;

    switch (status) {
      case 'Approved':
        statusBgColor = const Color(0x81ACE7AF);
        statusTextColor = const Color(0xFF0A480A);
        statusIcon = Icons.check_circle_rounded;
        break;
      case 'Rejected':
        statusBgColor = const Color(0xFFF9D9D7);
        statusTextColor = const Color(0xFFCE3328);
        statusIcon = Icons.cancel_rounded;
        break;
      default: // Pending
        statusBgColor = const Color(0xFFFCE2BD);
        statusTextColor = const Color(0xFFB4700C);
        statusIcon = Icons.timer_rounded;
    }

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 13),
        width: 67.8,
        height: 126.2,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x33000000),
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Container(
              width: 51.91,
              height: 51.91,
              decoration: BoxDecoration(
                color: const Color(0x99C0BDB2),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.calendar_today,
                color: Color(0x99050505),
                size: 27,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        category,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF1A1F21),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Container(
                        width: 114,
                        height: 28,
                        decoration: BoxDecoration(
                          color: statusBgColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                status,
                                style: GoogleFonts.inter(
                                  color: statusTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 3),
                              Icon(
                                statusIcon,
                                color: statusTextColor,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0E1112),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Icon(
                          Icons.currency_rupee_sharp,
                          color: Color(0xFF0E1112),
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          amount,
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0C0F11),
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Opacity(
                    opacity: 0.9,
                    child: Text(
                      comment,
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF1E2224),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
