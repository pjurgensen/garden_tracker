require 'spec_helper'

describe GardenTask do
	
	it { should validate_presence_of :description }
	it { should validate_presence_of :date }


end