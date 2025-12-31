import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:adai/feature/test_bracelet/data/models/sensor_data_model.dart';

class BraceletTestView extends StatefulWidget {
  const BraceletTestView({super.key});

  @override
  State<BraceletTestView> createState() => _BraceletTestViewState();
}

class _BraceletTestViewState extends State<BraceletTestView> {
  static const String baseUrl = 'http://192.168.4.1';
  static const Duration timeout = Duration(seconds: 5);

  SensorDataModel? _sensorData;
  String _statusMessage = 'Press button to connect';
  bool _isLoading = false;
  bool _isConnected = false;
  Timer? _refreshTimer;

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _fetchSensorData() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _statusMessage = 'Fetching data...';
    });

    try {
      final response = await http
          .get(Uri.parse('$baseUrl/api/sensor-data'))
          .timeout(timeout);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        setState(() {
          _sensorData = SensorDataModel.fromJson(json);
          _statusMessage = 'Connected - Data received';
          _isConnected = true;
        });
      } else {
        setState(() {
          _statusMessage = 'Error: HTTP ${response.statusCode}';
          _isConnected = false;
        });
      }
    } on TimeoutException {
      setState(() {
        _statusMessage = 'Error: Connection timeout\nCheck WiFi connection';
        _isConnected = false;
      });
    } catch (e) {
      setState(() {
        _statusMessage =
            'Error: ${e.toString()}\nMake sure WiFi is connected to HealthMonitor_AP';
        _isConnected = false;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startAutoRefresh() {
    _refreshTimer?.cancel();
    _fetchSensorData();
    _refreshTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _fetchSensorData();
    });
  }

  void _stopAutoRefresh() {
    _refreshTimer?.cancel();
    setState(() {
      _isConnected = false;
      _statusMessage = 'Disconnected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('ESP32 Bracelet Test'),
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Connection Info
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'WiFi: HealthMonitor_AP',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const Text(
                    'Password: 12345678',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const Text(
                    'IP: 192.168.4.1',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        _isConnected ? Icons.check_circle : Icons.error,
                        color: _isConnected ? Colors.green : Colors.red,
                        size: 16,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _statusMessage,
                          style: TextStyle(
                            color: _isConnected ? Colors.green : Colors.orange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Connect Button
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _startAutoRefresh,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      _isLoading ? 'Connecting...' : 'Connect & Fetch Data',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _isConnected ? _stopAutoRefresh : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 24,
                    ),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sensor Data Display
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SENSOR DATA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    const SizedBox(height: 8),
                    _buildDataSection('MAX30102 - Health Sensor', [
                      'Heart Rate: ${_sensorData?.heartRate ?? '--'} BPM',
                      'SpO2: ${_sensorData?.spo2 ?? '--'} %',
                      'Temperature: ${_sensorData?.temperature.toStringAsFixed(1) ?? '--'} °C',
                      'Hand Detected: ${_sensorData?.handDetected ?? false ? 'YES' : 'NO'}',
                    ]),
                    const SizedBox(height: 16),
                    _buildDataSection('MPU6050 - Acceleration', [
                      'X: ${_sensorData?.acceleration.x ?? '--'}',
                      'Y: ${_sensorData?.acceleration.y ?? '--'}',
                      'Z: ${_sensorData?.acceleration.z ?? '--'}',
                    ]),
                    const SizedBox(height: 16),
                    _buildDataSection('MPU6050 - Gyroscope', [
                      'X: ${_sensorData?.gyroscope.x ?? '--'}',
                      'Y: ${_sensorData?.gyroscope.y ?? '--'}',
                      'Z: ${_sensorData?.gyroscope.z ?? '--'}',
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection(String title, List<String> data) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.cyan,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...data.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                item,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
