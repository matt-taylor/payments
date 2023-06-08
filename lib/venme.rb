# frozen_string_literal: true

require "faraday"
require "rollday/configuration"
require "rollday/errors"
require "rollday/middleware"
require "rollday/version"

module Venme
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Venme::Configuration.new
  end

  def self.configuration=(object)
    raise ConfigError, "Expected configuration to be a Venme::Configuration" unless object.is_a?(Rollday::Configuration)

    @configuration = object
  end

  def self.reset_configuration!
    @configuration = Venme::Configuration.new
  end

  class << self
    alias_method :config, :configuration
    alias_method :config=, :configuration=
    alias_method :reset_config!, :reset_configuration!
  end
end
