require "rspec"
require_relative "../game"

RSpec.describe Game do
  it "greets" do
    expect { Game.new($stdin, Winning.new) }.to output(/welcome/).to_stdout
  end

  describe "#start" do
    it "puts the player's piece on the board" do
      allow($stdin).to receive(:gets).and_return('1,1')
      condition = Winning.new
      # allow(condition).to receive(:check)
      game = nil
      expect { game = Game.new($stdin, condition) }.to output(/welcome/).to_stdout
      
      expect { game.start }.to output(/X../).to_stdout
    end

    it "alternates between two players" do
      allow($stdin).to receive(:gets).and_return('1,1', '1,2')
      condition = Winning.new
      allow(condition).to receive(:check).and_return(false, true)
      game = nil
      expect { game = Game.new($stdin, condition) }.to output(/welcome/).to_stdout

      expect { game.start }.to(
        output(/XO./).to_stdout
      )
    end

    context "when player 1 gets three in the first row" do
      it "outputs 'player 1 has won'" do
        allow($stdin).to receive(:gets).and_return(
          '1,1', '2,2',
          '1,2', '2,2',
          '1,3'
        )
        condition = Winning.new
        game = nil
        expect { game = Game.new($stdin, condition) }.to output(/welcome/).to_stdout
  
        expect { game.start }.to(
          output(/player 1 has won/).to_stdout
        )
      end
    end
  end
end
