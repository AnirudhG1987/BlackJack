
class Player:

    def __init__(self,name,money):
        self.cards = []
        self.score = 0
        self.name = name
        self.money = money
        self.bet = 0

    def placeBet(self,bet):
        self.bet = bet

    def addCard(self,card):
        self.cards.append(card)

    def add_money(self):
        self.money += self.bet
        self.show_money()

    def sub_money(self):
        self.money -= self.bet
        self.show_money()

    def show_money(self):
        print(self.name + " has "+str(self.money)+ " left")

    def calcScore(self):
        cardValue_list = [card.cardValue() for card in self.cards]
        #print(cardValue_list)
        no_of_Aces = cardValue_list.count(11)
        #print(no_of_Aces)
        self.score = sum(cardValue_list)
        if self.score > 21:
            for i in range(no_of_Aces):
                self.score-=10
                if self.score<=21:
                    break
        return self.score

    def showSingleCard(self):
        print(self.cards[0])
        print(" Score of " + str(self.calcScore()))

    def showCards(self):
        print("Player " + self.name + " cards: ", end = '')
        [print(card,end='') for card in self.cards]
        print(" Score of " + str(self.calcScore()))

    def clear_cards(self):
        self.bet = 0
        self.cards = []
        self.score = 0

