class ActiveRecord
  def self.attribute(column_name)
    define_method column_name.to_sym do
      self.attributes[column_name]
    end
    
    define_method "#{column_name}=".to_sym do |value|
      self.attributes[column_name] = value
    end
  end
  
  def self.validates(column_name, presence: false, length: nil)
    validations[column_name] ||= {}
    validations[column_name][:presence] = true if presence
    validations[column_name][:length] = length if length
  end
  
  def save
    attributes.each do |column_name, value|
      validate(column_name, value)
    end
  end
  
  protected
  def attributes
    @attributes ||= {}
  end
    
  def self.validations
    @validations ||= {}
  end
  
  private
  def validate(column_name, value)
    # column_name = :paws
    # @validations = {paws: {presence: true}}
    if self.class.validations.has_key?(column_name)
      raise "No value for #{column_name}" if self.class.validations[column_name][:presence] && value.nil?
      if self.class.validations[column_name][:length]
        if self.class.validations[column_name][:length][:max] < value
          raise "Too high #{column_name}"
        end
        if self.class.validations[column_name][:length][:min] > value
          raise "Too low #{column_name}"
        end
      end
    end
  end
end

class Cow < ActiveRecord
  attribute :utters
  attribute :spots
  validates :utters, presence: true
  validates :spots, length: {max: 10}
end

require 'rspec/autorun'

RSpec.describe Cow do
  it 'is a cow' do
    expect(Cow.name).to eq 'Cow'
  end
  
  describe 'valiates' do
    it 'validates utter presence' do
      subject.utters = nil
      expect { subject.save }.to raise_error /utters/
    end
    
    it 'validates spot max' do
      subject.spots = 11
      expect { subject.save }.to raise_error /spots/
    end
  end
end
  
RSpec.describe ActiveRecord do
  after(:each) {
    @database = {}
  }
  describe "::attribute" do
    let(:dog) {
      class Dog < ActiveRecord
        attribute :paws
      end
      Dog.new 
    }
    it 'can add an attribute' do
      expect { dog.paws }.not_to raise_error
      dog.paws = 4
      expect(dog.paws).to eq 4
    end
  end
  
  describe '::validates' do
    context 'presence' do
      let(:dog) {
        class Dog < ActiveRecord
          attribute :paws
          validates :paws, presence: true
        end
        Dog.new 
      }
      context 'without paws' do
        before(:each) do
          dog.paws = nil
        end
        
        it 'raises an error on save' do
          expect { dog.save }.to raise_error /paws/
        end
      end
      
      context 'with paws' do
        before(:each) do
          dog.paws = 'test'
        end
        
        it 'saves correctly' do
          expect { dog.save }.to_not raise_error
        end
      end
    end
  end
end
