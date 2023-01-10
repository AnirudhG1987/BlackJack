from random import sample

suits_list = ['Spade', 'Club', 'Heart', 'Diamond']
faces_list = ['Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King']
values_list = [11,2,3,4,5,6,7,8,9,10,10,10,10]


class Card:

    def __init__(self,num):
        #print(num)
        self.card = (faces_list[num%13],suits_list[int(num/13)])
        self.value = values_list[int(num%13)]

    def cardValue(self):
        return self.value

    def __str__(self):
        return str(self.card)

class Deck:

    def __init__(self):
        pass
        #self.deckOfCards = [Card(x) for x in sample(range(0,52),52)]

    # Generator example. makes the cards only when asked for.

    def getCard(self):
        #def getCardGenerator():
        for x in sample(range(0,52),52):
            yield Card(x)
        #for card in getCardGenerator():
        #    return card


if __name__ == "__main__":
    d= Deck()
    print(next(d.getCard()))

