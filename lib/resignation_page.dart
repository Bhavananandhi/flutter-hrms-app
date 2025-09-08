import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResignationPage extends StatefulWidget {
  const ResignationPage({super.key});
  static const String routeName = '/resignation';

  @override
  State<ResignationPage> createState() => _ResignationPageState();
}

class _ResignationPageState extends State<ResignationPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController(
    text: 'Enter Your Reason Here',
  );
  final TextEditingController _textController4 = TextEditingController();
  final TextEditingController _textController5 = TextEditingController();
  bool _checkboxValue = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _textController1.dispose();
    _textController2.dispose();
    _textController3.dispose();
    _textController4.dispose();
    _textController5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: const Color(0xFF0A1F44),
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        12,
                        0,
                        0,
                        0,
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Resignation',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFFF1F2F3),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
      ),
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF131516),
              unselectedLabelColor: const Color(0xFF657079),
              labelStyle: GoogleFonts.interTight(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              unselectedLabelStyle: GoogleFonts.interTight(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
              indicatorColor: const Color(0xFF0A1F44),
              tabs: const [
                Tab(text: 'Apply Resignation'),
                Tab(text: 'Check Status'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Apply Resignation Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment(-0.74, -0.94),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                            child: Text(
                              'Apply For Resignation',
                              style: TextStyle(
                                color: Color(0xFF0E0E0F),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const Alignment(-0.71, -0.86),
                          child: Text(
                            'Submit Your Resignation Request',
                            style: GoogleFonts.poppins(
                              color: const Color(0xFF4F575D),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            height: 223.5,
                            decoration: BoxDecoration(
                              color: const Color(0xEED5D5D5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                        33,
                                        12,
                                        0,
                                        12,
                                      ),
                                      child: Text(
                                        'Employee Details',
                                        style: TextStyle(
                                          color: Color(0xFF23292D),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Employee Id',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'EMP002313',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Employee Name',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Mahesh Babu',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Department',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Engineer',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Position',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Senior Developer',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    37,
                                    0,
                                    83,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Joining Date',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '15 Jan 2020',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Manager',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF626C73),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'Jane Smith',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF191C1F),
                                              fontWeight: FontWeight.bold,
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
                        ),
                        Container(
                          width: double.infinity,
                          height: 52.9,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              const Opacity(
                                opacity: 0.4,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    2,
                                    0,
                                  ),
                                  child: Icon(
                                    Icons.info,
                                    color: Color(0xFFB46A37),
                                    size: 20,
                                  ),
                                ),
                              ),
                              Text(
                                'Your Notice Period Is 3 Months Based On Your Employee Type!',
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF191C1F),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            height: 341.34,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                ),
                              ],
                              border: Border.all(
                                color: const Color(0xFF3A3838),
                              ),
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment(-0.99, -0.95),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      10,
                                      10,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Resignation Submission Date',
                                      style: TextStyle(
                                        color: Color(0xFF181E22),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, -0.12),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          10,
                                          10,
                                          0,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            controller: _textController1,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText: 'TextField',
                                              hintStyle: GoogleFonts.inter(
                                                color: const Color(0xFF67747E),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              filled: true,
                                              fillColor: const Color(
                                                0xFFF7F5F5,
                                              ),
                                            ),
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF171B1E),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          color: const Color(0xFFFCF2F2),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment(-1.01, -0.38),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      10,
                                      10,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Last Working Date',
                                      style: TextStyle(
                                        color: Color(0xFF181C1F),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, -0.72),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          10,
                                          10,
                                          0,
                                          0,
                                        ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            controller: _textController2,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              hintText: 'TextField',
                                              hintStyle: GoogleFonts.inter(
                                                color: const Color(0xFF67747E),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              filled: true,
                                              fillColor: const Color(
                                                0xFFF7F6F6,
                                              ),
                                            ),
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF1D2125),
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.calendar_month,
                                          ),
                                          color: const Color(0xFFFCF7F7),
                                          onPressed: () {},
                                          style: IconButton.styleFrom(
                                            backgroundColor: Colors.black,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(0, 0.23),
                                  child: Row(
                                    children: [
                                      Checkbox(
                                        value: _checkboxValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            _checkboxValue = newValue!;
                                          });
                                        },
                                        activeColor: const Color(0xFF0A1F44),
                                        checkColor: const Color(0xFFF1EEEE),
                                      ),
                                      Text(
                                        'Request For Custom Last Working Date',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF5B656D),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment(-0.66, 0.48),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      0,
                                      0,
                                      0,
                                      10,
                                    ),
                                    child: Text(
                                      'Reason For Custom Date Request',
                                      style: TextStyle(
                                        color: Color(0xFF1D2225),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.84, 0.73),
                                  child: SizedBox(
                                    width: 200,
                                    child: TextFormField(
                                      controller: _textController3,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Enter Your Reason Here',
                                        hintStyle: GoogleFonts.inter(
                                          color: const Color(0xFF525E67),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0xFFB5B5B5),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF1E2225),
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment(0, 0.97),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      3,
                                      4,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Note : Custom Last Working Dates Require Management Approval And May Be Rejected',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            12,
                            10,
                            12,
                            30,
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 306.7,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                const Align(
                                  alignment: Alignment(-1, -0.88),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      12,
                                      0,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Detailed Message',
                                      style: TextStyle(
                                        color: Color(0xFF171B1E),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-1.03, -0.48),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          12,
                                          0,
                                          0,
                                          0,
                                        ),
                                    child: SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        controller: _textController4,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText:
                                              'Please Provide details about your resignation',
                                          hintStyle: GoogleFonts.inter(
                                            color: const Color(0xFF5F6A72),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFFA6A6A6),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        style: GoogleFonts.inter(),
                                        maxLines: 5,
                                      ),
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment(-0.97, 0.19),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      10,
                                      12,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Resignation Letter',
                                      style: TextStyle(
                                        color: Color(0xFF16191C),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.07, 0.45),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          12,
                                          0,
                                          0,
                                        ),
                                    child: SizedBox(
                                      width: 300,
                                      child: TextFormField(
                                        controller: _textController5,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          hintText: 'Upload Resignation Letter',
                                          hintStyle: GoogleFonts.inter(
                                            color: const Color(0xFF1A1E21),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0xFF878787),
                                              width: 1,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                50,
                                                10,
                                                50,
                                                10,
                                              ),
                                        ),
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF1D2225),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment(-1, 0.63),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                      35,
                                      4,
                                      0,
                                      0,
                                    ),
                                    child: Text(
                                      'Accepted Formats : PDF,DOCS,DOCX',
                                      style: TextStyle(
                                        color: Color(0xFF5C676F),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const Alignment(-0.09, 0.97),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF0A1F44),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      minimumSize: const Size(0, 40),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: Text(
                                      'Submit Resignation',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 14,
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
                  ),

                  // Check Status Tab
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        // Pending Card
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 330.1,
                            height: 229.6,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    12,
                                    12,
                                    12,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Career Growth Opportunity',
                                        style: TextStyle(
                                          color: Color(0xFF131618),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 84.92,
                                        height: 27.9,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF9CC84),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Pending',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF967508),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    12,
                                    70,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Request Id',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'RES001',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Submitted On',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '10 Apr 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Last Working Day',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '10 May 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Notice Period',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '30 Days(Standard)',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comments',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF5A646C),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Waiting for manager approval',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF262B30),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Approved Card
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 330.1,
                            height: 229.6,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    12,
                                    12,
                                    12,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Career Growth Opportunity',
                                        style: TextStyle(
                                          color: Color(0xFF131618),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 84.9,
                                        height: 27.9,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF66D594),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Approved',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF065E12),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    12,
                                    70,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Request Id',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'RES001',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Submitted On',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '10 Apr 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Last Working Day',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '15 Apr 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Notice Period',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '30 Days(Standard)',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comments',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF5A646C),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Exit Interview Scheduled for 14 Apr',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Rejected Card
                        Material(
                          elevation: 2,
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 330.1,
                            height: 229.6,
                            margin: const EdgeInsets.only(bottom: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    12,
                                    12,
                                    12,
                                    0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Career Growth Opportunity',
                                        style: TextStyle(
                                          color: Color(0xFF131618),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        width: 84.9,
                                        height: 27.9,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFEB9C8F),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Rejected',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5D0303),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    12,
                                    70,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Request Id',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'RES001',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Submitted On',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '20 Feb 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    25,
                                    0,
                                    8,
                                    12,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Last Working Day',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF5A646C),
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            '10 Mar 2023',
                                            style: GoogleFonts.inter(
                                              color: const Color(0xFF181C1F),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              6,
                                              0,
                                              0,
                                              0,
                                            ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Notice Period',
                                              style: GoogleFonts.inter(
                                                color: const Color(0xFF5A646C),
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              '20 Days(Custom Request)',
                                              style: GoogleFonts.inter(
                                                color: const Color(0xFFDBA451),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    26,
                                    0,
                                    0,
                                    0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Comments',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFF5A646C),
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        'Custom Notice Period rejected',
                                        style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
}
