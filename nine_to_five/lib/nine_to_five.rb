require "nine_to_five/version"
require "nine_to_five/railtie"

module NineToFive
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      [200, {}, ["hello world"]]
    end
  end
end
