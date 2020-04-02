class Card
    attr_reader :face_value, :revealed

    def initialize(face_value)
        @face_value = face_value.to_s
        @revealed = false
    end

    def hide
        if @revealed == true
            @revealed = false
        end
    end

    def reveal
        if @revealed == false
            @revealed = true
        end
    end

    def to_s 
        @face_value.to_s
    end

    def ==(other_card)
        @face_value == other_card.to_s
    end
end

if __FILE__ == $PROGRAM_NAME
    card1 = Card.new(:dog)
    p card1.reveal
    p card1 #reveal is set to true
    p card1.hide
    p card1 #reveal is set to false
    card2 = Card.new(:cat)
    p card1 == card2 #false
    p card1 == card1 #true
end