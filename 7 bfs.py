from collections import defaultdict, deque

class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def add_edge(self, u, v):
        self.graph[u].append(v)
        self.graph[v].append(u)  # Assuming an undirected graph

    def bfs(self, start):
        visited = set()
        queue = deque([start])
        result = []

        while queue:
            current_node = queue.popleft()
            if current_node not in visited:
                result.append(current_node)
                visited.add(current_node)
                queue.extend(self.graph[current_node])

        return result

# Example usage:
if __name__ == "__main__":
    # Create a graph
    g = Graph()
    g.add_edge(0, 1)
    g.add_edge(0, 2)
    g.add_edge(1, 0)
    g.add_edge(1,3)
    g.add_edge(1,4)
    g.add_edge(4,4)

    start_node = 0
    print(f"BFS starting from node {start_node}: {g.bfs(start_node)}")
