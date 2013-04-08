class window.HandView extends Backbone.View

  className: 'hand'

  #todo: switch to mustache
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'change', => @render()
    @collection.on 'add', => @render()
    @render()
    @collection.on 'lose', => 
      @$el.html '<div style="font-size:100px">BUST!</div>'
      $('.stand-button').hide()
      $('.hit-button').hide()
    @collection.on 'BlackJack', => @$el.html '<div style="font-size:100px">BlackJack</div>'
    @collection.on 'stand', => 
      $('.stand-button').hide()
      $('.hit-button').hide()


  render: ->
    @$el.children().detach
    @$el.html(@template @collection).append @collection.map (card) -> new CardView(model: card).el
    @$('.score').text @collection.scores()[0]
