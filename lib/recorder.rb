require 'recorder/config'
require 'recorder/version'
require 'recorder/changeset'
require 'recorder/observer'
require 'recorder/rails/controller_concern'
require 'recorder/rails/railtie' if defined? ::Rails::Railtie

require 'request_store'

module Recorder
  class << self
    # Switches Recorder on or off.
    # @api public
    def enabled=(value)
      Recorder.config.enabled = value
    end

    # Returns `true` if Recorder is on, `false` otherwise.
    # Recorder is enabled by default.
    # @api public
    def enabled?
      !!Recorder.config.enabled
    end

    # Sets Recorder information from the controller.
    # @api public
    def info=(hash)
      self.store.merge!(hash)
    end

    # Sets Recorder meta information.
    # @api public
    def meta=(hash)
      self.store[:meta] = hash
    end

    # Returns a boolean indicating whether "protected attibutes" should be
    # configured, e.g. attr_accessible.
    def active_record_protected_attributes?
      @active_record_protected_attributes ||= !!defined?(ProtectedAttributes)
    end

    # Returns Recorder's configuration object.
    # @api private
    def config
      @config ||= Recorder::Config.instance
      yield @config if block_given?
      @config
    end

    # Returns version of Recorder as +String+
    def version
      VERSION::STRING
    end

    # Thread-safe hash to hold Recorder's data.
    # @api private
    def store
      RequestStore.store[:recorder] ||= { }
    end
  end
end

# if defined?(Sidekiq)
#   require 'recorder/sidekiq/revisions_worker'
# end

require 'recorder/revision'
