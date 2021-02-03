# frozen_string_literal: true

require 'rails_helper'

describe CampaignsController do
  let(:logged_in_user) { create(:user) }
  let(:valid_json_web_token) do
    JsonWebToken.encode_token(logged_in_user).first
  end
  let(:headers) { { 'Authorization' => valid_json_web_token } }

  let!(:tag) { create(:tag) }
  let!(:sub_tag) { create(:sub_tag, tag: tag) }

  let(:tag_ids) { [] }

  let(:valid_params) do
    {
      title: 'Test',
      purpose: 'Testing',
      estimated_duration: 'within_3_months',
      tag_ids: tag_ids
    }
  end

  def response_body
    JSON.parse(response.body)
  end

  def do_json_create
    request.headers.merge!(headers)
    post :create, params: { campaign: valid_params }
  end

  describe 'POST #create with json request' do
    context 'with valid params' do
      it 'should create a record' do
        do_json_create
        campaign = Campaign.last

        expect(response).to have_http_status(:ok)
        expect(response_body).to eq(
          {
            id: campaign.id,
            title: campaign.title,
            purpose: campaign.purpose,
            estimated_duration: campaign.estimated_duration,
            user_id: campaign.user_id
          }.with_indifferent_access
        )
        expect(campaign.estimated_duration).to eq('within_3_months')
      end
    end

    context 'when tags are present in params' do
      let(:tag_ids) { [tag.id, sub_tag.id] }

      it 'should assign tags' do
        do_json_create

        campaign = Campaign.last
        expect(campaign.tags).to eq([tag])
        expect(campaign.sub_tags).to eq([sub_tag])
      end
    end

    describe 'validations' do
      let(:valid_params) do
        { title: '', purpose: '', estimated_duration: '' }
      end

      context 'when title is not present' do
        it 'returns error message' do
          do_json_create

          expect(response.body).to include('Title can\'t be blank')
          expect(response.body).to include('Purpose can\'t be blank')
          expect(response.body).to include('Estimated duration can\'t be blank')
          expect(response.body).to include('Estimated duration is not included in the list')
        end
      end
    end
  end
end
