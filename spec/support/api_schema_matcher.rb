RSpec::Matchers.define :match_json_schema do |schema, version = 'v1'|
  match do |response|
    schema_directory = "#{Dir.pwd}/spec/support/schemas/#{version}"
    schema_path = "#{schema_directory}/#{schema}.json"
    JSON::Validator.validate!(schema_path, response.body, strict: true)
  end
end
