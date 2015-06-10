require "cdx/version"
require "cdx/field"
require "cdx/scope"

module Cdx
  def self.core_fields
    @core_fields ||= scopes.map do |scope|
      scope.fields
    end.flatten
  end

  def self.core_field_scopes
    @scopes ||= YAML.load_file(File.join(File.dirname(__FILE__), "config", "fields.yml")).map do |scope_name, fields|
      Scope.new(scope_name, fields)
    end
  end
end
