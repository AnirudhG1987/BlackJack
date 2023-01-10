from Cards import *
from Player import *

class Dealer(Player):
    def __init__(self):
        Player .__init__(self,"Dealer",100000)
        self.deck = Deck()

    def new_deck(self):
        self.deck = Deck()

    def dealCardToPlayer(self):
        return next(self.deck.getCard())

    def dealCardToSelf(self):
        self.addCard(next(self.deck.getCard()))
