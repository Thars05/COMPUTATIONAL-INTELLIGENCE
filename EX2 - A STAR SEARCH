class Graph:
    def __init__(self):
        self.adj = {}

    def add_node(self, node):
        if node not in self.adj:
            self.adj[node] = []
            print(f"Node '{node}' added.")
        else:
            print(f"Node '{node}' already exists.")

    def add_edge(self, n1, n2, cost):
        if n1 in self.adj and n2 in self.adj:
            self.adj[n1].append((n2, cost))
            self.adj[n2].append((n1, cost))
            print(f"Edge added between {n1} and {n2} with cost {cost}.")
        else:
            print("One or both nodes do not exist.")

    def delete_node(self, node):
        if node in self.adj:
            for other_node in self.adj:
                self.adj[other_node] = [edge for edge in self.adj[other_node] if edge[0] != node]
            del self.adj[node]
            print(f"Node '{node}' deleted.")
        else:
            print(f"Node '{node}' not found.")

    def delete_edge(self, n1, n2):
        if n1 in self.adj and n2 in self.adj:
            self.adj[n1] = [edge for edge in self.adj[n1] if edge[0] != n2]
            self.adj[n2] = [edge for edge in self.adj[n2] if edge[0] != n1]
            print(f"Edge between {n1} and {n2} deleted.")
        else:
            print("Nodes not found.")

    def display(self):
        print("\n--- Current Graph Structure ---")
        for i in self.adj:
            print(i, "->", self.adj[i])

def a_star_search(graph, start, goal, heuristic):
    if start not in graph.adj or goal not in graph.adj:
        print("Start or Goal node not in graph.")
        return None, float('inf')

    open_list = [start]
    closed_list = []
    g = {node: float('inf') for node in graph.adj}
    f = {node: float('inf') for node in graph.adj}

    g[start] = 0
    f[start] = heuristic[start]
    parent = {start: None}

    step = 0
    print(f"\n--- Starting A* Search: {start} to {goal} ---")

    while open_list:
        step += 1
        current = min(open_list, key=lambda x: f[x])
        print(f"\nStep {step}: Expanding Node: '{current}' | f(n)={f[current]}")

        if current == goal:
            print(f"Goal reached!")
            path = []
            while current is not None:
                path.append(current)
                current = parent[current]
            path.reverse()
            return path, g[goal]

        open_list.remove(current)
        closed_list.append(current)

        for neighbor, cost in graph.adj[current]:
            if neighbor in closed_list:
                continue

            new_g = g[current] + cost
            new_f = new_g + heuristic[neighbor]

            if neighbor not in open_list:
                open_list.append(neighbor)
            elif new_f >= f.get(neighbor, float('inf')):
                continue

            parent[neighbor] = current
            g[neighbor] = new_g
            f[neighbor] = new_f
            print(f"    - Updated neighbor: {neighbor} (f={f[neighbor]})")

    return None, float('inf')

def main():
    graph = Graph()
    heuristic = {}

    # --- Initial Input Section ---
    n = int(input("Enter number of nodes: "))
    for _ in range(n):
        node = input("Enter node: ")
        graph.add_node(node)

    e = int(input("Enter number of edges: "))
    for _ in range(e):
        n1 = input("Enter node 1: ")
        n2 = input("Enter node 2: ")
        cost = int(input("Enter cost: "))
        graph.add_edge(n1, n2, cost)

    # --- Menu Section (Printed Once) ---
    print("\n========= MENU =========")
    print("1. Add Node")
    print("2. Add Edge")
    print("3. Delete Node")
    print("4. Delete Edge")
    print("5. A* Search")
    print("6. Display Graph")
    print("7. Exit")

    while True:
        choice = input("\nEnter choice: ")

        if choice == '1':
            node = input("Enter node name: ")
            graph.add_node(node)

        elif choice == '2':
            n1 = input("Enter node 1: ")
            n2 = input("Enter node 2: ")
            cost = int(input("Enter edge cost: "))
            graph.add_edge(n1, n2, cost)

        elif choice == '3':
            node = input("Enter node name to delete: ")
            graph.delete_node(node)

        elif choice == '4':
            n1 = input("Enter node 1: ")
            n2 = input("Enter node 2: ")
            graph.delete_edge(n1, n2)

        elif choice == '5':
            if not graph.adj:
                print("Graph is empty.")
                continue

            print("\nEnter heuristic values (h(n)):")
            for node in graph.adj:
                heuristic[node] = int(input(f"  Heuristic for {node}: "))

            start = input("Enter start node: ")
            goal = input("Enter goal node: ")
            path, cost = a_star_search(graph, start, goal, heuristic)

            if path:
                print("\nFINAL PATH:", " -> ".join(path))
                print("TOTAL COST:", cost)
            else:
                print("\nNO PATH FOUND")

        elif choice == '6':
            graph.display()

        elif choice == '7':
            print("Exiting...")
            break
        else:
            print("Invalid choice! Try again.")

if __name__ == "__main__":
    main()
