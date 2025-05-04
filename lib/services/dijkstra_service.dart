class DijkstraService {
  // Dummy graph for testing
  Map<String, Map<String, int>> graph = {
    "Main Gate": {"Corridor": 2},
    "Corridor": {"Classroom 201": 3},
  };

  List<String> findShortestPath(String start, String end) {
    List<String> path = [];
    path.add(start);
    if (graph[start]?.containsKey(end) == true) {
      path.add(end);
    }
    return path;
  }
}
