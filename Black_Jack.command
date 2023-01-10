#!/usr/bin/env python

from Dealer import *

class Black_Jack:

    def __init__(self):
        no_of_players= int(input("enter no of players: "))
        self.players_list = []
        self.dealer = Dealer()
        #self.bets_list = []
        for i in range(no_of_players):
            self.players_list.append(Player(input("Enter Player " + str(i + 1) + " Name: "), 100))

    def firstRound(self):
        for i in range(2):
            for player in self.players_list:
                player.addCard(self.dealer.dealCardToPlayer())
        self.dealer.dealCardToSelf()

    def show_board_decorator(self,func):
        def wrapper():
            print("-" * 20 + " BOARD " + "-" * 20)
            func()
            print("-" * 20+" XXXXX "+"-"*20)
        return wrapper

    #@show_board_decorator
    def show_board(self):
        self.dealer.showCards()
        [player.showCards() for player in self.players_list]

    def place_bets(self):
        self.dealer.new_deck()
        self.dealer.clear_cards()
        for player in self.players_list:
            player.clear_cards()
            bet = int(input("Player "+player.name+" place your bets Between 1 to "+str(player.money)+": "))
            if bet in range(1, player.money+1):
                player.placeBet(bet)

    def player_turn(self):
        for player in self.players_list:
            while True:
                player.showCards()
                choice = input("Player "+player.name+" Do you want to Stand or Hit (S/H) ")
                if choice == "S":
                    break
                else:
                    player.addCard(self.dealer.dealCardToPlayer())
                    if player.calcScore() > 21:
                        player.showCards()
                        print("Player "+player.name+" is Bust")
                        break
                    elif player.calcScore() == 21:
                        player.showCards()
                        print("Player "+player.name+" Black Jack")
                        break

    def dealerTurn(self):
        self.dealer.showCards()
        while self.dealer.calcScore() < 17:
            self.dealer.dealCardToSelf()
            self.dealer.showCards()

    def pay_out(self):
        #Each player is checked whether Bust or has Black Jack or beats Dealer
        for player in self.players_list:
            if player.calcScore() > 21 or (player.calcScore() < self.dealer.calcScore() and self.dealer.calcScore()<=21):
                print("Player " + player.name + " Loses " + str(player.bet))
                player.sub_money()
            elif player.calcScore() == self.dealer.calcScore():
                print("Player " + player.name + " Draw with Dealer ")
            else:
                # If players dont have 21, they lose money hence negative sign
                print("Player " + player.name + " Wins " + str(player.bet))
                player.add_money()

game = Black_Jack()

while True:
    game.place_bets()
    game.firstRound()
    game.show_board()
    game.player_turn()
    game.dealerTurn()
    game.show_board()
    game.pay_out()

    if input("Do you want to Continue? (Y/N) ").upper() == "N":
        break

