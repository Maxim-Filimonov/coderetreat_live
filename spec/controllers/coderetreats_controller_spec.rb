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
  describe 'PUT /update_status' do
    before do
      CoderetreatLive::Coderetreats::Status.stub(:update_to, nil)
    end
    it 'redirects back to the edit status page' do
      put :update_status, id: '5', new_status: 'in_session'
      expect(response).to redirect_to(edit_status_coderetreat_url("5"))
    end

    it 'updates the status of the coderetreat' do
      CoderetreatLive::Coderetreats::Status.should_receive(:update_to).with('5', 'in_session')

      put :update_status, id: '5', new_status: 'in_session'
    end
  end
end
