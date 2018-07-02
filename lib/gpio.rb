class GPIO
  def initialize(pin)
    @pin = pin
    `gpio mode #{@pin} out`
  end

  def on
    `gpio write #{@pin} 1`
  end

  def off
    `gpio write #{@pin} 0`
  end
end
