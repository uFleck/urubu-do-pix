# frozen_string_literal: true

module Task
  def self.included(base)
    registered_classes << base
  end

  def self.registered_classes
    @registered_classes ||= []
  end

  def run
    raise NotImplementedError, "Tasks must have a run method"
  end
end
