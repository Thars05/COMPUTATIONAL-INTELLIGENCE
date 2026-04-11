class Graph:
    def __init__(self):
        self.adj_list = {}

        self.weights = {}

    def add_node(self, node):
        if node not in self.adj_list:
            self.adj_list[node] = []
        else:
            print(f"Node '{node}' already exists.")

    def add_edge(self, u, v, cost=1):
        if u not in self.adj_list: self.add_node(u)
        if v not in self.adj_list: self.add_node(v)

        if v not in self.adj_list[u]:
            self.adj_list[u].append(v)
            self.adj_list[v].append(u)


        self.weights[(u, v)] = cost
        self.weights[(v, u)] = cost

    def delete_node(self, node):
        if node in self.adj_list:
            del self.adj_list[node]
            for key in self.adj_list:
                self.adj_list[key] = [n for n in self.adj_list[key] if n != node]

            keys_to_remove = [k for k in self.weights if node in k]
            for k in keys_to_remove:
                del self.weights[k]

            print(f"Node '{node}' deleted.")
        else:
            print("Node not found.")


    def delete_edge(self, u, v):

        if u in self.adj_list and v in self.adj_list:

            if v in self.adj_list[u]:
                self.adj_list[u].remove(v)
                self.adj_list[v].remove(u)
                self.weights.pop((u, v), None)
                self.weights.pop((v, u), None)

                print(f"Edge between '{u}' and '{v}' deleted.")
            else:
                print(f"No edge exists between '{u}' and '{v}'.")
        else:
            print("One or both nodes do not exist.")


    def display_adj_list(self):
        print("\n--- Adjacency List ---")
        if not self.adj_list:
            print("Graph is empty.")
        for node, neighbors in self.adj_list.items():
            print(f"{node}: {neighbors}")
        print("----------------------\n")

    # --- Breadth-First Search (BFS) ---
    def bfs_search(self, start, goal):
        if start not in self.adj_list : return "Start node does not exist."
        if goal not in self.adj_list: return "Goal node does not exist."

        fringe = [start]
        visited = []
        parent_map = {start: None}

        print(f"\n[Starting BFS Search]")

        while fringe:
            current = fringe.pop(0)

            if current == goal:
                path = []
                temp = goal
                while temp is not None:
                    path.append(temp)
                    temp = parent_map[temp]
                return f"Path Result: {' -> '.join(reversed(path))}"

            if current not in visited:
                visited.append(current)
                print(f"Visited: {current} | Fringe: {list(fringe)}")

                for neighbor in self.adj_list.get(current, []):
                    if neighbor not in visited and neighbor not in fringe:
                        parent_map[neighbor] = current
                        fringe.append(neighbor)

        return "Goal not reachable."

    # --- Depth-First Search (DFS) ---
    def dfs_search(self, start, goal):
        if start not in self.adj_list : return "Start node does not exist."
        if goal not in self.adj_list: return "Goal node does not exist."

        fringe = [start]
        visited = []
        parent_map = {start: None}

        print(f"\n[Starting DFS Search]")

        while fringe:
            current = fringe.pop()

            if current == goal:
                path = []
                temp = goal
                while temp is not None:
                    path.append(temp)
                    temp = parent_map[temp]
                return f"Path Result: {' -> '.join(reversed(path))}"

            if current not in visited:
                visited.append(current)
                print(f"Visited: {current} | Fringe: {list(fringe)}")

                for neighbor in self.adj_list.get(current, []):
                    if neighbor not in visited:

                        parent_map[neighbor] = current
                        fringe.append(neighbor)

        return "Goal not reachable."

    # --- Uniform Cost Search (UCS) ---
    def ucs_search(self, start, goal):
        if start not in self.adj_list : return "Start node does not exist."
        if goal not in self.adj_list: return "Goal node does not exist."

        fringe = [(0, start)]
        visited_costs = {start: 0}
        parent_map = {start: None}

        print(f"\n[Starting UCS Search]")

        while fringe:

            fringe.sort()

            current_cost, current = fringe.pop(0)

            if current == goal:
                path = []
                temp = goal
                while temp is not None:
                    path.append(temp)
                    temp = parent_map[temp]
                return f"Path Result (Cost: {current_cost}): {' -> '.join(reversed(path))}"

            print(f"Exploring: {current} (Cost: {current_cost}) | Fringe: {fringe}")

            for neighbor in self.adj_list.get(current, []):
                weight = self.weights.get((current, neighbor), 1)
                new_cost = current_cost + weight

                if neighbor not in visited_costs or new_cost < visited_costs[neighbor]:
                    visited_costs[neighbor] = new_cost
                    parent_map[neighbor] = current
                    fringe.append((new_cost, neighbor))

        return "Goal not reachable."

def main():
    g = Graph()

    print("--- Graph Initialization ---")
    try:
        num_nodes = int(input("How many nodes to add? "))
        for _ in range(num_nodes):
            g.add_node(input("  Enter node name: "))

        num_edges = int(input("\nHow many edges to add? "))
        for i in range(num_edges):
            print(f"Edge {i+1}:")
            u = input("  From Node: ")
            v = input("  To Node: ")
            try:
                w = int(input("  Weight (Default 1): ") or 1)
            except:
                w = 1
            g.add_edge(u, v, w)
    except ValueError:
        print("Invalid input count.")

    while True:
        print("\n=== SEARCH INTERFACE ===")
        print("1. Add Node")
        print("2. Add Edge")
        print("3. Delete Node")
        print("4. Delete Edge")
        print("5. Display Adjacency List")
        print("6. Search (BFS/DFS/UCS)")
        print("7. Exit")

        choice = input("Select Option: ")

        if choice == '1':
            g.add_node(input("Enter node name: "))
        elif choice == '2':
            u = input("From: ")
            v = input("To: ")
            try:
                w = int(input("Weight: "))
            except:
                print("Invalid weight, using 1.")
                w = 1
            g.add_edge(u, v, w)
        elif choice == '3':
            g.delete_node(input("Enter node name: "))
        elif choice == '4':
            # <--- Logic for Delete Edge
            u = input("From Node: ")
            v = input("To Node: ")
            g.delete_edge(u, v)
        elif choice == '5':
            g.display_adj_list()
        elif choice == '6':
            print("\nChoose Technique:")
            print("A. BFS (Breadth-First Search)")
            print("B. DFS (Depth-First Search)")
            print("C. UCS (Uniform Cost Search)")
            tech = input("Selection: ").upper()

            if tech in ['A', 'B', 'C']:
                start_node = input("Enter start node: ")
                goal_node = input("Enter goal node: ")

                if tech == 'A':
                    print(g.bfs_search(start_node, goal_node))
                elif tech == 'B':
                    print(g.dfs_search(start_node, goal_node))
                elif tech == 'C':
                    print(g.ucs_search(start_node, goal_node))
            else:
                print("Invalid Technique choice.")
        elif choice == '7':
            print("Exiting...")
            break
        else:
            print("Invalid Menu choice.")

if __name__ == "__main__":
    main()
