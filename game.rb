#!/bin/ruby

require_relative "board"

class Game
    def initialize(stdin, winning)
        @stdin = stdin
        @winning = winning
        @players = ["X", "O"]

        puts "Hello welcome to Three Men's Morris"
        @board = Board.new
        puts @board.to_s
    end

    def start
        current_player = 0
        loop do
            piece = @players[current_player]
            puts "player number #{current_player} choose where to put your piece"
            input = @stdin.gets.chomp

            coordinates = input.split(',').map(&:to_i)

            @board.put(coordinates, piece)
            puts @board.to_s

            break if @winning.check(@board)
            current_player = next_player(current_player)
        end
    end

    private def next_player(current_player)
        1 - current_player
    end
end

require_relative 'winning'
Game.new($stdin, Winning.new).start
