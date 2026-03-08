import 'package:flutter/material.dart';
import 'flashcards_screen.dart';
import 'conversation_screen.dart';
import 'music_screen.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  
  // Cores constantes para evitar erros e melhorar performance
  static const Color primaryColor = Color(0xFF1A237E);
  static const Color accentColor = Color(0xFF283593);
  static const Color backgroundColor = Color(0xFFF5F7FA);
  static const Color textColor = Color(0xFF263238);
  static const Color highlightColor = Colors.amberAccent;
  
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'DASHBOARD', 
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2)
        ),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [primaryColor, accentColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, $userName',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Painel de Controle de Aprendizagem',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'MÉTRICAS DO DIA',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 12),
            
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Row(
                children: [
                  _buildStatItem('0', 'Palavras', primaryColor),
                  _buildDivider(),
                  _buildStatItem('0', 'Lições', accentColor),
                  _buildDivider(),
                  _buildStatItem('0', 'Sequência', Colors.amber[800]!),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            Text(
              'MÓDULOS DE TREINAMENTO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                letterSpacing: 1.0,
              ),
            ),
            SizedBox(height: 12),
            
            
            _buildActivityCard(
              context,
              'Flashcards', // Removido "Executivos"
              'Terminologia técnica e vocabulário',
              Icons.style,
              primaryColor,
              'INICIAR',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FlashcardsScreen()),
                );
              },
            ),
            SizedBox(height: 12),
            
            
            _buildActivityCard(
              context,
              'Simulação de Conversa',
              'Prática de diálogo em tempo real',
              Icons.record_voice_over,
              accentColor,
              'CONECTAR',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ConversationScreen()),
                );
              },
            ),
            SizedBox(height: 12),
            
            
            _buildActivityCard(
              context,
              'Listening & Cultura',
              'Compreensão auditiva avançada',
              Icons.headset,
              Color(0xFF455A64),
              'ACESSAR',
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MusicScreen()),
                );
              },
            ),
            
            SizedBox(height: 24),
            
            // Meta Semanal
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber.withOpacity(0.5)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flag, color: Colors.amber[800], size: 20),
                      SizedBox(width: 8),
                      Text(
                        'OBJETIVO SEMANAL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[900],
                          letterSpacing: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Atingir 20 novos termos',
                        style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '0%',
                        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber[700]!),
                    minHeight: 6,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildStatItem(String value, String label, Color color) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(fontSize: 10, color: Colors.grey[600], letterSpacing: 0.5),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 30,
      width: 1,
      color: Colors.grey[300],
    );
  }
  
  Widget _buildActivityCard(
    BuildContext context,
    String title, 
    String subtitle, 
    IconData icon, 
    Color color, 
    String buttonText,
    VoidCallback onTap, 
  ) {
    return Material( 
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: color.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    fontSize: 10,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}