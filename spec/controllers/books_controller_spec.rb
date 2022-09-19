require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  describe '#index' do
    subject { process :index }
    let!(:books) { create_list(:book, 3) }

    it 'render the index template' do
      subject
      expect(response).to render_template(:index)
    end

    it 'assigns books' do
      subject
      expect(assigns(:books)).to match_array(books)
    end
  end

  describe '#show' do
    subject { process :show, method: :get, params: params }
    let(:book) { create(:book) }
    let(:params) { { id: book.id } }

    it 'assigns book' do
      subject
      expect(assigns(:book)).to eq(book)
    end

    it 'renders the show template' do
      subject
      expect(response).to render_template(:show)
    end
  end

  describe '#new' do
    subject { process :new }

    it 'assigns a new book' do
      subject
      expect(assigns(:book)).to be_a_new(Book)
    end

    it 'renders the new template' do
      subject
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    subject { process :create, method: :post, params: params }

    let(:params) do
      { book: attributes_for(:book) }
    end

    it 'creates a new book' do
      expect { subject }.to change(Book, :count).by(1)
    end

    it 'redirect to book page' do
      subject
      expect(response).to redirect_to(book_path(assigns(:book)))
    end
  end

  describe '#edit' do
    subject { process :edit, method: :get, params: params }
    let(:book) { create(:book) }
    let(:params) { { id: book.id } }

    it 'assigns book' do
      subject
      expect(assigns(:book)).to eq(book)
    end

    it 'renders the edit template' do
      subject
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    subject { process :update, method: :put, params: params }
    let(:book) { create(:book) }
    let(:params) { { id: book.id, book: attributes_for(:book) } }

    it 'updates a book' do
      subject
      expect(assigns(:book)).to eq(book)
    end

    it 'redirect to book page' do
      subject
      expect(response).to redirect_to(book_path(assigns(:book)))
    end
  end

  describe '#destroy' do
    subject { process :destroy, method: :delete, params: params }
    let(:book) { create(:book) }
    let(:params) { { id: book.id } }

    it 'destroys the book' do
      subject
      expect(Book.exists?(book.id)).to be_falsey
    end

    it 'redirects to books page' do
      subject
      expect(response).to redirect_to(books_path)
    end
  end
end
