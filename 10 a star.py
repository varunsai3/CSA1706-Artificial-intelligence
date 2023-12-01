import heapq

class Node:
    def __init__(self, state, parent=None, action=None, cost=0, heuristic=0):
        self.state = state
        self.parent = parent
        self.action = action
        self.cost = cost
        self.heuristic = heuristic

    def __lt__(self, other):
        return (self.cost + self.heuristic) < (other.cost + other.heuristic)

def astar_search(start_state, goal_state, successors, heuristic):
    start_node = Node(state=start_state, cost=0, heuristic=heuristic(start_state))
    frontier = [start_node]
    explored = set()

    while frontier:
        current_node = heapq.heappop(frontier)

        if current_node.state == goal_state:
            return build_path(current_node)

        explored.add(current_node.state)

        for action, successor_state, step_cost in successors(current_node.state):
            if successor_state not in explored:
                new_cost = current_node.cost + step_cost
                new_heuristic = heuristic(successor_state)
                new_node = Node(
                    state=successor_state,
                    parent=current_node,
                    action=action,
                    cost=new_cost,
                    heuristic=new_heuristic
                )
                heapq.heappush(frontier, new_node)

    return None  # No path found

def build_path(node):
    path = []
    while node:
        path.append((node.action, node.state))
        node = node.parent
    return list(reversed(path))

# Example usage:
def successors(state):
    # Define the graph and successors here
    # Example: state is a tuple representing a grid position (x, y)
    x, y = state
    possible_moves = [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]
    valid_moves = [(x, y) for x, y in possible_moves if 0 <= x < 5 and 0 <= y < 5]  # Example: 5x5 grid
    return [('move', move, 1) for move in valid_moves]

def heuristic(state):
    # Example: Euclidean distance to the goal
    goal_state = (4, 4)
    return ((state[0] - goal_state[0]) ** 2 + (state[1] - goal_state[1]) ** 2) ** 0.5

start_state = (0, 0)
goal_state = (4, 4)

path = astar_search(start_state, goal_state, successors, heuristic)
print("A* Path:", path)
