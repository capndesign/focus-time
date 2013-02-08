class stopwatch
  duration:   null
  direction:  'down'
  timer:      null
  current:    null
  interval:   1000
  el:         $('.timer')

  constructor: (seconds, direction) ->
    @duration = seconds
    @direction = direction
    console.log @direction
    if @direction is 'up'
      @current = 0
    else
      @current = @duration
    @el.html @counterDisplay @current

  counterDisplay: (seconds) ->
    h = Math.floor(seconds / 60 / 60)
    m = Math.floor((seconds / 60) % 60)
    s = seconds % 60

    padZero = (num) ->
      if num < 10
        "0" + num
      else
        num

    "#{h}:#{padZero m}:#{padZero s}"

  countDown: =>
    if @current is 0
      @stop()
      return
    @current--
    @el.html @counterDisplay @current

  countUp: =>
    if @current is @duration
      @stop()
      return
    @current++
    @el.html @counterDisplay @current

  start: (direction) ->
    func = if @direction is 'up' then @countUp else @countDown
    clearInterval(@timer)
    @timer = setInterval(func, @interval)

  stop: ->
    console.log 'stop'
    clearInterval(@timer)


$ ->
  testing = new stopwatch(5)
  
  $('.start').click ->
    testing.start()

  $('.stop').click ->
    testing.stop()