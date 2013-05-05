require 'active_record_spec_helper'
require 'coderetreat'

describe "Looking up coderetreats" do
  describe '.running_today' do
    context 'when there is no coderetreats' do 
      it 'returns an empty list' do
        Coderetreat.destroy_all
        expect(Coderetreat.running_today).to be_empty
      end
    end
  end
end
