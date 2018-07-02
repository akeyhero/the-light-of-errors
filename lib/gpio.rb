class GPIO
  def initialize(pin)
    @pin = pin
    `gpio mode #{@pin} out`
  end

  def on
    `gpio write #{@pin} 1`
    nil
  end

  def off
    `gpio write #{@pin} 0`
    nil
  end

  def read
    `gpio read #{@pin}`.strip
  end
end
