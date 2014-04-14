require 'spec_helper'

describe RecurringTask do
	
	it { should validate_presence_of :description }
	it { should validate_presence_of :frequency }
	it { should validate_presence_of :reference_date }

end