require "rspec"
require_relative "../board"

RSpec.describe Board do
    it "should print the board" do
        board = Board.new
        expect(board.to_s).to eq("...
...
...")
    end

    it "should print piece" do
        board = Board.new
        board.put([1,1], 'X')
        expect(board.to_s).to eq("X..
...
...")
    end

    it "should print piece" do
        board = Board.new
        board.put([1,1], 'X')
        board.put([2,1], 'X')
        board.put([3,1], 'X')
        expect(board.to_s).to eq("X..
X..
X..")
    end

    it "should print piece" do
        board = Board.new
        board.put([1,1], 'X')
        board.put([1,2], 'X')
        board.put([1,3], 'X')
        expect(board.to_s).to eq("XXX
...
...")
    end

    describe "#rows" do
        it "returns the rows" do
            board = Board.new
            board.put([1,2], 'X')
            expect(board.rows).to eq(
                [[".", "X", "."], [".", ".", "."], [".", ".", "."]]
            )
        end
    end

    describe "#columns" do
        it "returns the columns" do
            board = Board.new
            board.put([1,1], 'X')
            board.put([1,2], 'X')
            board.put([1,3], 'X')
            expect(board.columns).to eq(
                [["X", ".", "."], ["X", ".", "."], ["X", ".", "."]]
            )
        end
    end
end
