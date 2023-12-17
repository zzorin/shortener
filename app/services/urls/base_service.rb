module Urls
  class BaseService
    def self.call(params)
      new(params).call
    end

    def call
      raise NoMethodError
    end

    private

    attr_reader :params

    def initialize(params)
      @params = params
    end
  end
end