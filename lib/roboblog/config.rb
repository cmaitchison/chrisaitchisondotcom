module Roboblog
  class Config < SimpleDelegator
    def initialize(file_name)
      super(symbolize_keys(YAML::load(IO.read(file_name))))
    end

    def [](*path)
      path.inject(__getobj__()) {|config, item|
        config[item]
      }
    end

    private

    def symbolize_keys(hash)
      hash.inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value.is_a?(Hash) ? symbolize_keys(value) : value
        options
      end
    end
  end
end