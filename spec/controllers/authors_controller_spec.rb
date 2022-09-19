require 'rails_helper'

RSpec.describe AuthorsController, type: :controller do
  describe '#index' do
    subject { process :index }
    let!(:authors) { create_list(:author, 3) }

    it 'render the index template' do
      subject
      expect(response).to render_template(:index)
    end

    it 'assigns authors' do
      subject
      expect(assigns(:authors)).to match_array(authors)
    end
  end

  describe '#show' do
    subject { process :show, method: :get, params: params }
    let(:author) { create(:author) }
    let(:params) { { id: author.id } }

    it 'assign author' do
      subject
      expect(assigns(:author)).to eq(author)
    end

    it 'render the show template' do
      subject
      expect(response).to render_template(:show)
    end
  end

  describe '#new' do
    subject { process :new }

    it 'assign a new author' do
      subject
      expect(assigns(:author)).to be_a_new(Author)
    end

    it 'render the new template' do
      subject
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    subject { process :create, method: :post, params: params }
    let(:params) { { author: attributes_for(:author) } }

    it 'create a new author' do
      subject
      expect(assigns(:author)).to be_persisted
    end

    it 'redirect to author page' do
      subject
      expect(response).to redirect_to(author_path(assigns(:author)))
    end
  end

  describe '#edit' do
    subject { process :edit, method: :get, params: params }
    let(:author) { create(:author) }
    let(:params) { { id: author.id } }

    it 'assign author' do
      subject
      expect(assigns(:author)).to eq(author)
    end

    it 'render the edit template' do
      subject
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    subject { process :update, method: :put, params: params }
    let(:author) { create(:author) }
    let(:params) { { id: author.id, author: attributes_for(:author) } }

    it 'update the author' do
      subject
      expect(assigns(:author)).to eq(author)
    end

    it 'redirect to author page' do
      subject
      expect(response).to redirect_to(author_path(assigns(:author)))
    end
  end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }
    let(:author) { create(:author) }
    let(:params) { { id: author.id } }

    it 'destroys the author' do
      subject
      expect(Author.exists?(author.id)).to be_falsey
    end

    it 'redirect to authors page' do
      subject
      expect(response).to redirect_to(authors_path)
    end
  end
end
