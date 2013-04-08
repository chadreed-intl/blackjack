#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    compare = =>
      playerScore = (@get 'playerHand').scores()[0]
      if (@get 'dealerHand').scores()[0] < playerScore or (@get 'dealerHand').scores()[0] > 21
        alert 'You Win'
      else alert '!!Give Me Your $ Sucka!!'
    dealCard = =>
      if (@get 'dealerHand').scores()[0] < 17
        setTimeout (=>
          (@get 'dealerHand').hit()
          dealCard()
          ), 500 
      else
        compare()
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    (@get 'playerHand').on 'stand', =>
      (@get 'dealerHand').models[0].flip()
      dealCard()

        