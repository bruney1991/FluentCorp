import 'package:flutter/material.dart';

class MusicScreen extends StatefulWidget {
  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  bool isPlaying = false;
  bool showTranslation = false;
  
  // Paleta Corporativa
  final Color primaryColor = Color(0xFF1A237E);
  final Color accentColor = Color(0xFF283593);
  final Color backgroundColor = Color(0xFFF5F7FA);
  final Color textColor = Color(0xFF263238);
  
  final Map<String, dynamic> currentSong = {
    'title': 'Business & Innovation',
    'artist': 'Podcast Series',
    'language': 'Inglês',
    'lyrics': [
      {'en': 'The market is evolving rapidly', 'pt': 'O mercado está evoluindo rapidamente'},
      {'en': 'We need to adapt our strategy', 'pt': 'Precisamos adaptar nossa estratégia'},
      {'en': 'Innovation is the key to success', 'pt': 'Inovação é a chave para o sucesso'},
      {'en': 'Let\'s analyze the quarterly results', 'pt': 'Vamos analisar os resultados trimestrais'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text('LISTENING CORPORATIVO', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 1.2)),
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF263238), Color(0xFF37474F)], // Dark grey gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))],
              ),
              child: Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(Icons.headset, size: 30, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    currentSong['title'],
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    currentSong['artist'],
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.skip_previous, color: Colors.white70),
                      SizedBox(width: 24),
                      GestureDetector(
                        onTap: () => setState(() => isPlaying = !isPlaying),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                          child: Icon(isPlaying ? Icons.pause : Icons.play_arrow, color: Color(0xFF263238)),
                        ),
                      ),
                      SizedBox(width: 24),
                      Icon(Icons.skip_next, color: Colors.white70),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TRANSCRIÇÃO',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600], letterSpacing: 1.0),
                ),
                Row(
                  children: [
                    Text('PT-BR', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: showTranslation ? primaryColor : Colors.grey)),
                    Switch(
                      value: showTranslation,
                      onChanged: (value) => setState(() => showTranslation = value),
                      activeColor: primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: ListView.separated(
                  padding: EdgeInsets.all(16),
                  itemCount: currentSong['lyrics'].length,
                  separatorBuilder: (_, __) => Divider(height: 24),
                  itemBuilder: (context, index) {
                    final lyric = currentSong['lyrics'][index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lyric['en'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
                        ),
                        if (showTranslation) ...[
                          SizedBox(height: 4),
                          Text(
                            lyric['pt'],
                            style: TextStyle(fontSize: 14, color: Colors.grey[600], fontStyle: FontStyle.italic),
                          ),
                        ],
                      ],
                    );
                  },
                ),
              ),
            ),
            
            SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.bookmark_border, size: 18),
                    label: Text('SALVAR'),
                    style: OutlinedButton.styleFrom(foregroundColor: textColor),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.check, size: 18),
                    label: Text('MARCAR COMO LIDO'),
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor, foregroundColor: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}