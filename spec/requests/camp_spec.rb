require 'rails_helper'

RSpec.describe 'Camp API' , type: :request do
 #initialize the factory
  let!(:admin){create(:admin_user)}
  let!(:camps) {create_list(:camp, 1)}
  let!(:ratings){create_list(:rating, 1)}
  let(:camp_id)	{camps.first.id}

  setup do
    @header = {'X-User-Email': admin.email,
              'X-User-Token': admin.authentication_token
    }
  end

  # test  for the GET /camps
  describe 'GET /camps' do

  	#make http GET request before  '/camps'
    before {get '/camps'}
    it 'return camps' do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
    end

    it "returns status code 200" do
      expect(response).to have_http_status (200)
    end
  end


  # test for the GET  /camps/:id
  describe 'GET /camps/:id'  do
  	before {get "/camps/#{camp_id}"}
  	context 'when the record exist' do
  		it 'returns to camp' do
  			expect(json).not_to be_empty
  			expect(json[0]['id']).to eq(camp_id)
      end

      it 'returns status code 200' do
      	expect(response).to have_http_status(200)
      end
    end
  end

  # test of Post /campa
  describe 'Post /camps' do
  	let(:validate_attributes){ {name: "exponent", fees: "300" , course: "Web Development", website: "www.example.com"}}

  	context "when the request is valid" do
  		before { post '/camps' , params: validate_attributes, headers: @header}

  		it "create a camp" do
        expect(json['name']).equal?('exponent')

  		end

  		it "returns the status code 201" do
        expect(response).to have_http_status(201)
  		end
  	end

  	context "when request is not valid" do
  	  before{ post '/camps', params: {name: 'not camp'}, headers: @header}

  	  it "return status code 422" do
        expect(response).to  have_http_status(422)
      end

      # it "return the validation failure message" do
      #   expect(response.body).to match(/Validation failed: Fees can't be blank, Website can't be blank, Course can't be blank/)
      # end
    end
  end

  # test for put camps/:id
  describe 'PUT /camps/:id' do
    let(:validate_attributes){{name: 'not camp'}}

    context "when the record exist" do
      before {put "/camps/#{camp_id}", params: validate_attributes, headers: @header}

      it "updates the record" do
        expect(response.body).to be_empty
      end

      it "returns the code 204" do
      	expect(response).to  have_http_status(204)
      end
    end
  end

  # test for delete /camp:id
  describe  'DELETE /camps/:id' do
    before {delete "/camps/#{camp_id}", headers: @header}

    it "returns the code status 204" do
    	expect(response).to have_http_status(204)
    end
  end
end
