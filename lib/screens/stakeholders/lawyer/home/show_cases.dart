// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'case_details.dart';

class CaseList extends StatefulWidget {
  final bool showClosed;
  final bool showOpen;

  const CaseList({
    super.key,
    required this.showClosed,
    required this.showOpen,
  });

  @override
  _CaseListState createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  late User currentUser;
  List<DocumentSnapshot> cases = [];

  @override
  void initState() {
    super.initState();
    fetchCases();
  }

  Future<void> fetchCases() async {
    currentUser = FirebaseAuth.instance.currentUser!;
    final casesQuery = await FirebaseFirestore.instance
        .collection('cases')
        .where('lawyerEmail', isEqualTo: currentUser.email)
        .get();
    setState(() {
      cases = casesQuery.docs.toList();
    });
  }

  void _onCaseTap(String caseId) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CaseDetailScreen(caseId: caseId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return ListView.builder(
      itemCount: cases.length,
      itemBuilder: (context, index) {
        final caseData = cases[index].data() as Map<String, dynamic>;
        final clientName = caseData['clientName'] as String;
        final nextHearingDate = caseData['nextHearingDate'] as String;
        final caseStatus = caseData['caseStatus'] ?? 'N/A';
        final ipc = caseData['ipcSections'] ?? 'N/A';
        final lawyer = caseData['lawyerName'] ?? 'N/A';
        final judge = caseData['judgeName'] ?? 'N/A';
        final caseNumber = caseData['caseNumber'] ?? 'N/A';
        final caseId = cases[index].id;
        return Card(
          margin: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ExpansionTileCard(
                leading: CircleAvatar(child: Text(caseNumber)),
                title: Text(clientName),
                subtitle: Text(nextHearingDate),
                children: <Widget>[
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'Client Name: $clientName\n'
                        'Next Hearing Date: $nextHearingDate\n'
                        'IPC Section: $ipc\n'
                        'Case Status: $caseStatus\n'
                        'Lawyer: $lawyer\n'
                        'Judge: $judge',
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CaseListScreen extends StatefulWidget {
  final bool showClosed;
  final bool showOpen;

  const CaseListScreen({
    super.key,
    required this.showClosed,
    required this.showOpen,
  });

  @override
  _CaseListScreenState createState() => _CaseListScreenState();
}

class _CaseListScreenState extends State<CaseListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case List'),
      ),
      body: CaseList(showClosed: widget.showClosed, showOpen: widget.showOpen),
    );
  }
}

/**  elevation: 3,
            
            child: InkWell(
              onTap: () {
                _onCaseTap(caseId);
              }, 
            
            
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clientName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Next hearing: $nextHearingDate',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            **/