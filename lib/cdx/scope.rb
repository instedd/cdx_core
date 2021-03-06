class Cdx::Scope
  attr_accessor :name, :fields

  def initialize name, fields
    @name = name
    @fields = fields.map do |name, definition|
      Cdx::Field.for self, name, definition
    end
  end

  def scoped_name
    name
  end

  def flatten
    @fields
  end

  def has_searchables?
    fields.any? &:searchable?
  end

  def root_scope
    self
  end
end
