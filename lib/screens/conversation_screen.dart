import 'package:flutter/material.dart';
import 'dart:math';

class ConversationScreen extends StatefulWidget {
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  bool isSearching = false;
  bool isConnected = false;
  bool isMuted = false;
  bool isSpeakerOn = false;
  String currentPartner = '';
  String partnerLevel = '';
  String partnerCountry = '';
  int callDuration = 0;
  
  // Paleta Corporativa
  final Color primaryColor = Color(0xFF1A237E);
  final Color accentColor = Color(0xFF283593);
  final Color backgroundColor = Color(0xFFF5F7FA);
  final Color textColor = Color(0xFF263238);

  final List<Map<String, String>> mockUsers = [
    {'name': 'Maria Santos', 'level': 'Intermediário', 'country': 'Brasil', 'avatar': 'M'},
    {'name': 'John Smith', 'level': 'Avançado', 'country': 'EUA', 'avatar': 'J'},
    {'name': 'Pierre Dubois', 'level': 'Básico', 'country': 'França', 'avatar': 'P'},
  ];

  void _startSearching() async {
    setState(() {
      isSearching = true;
    });

    await Future.delayed(Duration(seconds: 3));
    
    final random = Random();
    final selectedUser = mockUsers[random.nextInt(mockUsers.length)];
    
    setState(() {
      isSearching = false;
      isConnected = true;
      currentPartner = selectedUser['name']!;
      partnerLevel = selectedUser['level']!;
      partnerCountry = selectedUser['country']!;
    });

    _startCallTimer();
  }

  void _startCallTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (isConnected) {
        setState(() {
          callDuration++;
        });
        _startCallTimer();
      }
    });
  }

  void _endCall() {
    setState(() {
      isConnected = false;
      isSearching = false;
      callDuration = 0;
      currentPartner = '';
      partnerLevel = '';
      partnerCountry = '';
      isMuted = false;
      isSpeakerOn = false;
    });
  }

  String _formatDuration(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('SIMULAÇÃO DE CONVERSA', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (!isSearching && !isConnected) _buildWelcomeSection(),
            if (isSearching) _buildSearchingSection(),
            if (isConnected) _buildCallSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: primaryColor.withOpacity(0.2), width: 2),
            ),
            child: Icon(
              Icons.groups,
              size: 50,
              color: primaryColor,
            ),
          ),
          
          SizedBox(height: 32),
          
          Text(
            'Prática Profissional',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 16),
          
          Text(
            'Conecte-se com colegas globais para simular situações de negócios',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          
          SizedBox(height: 32),
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              children: [
                Icon(Icons.lightbulb_outline, color: accentColor, size: 28),
                SizedBox(height: 12),
                Text(
                  'DIRETRIZES DE COMUNICAÇÃO',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: accentColor,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '• Mantenha o profissionalismo\n• Use vocabulário formal\n• Foque em clareza e objetividade',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 40),
          
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton.icon(
              onPressed: _startSearching,
              icon: Icon(Icons.search, size: 20),
              label: Text(
                'INICIAR SESSÃO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchingSection() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            strokeWidth: 4,
          ),
          SizedBox(height: 32),
          Text(
            'Localizando parceiro...',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Buscando perfil compatível com seu nível',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          SizedBox(height: 40),
          OutlinedButton(
            onPressed: () {
              setState(() {
                isSearching = false;
              });
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: textColor,
              side: BorderSide(color: Colors.grey[400]!),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('CANCELAR'),
          ),
        ],
      ),
    );
  }

  Widget _buildCallSection() {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: primaryColor,
                  child: Text(
                    currentPartner.isNotEmpty ? currentPartner[0] : 'U',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  currentPartner,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTag(partnerLevel),
                    SizedBox(width: 8),
                    _buildTag(partnerCountry),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  _formatDuration(callDuration),
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w300,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24),
          
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PAUTA SUGERIDA',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600]),
                ),
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildTopicChip('Projetos'),
                    _buildTopicChip('Carreira'),
                    _buildTopicChip('Tecnologia'),
                    _buildTopicChip('Mercado'),
                  ],
                ),
              ],
            ),
          ),
          
          Spacer(),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlBtn(
                icon: isMuted ? Icons.mic_off : Icons.mic,
                active: isMuted,
                onTap: () => setState(() => isMuted = !isMuted),
              ),
              GestureDetector(
                onTap: _endCall,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color(0xFFC62828), // Red 800
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.call_end, size: 28, color: Colors.white),
                ),
              ),
              _buildControlBtn(
                icon: isSpeakerOn ? Icons.volume_up : Icons.volume_down,
                active: isSpeakerOn,
                onTap: () => setState(() => isSpeakerOn = !isSpeakerOn),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(fontSize: 12, color: textColor)),
    );
  }

  Widget _buildTopicChip(String topic) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: primaryColor.withOpacity(0.2)),
      ),
      child: Text(
        topic.toUpperCase(),
        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: primaryColor),
      ),
    );
  }
  
  Widget _buildControlBtn({required IconData icon, required bool active, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: active ? Colors.grey[300] : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Icon(icon, color: textColor, size: 24),
      ),
    );
  }
}