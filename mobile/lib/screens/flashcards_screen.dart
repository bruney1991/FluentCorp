import 'package:flutter/material.dart';

class FlashcardsScreen extends StatefulWidget {
  @override
  _FlashcardsScreenState createState() => _FlashcardsScreenState();
}

class _FlashcardsScreenState extends State<FlashcardsScreen> {
  int currentCardIndex = 0;
  bool isFlipped = false;
  int xpPoints = 1250; // XP Inicial simulado

  // Paleta Corporativa
  static const Color primaryColor = Color(0xFF1A237E);
  static const Color accentColor = Color(0xFF283593);
  static const Color backgroundColor = Color(0xFFF5F7FA);
  static const Color cardColor = Colors.white;
  static const Color textColor = Color(0xFF263238);
  static const Color successColor = Color(0xFF43A047); // Verde Corporativo
  static const Color activeColor = Colors.amber; // Laranja para destaque atual

  final List<Map<String, String>> flashcards = [
    {'front': 'Meeting', 'back': 'Reunião', 'context': 'Business English'},
    {'front': 'Deadline', 'back': 'Prazo final', 'context': 'Gestão de Projetos'},
    {'front': 'Budget', 'back': 'Orçamento', 'context': 'Finanças'},
    {'front': 'Feedback', 'back': 'Retorno / Avaliação', 'context': 'RH'},
    {'front': 'Stakeholder', 'back': 'Parte interessada', 'context': 'Gestão'},
  ];

  void _nextCard() {
    if (currentCardIndex < flashcards.length - 1) {
      setState(() {
        currentCardIndex++;
        isFlipped = false;
        xpPoints += 10; // Ganha XP ao avançar
      });
    }
  }

  void _previousCard() {
    if (currentCardIndex > 0) {
      setState(() {
        currentCardIndex--;
        isFlipped = false;
      });
    }
  }

  void _markAsLearned() {
    // Feedback visual e avanço
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text("+50 XP - Termo dominado!"),
          ],
        ),
        backgroundColor: successColor,
        duration: Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
      ),
    );
    setState(() {
      xpPoints += 50;
    });
    Future.delayed(Duration(milliseconds: 500), () {
      _nextCard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        // BOTÃO VOLTAR
        leading: Center(
          child: InkWell(
            onTap: () => Navigator.pop(context),
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 24),
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              'TRILHA DE APRENDIZADO',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.0),
            ),
            Text(
              'Inglês Corporativo • Nível 1',
              style: TextStyle(fontSize: 10, color: Colors.white70),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$xpPoints XP', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          // --- ÁREA DA TRILHA (Header) ---
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5))],
            ),
            child: Column(
              children: [
                // Renderização da Trilha
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(flashcards.length, (index) {
                      return Expanded(
                        child: Row(
                          children: [
                            // O Nó (Bolinha)
                            _buildTrailNode(index),
                            // A Linha (Conector) - Não mostra após o último item
                            if (index < flashcards.length - 1)
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: index < currentCardIndex ? successColor : Colors.white24,
                                ),
                              ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Progresso da Sessão: ${((currentCardIndex + 1) / flashcards.length * 100).toInt()}%',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),

          // --- ÁREA DO CARD ---
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFlipped = !isFlipped;
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isFlipped ? primaryColor : cardColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ],
                          border: Border.all(
                            color: isFlipped ? primaryColor : Colors.grey.shade200,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isFlipped ? Colors.white.withOpacity(0.1) : primaryColor.withOpacity(0.05),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isFlipped ? Icons.translate : Icons.lightbulb_outline,
                                size: 32,
                                color: isFlipped ? Colors.white : primaryColor,
                              ),
                            ),
                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                isFlipped 
                                  ? flashcards[currentCardIndex]['back']!
                                  : flashcards[currentCardIndex]['front']!,
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: isFlipped ? Colors.white : textColor,
                                  letterSpacing: -0.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 16),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: isFlipped ? Colors.white24 : Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: isFlipped ? Colors.transparent : Colors.grey.shade300),
                              ),
                              child: Text(
                                isFlipped ? 'TRADUÇÃO' : flashcards[currentCardIndex]['context']!.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isFlipped ? Colors.white : Colors.grey.shade600,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                            SizedBox(height: 40),
                            Text(
                              'Toque para virar',
                              style: TextStyle(
                                fontSize: 12,
                                color: isFlipped ? Colors.white38 : Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
                        onTap: currentCardIndex > 0 ? _previousCard : null,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: currentCardIndex > 0 ? Colors.grey.shade300 : Colors.transparent
                            ),
                            color: currentCardIndex > 0 ? Colors.white : Colors.grey.shade100,
                          ),
                          child: Icon(
                            Icons.arrow_back, 
                            color: currentCardIndex > 0 ? textColor : Colors.grey.shade300
                          ),
                        ),
                      ),
                      

                      ElevatedButton.icon(
                        onPressed: _markAsLearned,
                        icon: Icon(Icons.check, size: 20),
                        label: Text(
                          currentCardIndex == flashcards.length - 1 ? 'FINALIZAR' : 'APRENDIDO',
                          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.0),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: successColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      ),

                      
                      InkWell(
                        onTap: currentCardIndex < flashcards.length - 1 ? _nextCard : null,
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: currentCardIndex < flashcards.length - 1 ? Colors.grey.shade300 : Colors.transparent
                            ),
                            color: currentCardIndex < flashcards.length - 1 ? Colors.white : Colors.grey.shade100,
                          ),
                          child: Icon(
                            Icons.arrow_forward, 
                            color: currentCardIndex < flashcards.length - 1 ? textColor : Colors.grey.shade300
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildTrailNode(int index) {
    bool isCompleted = index < currentCardIndex;
    bool isCurrent = index == currentCardIndex;

    return Container(
      width: 24, // Tamanho do nó
      height: 24,
      decoration: BoxDecoration(
        color: isCompleted ? successColor : (isCurrent ? activeColor : Colors.white24),
        shape: BoxShape.circle,
        border: Border.all(
          color: isCurrent ? Colors.white : Colors.transparent,
          width: 2,
        ),
        boxShadow: isCurrent ? [
          BoxShadow(color: Colors.amber.withOpacity(0.5), blurRadius: 10, spreadRadius: 2)
        ] : [],
      ),
      child: Center(
        child: isCompleted 
          ? Icon(Icons.check, size: 14, color: Colors.white)
          : Text(
              '${index + 1}',
              style: TextStyle(
                color: isCurrent ? Colors.white : Colors.white.withOpacity(0.5),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
    );
  }
}