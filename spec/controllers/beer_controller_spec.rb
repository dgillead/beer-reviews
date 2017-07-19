require 'rails_helper'

describe BeersController do
  render_views

  describe 'GET /beers/new' do
    it 'displays a form for the user to create a new beer' do
      get :new, params: {}

      expect(response.body).to include('Create New Beer')
    end
  end

  describe 'POST /beers' do
    it 'creates a new beer with passed in params' do
      params = { name: 'Good Beer', type_of_beer: 'Wheat', alchohol_content: 9.8 }

        expect{ post :create, params: params }.to change{Beer.count}.by(1)
    end
  end
end
