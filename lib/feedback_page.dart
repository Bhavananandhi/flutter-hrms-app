import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  static String routeName = '/feedback';
  static String routePath = '/feedbackPage';

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  DateTime? datePicked;
  String? dropDownValue;
  final TextEditingController textController1 = TextEditingController();
  final FocusNode textFieldFocusNode1 = FocusNode();
  final TextEditingController textController2 = TextEditingController();
  final FocusNode textFieldFocusNode2 = FocusNode();

  @override
  void dispose() {
    textFieldFocusNode1.dispose();
    textController1.dispose();
    textFieldFocusNode2.dispose();
    textController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFE5EAED),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3C4F76),
          automaticallyImplyLeading: false,
          leading: IconButton(
            iconSize: 40,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Color(0xFFF9F7F7),
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Employee Feedback',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: const Color(0xFFF7F5F5),
              fontSize: 27,
            ),
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33130F0F),
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, -1),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          15,
                          30,
                          0,
                          0,
                        ),
                        child: Text(
                          'Submit Your Feedback',
                          style: GoogleFonts.interTight(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0C0909),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        15,
                        25,
                        18,
                        20,
                      ),
                      child: Text(
                        'Your feedback is important to us. Use this form to report any issues, concerns, or suggestions. All submissions are confidential.',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF281F1F),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 320,
                      child: Divider(
                        height: 1,
                        thickness: 1,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          10,
                          10,
                          10,
                          0,
                        ),
                        child: Container(
                          width: double.infinity,
                          child: Form(
                            key: formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select Date',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF120E0E),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0,
                                          12,
                                          0,
                                          0,
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color(0xFF393737),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                datePicked != null
                                                    ? DateFormat(
                                                      "d/M/y",
                                                    ).format(datePicked!)
                                                    : 'Select date',
                                                style: GoogleFonts.inter(
                                                  color: const Color(
                                                    0xFF9A9B9C,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.date_range,
                                              color: Color(0xFF9A9B9C),
                                              size: 24,
                                            ),
                                            onPressed: () async {
                                              final pickedDate =
                                                  await showDatePicker(
                                                    context: context,
                                                    initialDate: DateTime.now(),
                                                    firstDate: DateTime(1900),
                                                    lastDate: DateTime(2050),
                                                  );

                                              if (pickedDate != null) {
                                                setState(() {
                                                  datePicked = pickedDate;
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    20,
                                    0,
                                    10,
                                  ),
                                  child: Text(
                                    'Feedback Type',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF120E0E),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    15,
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    value: dropDownValue,
                                    items:
                                        [
                                          'General  Feedback',
                                          'Features & Suggestions',
                                          'Technical help',
                                          'Other',
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        dropDownValue = val;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: '  Select feedback type',
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFFA29C9C),
                                      ),
                                      filled: true,
                                      fillColor:
                                          Theme.of(
                                            context,
                                          ).colorScheme.background,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                    ),
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFA29C9C),
                                    ),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: Colors.grey,
                                      size: 24,
                                    ),
                                    isExpanded: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    10,
                                  ),
                                  child: Text(
                                    'If Other',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF0F0B0B),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    15,
                                  ),
                                  child: TextFormField(
                                    controller: textController1,
                                    focusNode: textFieldFocusNode1,
                                    decoration: InputDecoration(
                                      hintText: 'Enter feedback type',
                                      hintStyle: GoogleFonts.inter(
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Theme.of(
                                            context,
                                          ).colorScheme.background,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF5341F4),
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    style: GoogleFonts.inter(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    10,
                                  ),
                                  child: Text(
                                    'Description',
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF0A0A0A),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    0,
                                    0,
                                    0,
                                    30,
                                  ),
                                  child: TextFormField(
                                    controller: textController2,
                                    focusNode: textFieldFocusNode2,
                                    maxLines: 5,
                                    minLines: 5,
                                    decoration: InputDecoration(
                                      hintText:
                                          'Provide detailed information about your feedback...',
                                      hintStyle: GoogleFonts.inter(
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Theme.of(
                                            context,
                                          ).colorScheme.background,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          color:
                                              Theme.of(
                                                context,
                                              ).colorScheme.secondary,
                                          width: 1,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFF5341F4),
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            12,
                                            16,
                                            12,
                                            16,
                                          ),
                                    ),
                                    style: GoogleFonts.inter(),
                                  ),
                                ),
                                const Divider(
                                  height: 1,
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, -1),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            0,
                                            10,
                                            0,
                                            0,
                                          ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print('Button pressed ...');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF324A7B,
                                          ),
                                          minimumSize: const Size(
                                            double.infinity,
                                            60,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          'Submit Feedback',
                                          style: GoogleFonts.interTight(
                                            color: const Color(0xFFFAFBFC),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
