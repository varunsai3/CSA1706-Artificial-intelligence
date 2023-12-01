from typing import Dict, List

def is_valid_coloring(graph: Dict[str, List[str]], coloring: Dict[str, str], node: str, color: str) -> bool:
    for neighbor in graph[node]:
        if neighbor in coloring and coloring[neighbor] == color:
            return False
    return True

def map_coloring(graph: Dict[str, List[str]], colors: List[str]) -> Dict[str, str]:
    coloring = {}
    nodes = list(graph.keys())

    def backtrack(node_index):
        if node_index == len(nodes):
            return True  # All nodes colored successfully

        current_node = nodes[node_index]
        for color in colors:
            if is_valid_coloring(graph, coloring, current_node, color):
                coloring[current_node] = color

                if backtrack(node_index + 1):
                    return True  # Move on to the next node
