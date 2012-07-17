require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ResponseSetsController do

  # This should return the minimal set of attributes required to create a valid
  # ResponseSet. As you add validations to ResponseSet, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResponseSetsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all response_sets as @response_sets" do
      response_set = ResponseSet.create! valid_attributes
      get :index, {}, valid_session
      assigns(:response_sets).should eq([response_set])
    end
  end

  describe "GET show" do
    it "assigns the requested response_set as @response_set" do
      response_set = ResponseSet.create! valid_attributes
      get :show, {:id => response_set.to_param}, valid_session
      assigns(:response_set).should eq(response_set)
    end
  end

  describe "GET new" do
    it "assigns a new response_set as @response_set" do
      get :new, {}, valid_session
      assigns(:response_set).should be_a_new(ResponseSet)
    end
  end

  describe "GET edit" do
    it "assigns the requested response_set as @response_set" do
      response_set = ResponseSet.create! valid_attributes
      get :edit, {:id => response_set.to_param}, valid_session
      assigns(:response_set).should eq(response_set)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ResponseSet" do
        expect {
          post :create, {:response_set => valid_attributes}, valid_session
        }.to change(ResponseSet, :count).by(1)
      end

      it "assigns a newly created response_set as @response_set" do
        post :create, {:response_set => valid_attributes}, valid_session
        assigns(:response_set).should be_a(ResponseSet)
        assigns(:response_set).should be_persisted
      end

      it "redirects to the created response_set" do
        post :create, {:response_set => valid_attributes}, valid_session
        response.should redirect_to(ResponseSet.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved response_set as @response_set" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResponseSet.any_instance.stub(:save).and_return(false)
        post :create, {:response_set => {}}, valid_session
        assigns(:response_set).should be_a_new(ResponseSet)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ResponseSet.any_instance.stub(:save).and_return(false)
        post :create, {:response_set => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested response_set" do
        response_set = ResponseSet.create! valid_attributes
        # Assuming there are no other response_sets in the database, this
        # specifies that the ResponseSet created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ResponseSet.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => response_set.to_param, :response_set => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested response_set as @response_set" do
        response_set = ResponseSet.create! valid_attributes
        put :update, {:id => response_set.to_param, :response_set => valid_attributes}, valid_session
        assigns(:response_set).should eq(response_set)
      end

      it "redirects to the response_set" do
        response_set = ResponseSet.create! valid_attributes
        put :update, {:id => response_set.to_param, :response_set => valid_attributes}, valid_session
        response.should redirect_to(response_set)
      end
    end

    describe "with invalid params" do
      it "assigns the response_set as @response_set" do
        response_set = ResponseSet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResponseSet.any_instance.stub(:save).and_return(false)
        put :update, {:id => response_set.to_param, :response_set => {}}, valid_session
        assigns(:response_set).should eq(response_set)
      end

      it "re-renders the 'edit' template" do
        response_set = ResponseSet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ResponseSet.any_instance.stub(:save).and_return(false)
        put :update, {:id => response_set.to_param, :response_set => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested response_set" do
      response_set = ResponseSet.create! valid_attributes
      expect {
        delete :destroy, {:id => response_set.to_param}, valid_session
      }.to change(ResponseSet, :count).by(-1)
    end

    it "redirects to the response_sets list" do
      response_set = ResponseSet.create! valid_attributes
      delete :destroy, {:id => response_set.to_param}, valid_session
      response.should redirect_to(response_sets_url)
    end
  end

end