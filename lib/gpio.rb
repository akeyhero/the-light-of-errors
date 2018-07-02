require 'yaml'

class GPIO
  CONFIG = YAML.load_file 'pins.yml'

  def initialize(pin_name)
    @pin = CONFIG[pin_name.to_s]
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
