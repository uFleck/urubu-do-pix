# frozen_string_literal: true

module Entity
  def to_hash
    hash = {}

    self.instance_variables.each do |var|
      key = var.to_s.sub("@", "").to_sym
      value = self.instance_variable_get(var)
      hash[key] = value
    end

    hash
  end
end
