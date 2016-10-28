#Error Class
class ExampleSaveError < StandardError
  attr_reader :reason
  def initialize(reason)
    @reason = reason
  end
end

#Usage Example
File.open(path, "w") do |file|
  begin
    #do something to save file
  rescue
    raise ExampleSaveError.new($!)
  end
end
