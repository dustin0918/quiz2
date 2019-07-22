require 'rails_helper'
require 'faker'
RSpec.describe IdeasController, type: :controller do 
    describe '#new' do 
        it "renders a new template" do 
            get (:new)
            expect(response).to (render_template(:new))
        end
        it "sets an instance variable with a new Idea" do 
            get (:new)
            expect(assigns(:idea)).to(be_a_new(Idea))
        end
        describe '#create' do 
            context 'with valid parameters'do 
                def valid_request 
                    post(:create, params: { idea: FactoryBot.attributes_for(:idea)})
                end
                it 'create a new idea in the datebase' do 
                    count_before = Idea.count 
                    valid_request 
                    count_after = Idea.count 
                    expect(count_after).to eq(count_before + 1)
                end
                it 'redirects to the show page' do 
                    valid_request
                    expect(response).to(
                        redirect_to(idea_path(Idea.last))
                    )
                end
            end
        end
    end
    context 'with invalid parameters' do 
        def invalid_request
            post(:create, params:{ idea: FactoryBot.attributes_for(:idea, title:nil)})
        end
        it 'does not save in the datebase' do 
            count_before = Idea.count 
            invalid_request 
            count_after = Idea.count 
            expect(count_after).to eq(count_before)
        end
        it 'renders the new template' do 
            invalid_request
            expect(response).to render_template(:new)
        end
    end




end
