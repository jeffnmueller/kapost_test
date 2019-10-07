module ErrorSerializer
  def self.serialize obj
    obj.errors.messages.map do |field, errors|
      errors.map do |error|
        {
          status: 422,
          source: { pointer: "/data/attributes/#{field}" },
          field: field,
          detail: error
        }
      end
    end.flatten
  end
end
