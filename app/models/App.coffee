#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'stand', =>
      playerScore = (@get 'playerHand').scores()[0]
      (@get 'dealerHand').models[0].flip()
      while (@get 'dealerHand').scores()[0] < 17
      	(@get 'dealerHand').hit()    
      if (@get 'dealerHand').scores()[0] < playerScore or (@get 'dealerHand').scores()[0] > 21
      	alert 'You Win'
      else alert '!!Give Me Your $ Sucka!!'  