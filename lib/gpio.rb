require 'yaml'

class GPIO
  CONFIG = YAML.load_file 'pins.yml'

  def initialize(pin_name)
    @pin = CONFIG[pin_name.to_s].to_i
    `gpio -g mode #{@pin} out`
  end

  def on
    `gpio -g write #{@pin} 1`
    nil
  end

  def off
    `gpio -g write #{@pin} 0`
    nil
  end

  def read
    `gpio -g read #{@pin}`.strip
  end
end
