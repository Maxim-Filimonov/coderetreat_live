require 'spec_helper'

describe CoderetreatsController do
  describe "GET /running_today" do
    it "uses a coderetreats presenter" do
      coderetreats_presenter = stub
      CoderetreatLive::Coderetreats.stub(:running_today) { coderetreats_presenter }

      get :running_today
      expect(assigns(:coderetreats)).to be(coderetreats_presenter)
    end
  end

  describe 'GET /edit_status' do
    it 'assigns the coderetreat' do
      coderetreat = stub
      ::Coderetreat.stub(:find).with('5').and_return(coderetreat)
      get :edit_status, id: 5
      expect(assigns(:coderetreat)).to be(coderetreat)
    end
  end
end
