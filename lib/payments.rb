# frozen_string_literal: true

require "faraday"

module Payments
  def self.configure
    yield configuration if block_given?
  end

  def self.configuration
    @configuration ||= Payments::Configuration.new
  end

  def self.configuration=(object)
    raise ConfigError, "Expected configuration to be a Payments::Configuration" unless object.is_a?(Payments::Configuration)

    @configuration = object
  end

  def self.reset_configuration!
    @configuration = Payments::Configuration.new
  end

  class << self
    alias_method :config, :configuration
    alias_method :config=, :configuration=
    alias_method :reset_config!, :reset_configuration!
  end
end
