class Deck
    attr_reader :deck, :royal_values
    def initialize 
        @royal_values = {
            11 => "J",
            12 => "Q",
            13 => "K",
            14 => "A"
        }
        @deck = [2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,6,6,6,6,7,7,7,7,8,8,8,8,9,9,9,9,10,10,10,10,11,11,11,11,12,12,12,12,13,13,13,13,14,14,14,14]
    end

    def shuffle
        @deck.shuffle
    end
end