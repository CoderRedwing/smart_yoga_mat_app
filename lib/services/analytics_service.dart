class AnalyticsService {
  int totalSessions = 0;
  Map<String, int> functionUsage = {
    'Warm-Up': 0,
    'Relaxation Mode': 0,
  };

  // Log a session with a specific function
  void logSession(String function) {
    totalSessions += 1;
    if (functionUsage.containsKey(function)) {
      functionUsage[function] = functionUsage[function]! + 1;
    } else {
      functionUsage[function] = 1;
    }
  }

  // Retrieve analytics data
  Map<String, dynamic> getAnalyticsData() {
    return {
      'totalSessions': totalSessions,
      'functionUsage': functionUsage,
    };
  }
}
