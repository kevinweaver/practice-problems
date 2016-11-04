class Example
  def run
    return "hello world"
  end
end

require 'rspec/autorun'
RSpec.describe Example do
  let(:example){
    Example.new
  }

  it "prints output" do
    expect(example.run).to eq "hello world"
  end
end
