require 'spec_helper'

describe State do
  it { State.all.count.should > 0 } # Just to make sure you load some sample data before running these tests!

  describe '#find_state' do
    it { State.find_state('IN').state_name.should == 'Indiana' }
  end

  describe 'alias :abbr as #to_s' do
    let(:random_state) { State.offset(rand(State.all.count)).first }
    it { random_state.abbr.should==random_state.to_s }
  end
end
