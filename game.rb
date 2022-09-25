require "./deck.rb"
require "pry"

class Game
    attr_reader :deck, :player_one, :player_two
    def initialize
        @deck = Deck.new
        @player_one = ["Starting"]
        @player_two = ["Starting"]
    end

    def player_decks
        deck_1,deck_2 = @deck.shuffle.each_slice( (@deck.deck.size/2.0).round ).to_a
        @player_one = deck_1
        @player_two = deck_2
    end

    def game_start
        player_decks
        while @player_one.size != 0 || @player_two.size != 0
            player_one = @player_one[0]
            player_two = @player_two[0]

            if player_one == player_two 
                puts "Player_one puts #{player_one}, Player_two puts #{player_two}"
                puts "IT'S WAR!!"
                player_one_total = @player_one[0..3].sum
                player_two_total = @player_two[0..3].sum
                puts "Player One total is #{player_one_total}, PLayer Two total is #{player_two_total}"
                if player_one_total > player_two_total
                    puts "Player One WINS!"
                    cards = @player_two.shift(4)
                    @player_one << cards
                    @player_one << @player_one.shift
                    @player_one.flatten!
                elsif player_two_total > player_one_total
                    puts "Player Two Wins"
                    cards = @player_one.shift(4)
                    @player_two << cards
                    @player_two << @player_two.shift
                    @player_two.flatten!
                elsif player_one_total == player_two_total
                    @player_one.shift(4)
                    @player_two.shift(4)
                end
            elsif player_one > player_two && player_one < 11 
                puts "Player_one puts #{player_one}, Player_two puts #{player_two}. Player_one Wins!"
                card = @player_two.shift
                @player_one << card
                @player_one << @player_one.shift
            elsif player_two > player_one && player_two < 11
                puts "Player_one puts #{player_one}, Player_two puts #{player_two}. Player_Two Wins!"
                card = @player_one.shift
                @player_two << card
                @player_two << @player_two.shift
            elsif player_one > player_two && player_one > 10
                player_two = @deck.royal_values[player_two] if player_two > 10
                puts "Player_one puts #{@deck.royal_values[player_one]}, Player_two puts #{player_two}. Player_one Wins!"
                card = @player_two.shift
                @player_one << card
                @player_one << @player_one.shift
            elsif player_two > player_one && player_two > 10
                player_one = @deck.royal_values[@player_one[0]] if player_one > 10 
                puts "Player_one puts #{player_one}, Player_two puts #{@deck.royal_values[player_two]}. Player_two Wins!"
                card = @player_one.shift
                @player_two << card
                @player_two << @player_two.shift
            end
           break if @player_one.size == 0 || @player_two.size == 0
        end

        if @player_one.size == 0
            puts "Congratulations Player Two For Winning!!!!"
        else
            puts "Congratulations Player One For Winning!!!!" 
        end
    end
end


x = Game.new

puts x.game_start