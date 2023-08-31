# frozen_string_literal: true

require './app/adapters/tasks/shared/task'
require 'byebug'

Dir.glob('./app/adapters/tasks/*.rb').each do |file|
  require file
end

class TasksConfig
  def self.run_all_tasks
    tasks = Task.registered_classes

    tasks.each do |task|
      task.run
    end
  end
end
