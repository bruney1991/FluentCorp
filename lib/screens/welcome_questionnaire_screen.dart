import 'package:flutter/material.dart';
import '../main.dart';

class WelcomeQuestionnaireScreen extends StatefulWidget {
  final String userName;
  
  const WelcomeQuestionnaireScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _WelcomeQuestionnaireScreenState createState() => _WelcomeQuestionnaireScreenState();
}

class _WelcomeQuestionnaireScreenState extends State<WelcomeQuestionnaireScreen> {
  int currentStep = 0;
  String selectedLanguage = '';
  String selectedLevel = '';
  String selectedTime = '';
  bool showVideo = false;

  // --- PALETA CORPORATIVA ---
  final Color primaryColor = Color(0xFF1A237E); // Azul Marinho
  final Color accentColor = Color(0xFF283593);  // Azul Indigo
  final Color backgroundColor = Color(0xFFF5F7FA); // Fundo claro
  final Color textColor = Color(0xFF263238); // Cinza escuro
  // -------------------------

  final List<String> languages = ['Inglês', 'Espanhol', 'Francês'];
  final List<String> levels = ['Iniciante', 'Básico', 'Intermediário', 'Avançado'];
  final List<String> studyTimes = ['15 min/dia', '30 min/dia', '1 hora/dia', '2+ horas/dia'];

  void _nextStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep++;
      });
    } else {
      setState(() {
        showVideo = true;
      });
    }
  }

  void _previousStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep--;
      });
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainScreen(userName: widget.userName),
      ),
    );
  }

  bool _canProceed() {
    switch (currentStep) {
      case 0:
        return selectedLanguage.isNotEmpty;
      case 1:
        return selectedLevel.isNotEmpty;
      case 2:
        return selectedTime.isNotEmpty;
      default:
        return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: showVideo ? _buildVideoSection() : _buildQuestionnaire(),
      ),
    );
  }

  Widget _buildVideoSection() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  'Como funciona o Fluent Corp', 
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor, 
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Assista ao vídeo e descubra todas as funcionalidades',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24),
          
          
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8), 
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [Color(0xFF1A237E), Color(0xFF3949AB)], // Gradiente Azul Marinho
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 64,
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Reproduzindo apresentação institucional...'),
                        backgroundColor: primaryColor,
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      size: 32,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 32),
          
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'O que você vai encontrar:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                SizedBox(height: 16),
                _buildFeatureItem(
                  Icons.style,
                  'Flashcards Executivos',
                  'Terminologia técnica e repetição espaçada',
                  primaryColor, 
                ),
                SizedBox(height: 12),
                _buildFeatureItem(
                  Icons.headset,
                  'Listening Corporativo',
                  'Aprenda com podcasts e áudios de negócios',
                  accentColor, 
                ),
                SizedBox(height: 12),
                _buildFeatureItem(
                  Icons.people,
                  'Networking Global',
                  'Pratique conversação profissional com colegas',
                  Color(0xFF455A64), 
                ),
              ],
            ),
          ),
          
          SizedBox(height: 32),
          
          
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.indigo[50], // Fundo azul bem claro
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.indigo[100]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seu plano personalizado:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 12),
                _buildSummaryRow(Icons.language, 'Idioma', selectedLanguage),
                SizedBox(height: 8),
                _buildSummaryRow(Icons.trending_up, 'Nível', selectedLevel),
                SizedBox(height: 8),
                _buildSummaryRow(Icons.schedule, 'Dedicação', selectedTime),
              ],
            ),
          ),
          
          SizedBox(height: 32),
          
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _finishOnboarding,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 2,
              ),
              child: Text(
                'ACESSAR DASHBOARD',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: primaryColor, size: 20),
        SizedBox(width: 8),
        Text('$label: ', style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
        Text(value, style: TextStyle(color: textColor)),
      ],
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionnaire() {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Text(
                  'Bem-vindo ao Fluent Corp',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),
                Text(
                  'Vamos personalizar sua experiência profissional',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                // Barra de Progresso
                LinearProgressIndicator(
                  value: (currentStep + 1) / 3,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                  minHeight: 4,
                ),
              ],
            ),
          ),
          
          Expanded(
            child: _buildCurrentStep(),
          ),
          
          Row(
            children: [
              if (currentStep > 0)
                Expanded(
                  child: OutlinedButton(
                    onPressed: _previousStep,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(color: Colors.grey[400]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'VOLTAR',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              if (currentStep > 0) SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _canProceed() ? _nextStep : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: Colors.grey[300],
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    currentStep == 2 ? 'VER APRESENTAÇÃO' : 'CONTINUAR',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (currentStep) {
      case 0:
        return _buildSelectionList('Idioma de Interesse', languages, selectedLanguage, (val) => setState(() => selectedLanguage = val), Icons.language);
      case 1:
        return _buildSelectionList('Nível de Conhecimento', levels, selectedLevel, (val) => setState(() => selectedLevel = val), Icons.trending_up);
      case 2:
        return _buildSelectionList('Disponibilidade Diária', studyTimes, selectedTime, (val) => setState(() => selectedTime = val), Icons.schedule);
      default:
        return Container();
    }
  }

 
  Widget _buildSelectionList(String title, List<String> options, String selectedValue, Function(String) onSelect, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Selecione uma das opções abaixo',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 32),
        Expanded(
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              final option = options[index];
              final isSelected = selectedValue == option;
              
              return Container(
                margin: EdgeInsets.only(bottom: 12),
                child: InkWell(
                  onTap: () => onSelect(option),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected ? primaryColor : Colors.white,
                      border: Border.all(
                        color: isSelected ? primaryColor : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8), 
                    ),
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: isSelected ? Colors.white : Colors.grey[500],
                        ),
                        SizedBox(width: 16),
                        Text(
                          option,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.white : textColor,
                          ),
                        ),
                        Spacer(),
                        if (isSelected)
                          Icon(
                            Icons.check_circle,
                            color: Colors.white, 
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}