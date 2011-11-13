$: << 'lib'

require 'songsterr'

# Allow to check
module Boolean; end
class TrueClass; include Boolean; end
class FalseClass; include Boolean; end

