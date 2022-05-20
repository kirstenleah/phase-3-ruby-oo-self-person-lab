# your code goes here
require 'pry'
class Person
    attr_accessor :bank_account
    attr_reader :name, :happiness, :hygiene

    def initialize(name)
        @name = name
        @bank_account = 25
        @happiness = 8
        @hygiene = 8
    end


#Only used if you have attr_reader only without attr_accessor
    # def bank_account=(value)
    #     @bank_account = value
    # end
    # def bank_account
    #     @bank_account
    # end

    def happiness=(value)
        if value.between?(0, 10)
            @happiness = value
        elsif value > 10
            @happiness = 10
        else
            @happiness = 0
        end
    end

    def hygiene=(value)
        @hygiene = if value > 10
            10
        elsif value < 0
            0
        else
            value
        end
    end

    def clean?
        self.hygiene > 7
    end

    def happy?
        self.happiness > 7
    end

    def get_paid(amount)
        self.bank_account += amount
        "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        "♪ Rub-a-dub just relaxing in the tub ♫" 
    end

    def work_out
        self.hygiene -= 3
        self.happiness += 2
        "♪ another one bites the dust ♫"
    end

    def call_friend(person = Person.new)
        person.happiness += 3
        self.happiness += 3
        "Hi #{person.name}! It's #{self.name}. How are you?"
    end

    def start_conversation(friend, topic)
        if topic == "politics"
            friend.happiness -= 2
            self.happiness -= 2
            "blah blah partisan blah lobbyist"
        elsif topic == "weather"
            [self, friend].each { |person| person.happiness += 1}
            "blah blah sun blah rain"
        else
            "blah blah blah blah blah"
        end
    end

end
