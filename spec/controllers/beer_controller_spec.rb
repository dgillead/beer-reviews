require 'rails_helper'

describe BeersController do
  render_views

  describe 'GET /beers/new' do
    it 'displays a form for the user to create a new beer' do
      get :new, params: {}

      expect(response.body).to include('Create New Beer')
    end
  end
end
