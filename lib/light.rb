require 'lib/gpio'

class Light
  def initialize(pin_name)
    @gpio = GPIO.new pin_name
  end

  def on!
    @gpio.off!
  end

  def off!
    @gpio.on!
  end

  def on?
    @gpio.off?
  end

  def off?
    ! on?
  end
end
