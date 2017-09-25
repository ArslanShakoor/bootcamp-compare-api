require 'rails_helper'
RSpec.describe 'Rating API', type: :request do
  let!(:camps){create(:camp)}
  let!(:ratings){create(:rating)}
  let(:camp_id){ratings.camp_id}

  # test for GET /ratings/:id
  describe 'GET /ratings/:id'  do
    before {get "/ratings/#{camp_id}"}
    context 'when the record exist' do
      it 'returns the ratings' do
        expect(json).not_to be_empty
        expect(json[0]['camp_id']).to eq(camp_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # test for POSR /ratings
  describe 'POST /ratings' do
    let(:validate_attributes){ {name: "Arslan Shakoor", email:"marketingco@gmail.com" , title: "this is great solution and well",
       description: "You have done the great achievement in this solution", overall_review: 4, instructor_review: 1,
        curriculum_review: 4, job_assistance_review: 5, camp_id: ratings.camp_id }}
    before {post "/ratings", params: validate_attributes}
    context "when our ratings are successfully created" do
      it "creates the ratings" do
        expect(json[:email]).equal?('marketingco@gmail.com')
      end

      it "return the status code 201" do
        expect(response).to have_http_status(201)
      end
    end

  end


end
