require "rspec"
require_relative "../winning"

RSpec.describe Winning do
    context "when the board is empty" do
        it "returns false" do
            board = Board.new
            condition = Winning.new.check(board)
            expect(condition).to eq(false)
        end
    end

    context "when the board has only one X on the top row" do
        it "returns false" do
            board = Board.new
            board.put([1,1], 'X')
            condition = Winning.new.check(board)
            expect(condition).to eq(false)
        end
    end

    context "when the board has three X's on the top row" do
        it "returns true" do
            board = Board.new
            board.put([1,1], 'X')
            board.put([1,2], 'X')
            board.put([1,3], 'X')
            condition = Winning.new.check(board)
            expect(condition).to eq(true)
        end
    end

    context "when the board has three X's in the first column" do
        it "returns true" do
            board = Board.new
            board.put([1,1], 'X')
            board.put([2,1], 'X')
            board.put([3,1], 'X')
            condition = Winning.new.check(board)
            expect(condition).to eq(true)
        end
    end
end
