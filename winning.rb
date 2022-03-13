class Winning
    def check(board)
        return true if board.rows.any? do |row|
            row.all?("X")
        end

        return true if board.columns.any? do |column|
            column.all?("X")
        end

        false
    end
end
