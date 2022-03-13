class Board
    def initialize
        @board = [
            [".",".","."],
            [".",".","."],
            [".",".","."],
        ]
    end

    def to_s
        rows.map(&:join).join("\n")
    end

    def put(coordinates, piece)
        @board[coordinates[1]-1][coordinates[0]-1] = piece
    end

    def rows
        @board.transpose
    end

    def columns
        @board
    end
end
