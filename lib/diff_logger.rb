require 'active_support/concern'

module DiffLogger

  DEFAULT_LOGGER = lambda { |changes| Rails.logger.info("Changes after update: #{changes.inspect}") }
  private_constant :DEFAULT_LOGGER

  module_function

  def custom(&blk)
    Module.new do
      DiffLogger.init_module(self, blk)
    end
  end

  def init_module(mod, log_cb)
    mod.extend ActiveSupport::Concern

    mod.included do
      before_update { |obj| log_cb.call(obj.changes) }
    end
  end

  init_module(self, DEFAULT_LOGGER)

end
