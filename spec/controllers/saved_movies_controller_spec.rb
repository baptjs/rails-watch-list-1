require 'rails_helper'
begin
  require "saved_movies_controller"
rescue LoadError
end

if defined?(SavedMoviesController)
  RSpec.describe SavedMoviesController, type: :controller do

    before(:each) do
      @movie = Movie.create!(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic, 84 years later.")
      @list = List.new(name: "Drama")
    end

    let(:valid_attributes) do
      { name: "Comedy" }
    end

    let(:invalid_attributes) do
      { name: "" }
    end

    describe "GET new" do
      it "assigns a new list as @list" do
        get :new, params: { movie_id: @movie.id }
        expect(assigns(:movie)).to eq(@movie)
        expect(assigns(:list)).to be_a_new(List)
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new List" do
          expect {
            post :create, params: { movie_id: @movie.id, list: valid_attributes }
          }.to change(List, :count).by(1)
        end

        it "assigns a newly created list as @list" do
          post :create, params: { movie_id: @movie.id, list: valid_attributes }
          expect(assigns(:list)).to be_a(List)
          expect(assigns(:list)).to be_persisted
        end

        it "redirects to the created list" do
          post :create, params: { movie_id: @movie.id, list: valid_attributes }
          expect(response).to redirect_to(@movie)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved list as @list" do
          post :create, params: { movie_id: @movie.id, list: invalid_attributes }
          expect(assigns(:list)).to be_a_new(List)
        end

        it "re-renders the 'new' template" do
          post :create, params: { movie_id: @movie.id, list: invalid_attributes }
          expect(response).to render_template("new")
        end
      end
    end

    describe "DELETE destroy" do
      it "deletes a List" do
        @list = List.create!(valid_attributes)
        expect {
          delete :destroy, params: { id: @list.id }
        }.to change(List, :count).by(-1)
      end
    end
  end
else
  describe "SavedMoviesController" do
    it "should exist" do
      expect(defined?(SavedMoviesController)).to eq(true)
    end
  end
end
