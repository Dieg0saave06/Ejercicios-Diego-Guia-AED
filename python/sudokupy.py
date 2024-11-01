
# Función para imprimir el tablero de Sudoku
def print_board(board):
    for i in range(9):
        if i % 3 == 0 and i != 0:
            print("- - - - - - - - - - - - ")
        for j in range(9):
            if j % 3 == 0 and j != 0:
                print(" | ", end="")
            if j == 8:
                print(board[i][j])
            else:
                print(str(board[i][j]) + " ", end="")

# Función para encontrar una celda vacía en el tablero
def find_empty(board):
    for i in range(9):
        for j in range(9):
            if board[i][j] == 0:
                return (i, j)  # Fila, columna
    return None

# Función que verifica si es válido colocar un número en una posición dada
def is_valid(board, num, pos):
    # Verifica fila
    for i in range(9):
        if board[pos[0]][i] == num and pos[1] != i:
            return False

    # Verifica columna
    for i in range(9):
        if board[i][pos[1]] == num and pos[0] != i:
            return False

    # Verifica subcuadrícula 3x3
    box_x = pos[1] // 3
    box_y = pos[0] // 3
    for i in range(box_y * 3, box_y * 3 + 3):
        for j in range(box_x * 3, box_x * 3 + 3):
            if board[i][j] == num and (i, j) != pos:
                return False

    return True

# Función que resuelve el Sudoku utilizando backtracking
def solve(board):
    empty = find_empty(board)
    if not empty:
        return True  # Se ha resuelto
    else:
        row, col = empty

    for num in range(1, 10):
        if is_valid(board, num, (row, col)):
            board[row][col] = num

            if solve(board):
                return True

            board[row][col] = 0

    return False

# Función principal del juego
def play_sudoku():
    # Tablero de Sudoku inicial (0 representa una celda vacía)
    board = [
        [5, 3, 0, 0, 7, 0, 0, 0, 0],
        [6, 0, 0, 1, 9, 5, 0, 0, 0],
        [0, 9, 8, 0, 0, 0, 0, 6, 0],
        [8, 0, 0, 0, 6, 0, 0, 0, 3],
        [4, 0, 0, 8, 0, 3, 0, 0, 1],
        [7, 0, 0, 0, 2, 0, 0, 0, 6],
        [0, 6, 0, 0, 0, 0, 2, 8, 0],
        [0, 0, 0, 4, 1, 9, 0, 0, 5],
        [0, 0, 0, 0, 8, 0, 0, 7, 9]
    ]

    print("Sudoku inicial:")
    print_board(board)

    while True:
        try:
            print("\nIntroduce una posición y un número para jugar (fila, columna, número) o '0 0 0' para resolver:")
            fila, columna, numero = map(int, input().split())

            if fila == 0 and columna == 0 and numero == 0:
                break

            if not (1 <= fila <= 9 and 1 <= columna <= 9 and 1 <= numero <= 9):
                print("Entrada no válida. Fila, columna y número deben estar entre 1 y 9.")
                continue

            if board[fila-1][columna-1] != 0:
                print("La celda ya está ocupada. Intenta en otra posición.")
                continue

            if is_valid(board, numero, (fila-1, columna-1)):
                board[fila-1][columna-1] = numero
                print_board(board)
            else:
                print("Movimiento inválido. El número ya está en la fila, columna o subcuadrícula.")

        except ValueError:
            print("Entrada no válida. Introduce tres números separados por espacios.")

    print("\nResolviendo Sudoku...")
    if solve(board):
        print("Sudoku resuelto:")
        print_board(board)
    else:
        print("No se pudo resolver el Sudoku.")

# Iniciar el juego
play_sudoku()
