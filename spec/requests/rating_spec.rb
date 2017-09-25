require 'rails_helper'
RSpec.describe 'Rating API', type: :request do
  let!(:users){create(:user)}
  let!(:camps){create(:camp)}
  let!(:ratings){create(:rating)}
  let(:camp_id){ratings.camp_id}

  # return the @header
  setup do
    @header = {'X-User-Email': users.email,
              'X-User-Token': users.authentication_token
    }
  end

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

  # test for POST /ratings
  describe 'POST /ratings' do
    let(:validate_attributes){ {name: "Arslan Shakoor", email:"marketingco@gmail.com" , title: "this is great solution and well",
       description: "You have done the great achievement in this solution", overall_review: 4, instructor_review: 1,
       curriculum_review: 4, job_assistance_review: 5, camp_id: ratings.camp_id }}

    context "when ratings are successfully created" do
      before {post "/ratings", params: validate_attributes}
      it "creates the ratings" do
        expect(json[:email]).equal?('user@user.com')
      end

      it "return the status code 201" do
        expect(response).to have_http_status(201)
      end

    end

    context "when ratings have not created successfully" do
      before {post "/ratings", params: {name: "Tamoor Shakoor"}}

      it "returns request is invlid with code 422" do
        expect(response).to have_http_status(422)
      end

      it "return the validation failure message" do
        expect(response.body).to include("Validation failed: Email can't be blank, Email is too short (minimum is 10 characters), Overall review can't be blank, Overall review is not included in the list, Curriculum review can't be blank, Curriculum review is not included in the list, Job assistance review can't be blank, Job assistance review is not included in the list, Instructor review can't be blank, Instructor review is not included in the list, Title can't be blank, Title is too short (minimum is 10 characters), Description can't be blank, Description is too short (minimum is 50 characters), Camp can't be blank")
      end
    end
  end

  # test the GET /ratings/user_camp
  describe "GET /ratings/user_camp" do
    before {get "/ratings/user_camp" , headers: @header}

    context "when the request is successfull" do

      it "returns the the status code 200" do
        expect(response).to have_http_status(200)
      end

      it "returns the ratings content" do
        expect(json[0][:email]).equal?('user@user.com')
      end

    end

  end


end
