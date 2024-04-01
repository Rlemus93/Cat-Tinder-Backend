require 'rails_helper'

RSpec.describe 'Cats', type: :request do
  describe 'GET /index' do
    it 'returns a successful http status' do
      get cats_path
      expect(response).to have_http_status(200)
    end
  end
  describe  'POST /create' do
    it 'returns a successful http status and creates a valid cat' do
      post cats_path, params: {
        cat: {
          name: 'test cat 1',
          age: 1,
          enjoys: 'passing tests',
          image: 'https://images.unsplash.com/photo-1583795128727-6ec3642408f8?q=80&w=2714&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'test cat 1').first
      expect(cat.valid?).to eq(true)
      expect(response).to have_http_status(200)
    end
    it 'returns an http status error for an ivalid cat' do
      post cats_path, params: {
        cat: {
          name: nil,
          age: nil,
          enjoys: nil,
          image: nil
        }
      }
      cat = Cat.where(name:nil).first 
      expect(cat).to eq(nil)
      expect(response).to have_http_status(422)
    end
  end


  describe 'PATCH /update' do
    it 'return a http status of success makes valid updates to a cat' do
      post cats_path, params: {
        cat: {
          name: 'Test cat',
          age: 4,
          enjoys: 'testing attribute for enjoys',
          image: 'https://images.unsplash.com/photo-1543852786-1cf6624b9987?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat').first
      patch cat_path(cat), params: {
        cat: {
          name: 'Test cat for patch',
          age: 5,
          enjoys: 'updated testing attribute for enjoys',
          image: 'https://images.unsplash.com/photo-1577023311546-cdc07a8454d9?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
        }
      }
      cat = Cat.where(name: 'Test cat for patch').first
      expect(cat.name).to eq('Test cat for patch')
      expect(cat.age).to eq(5)
      expect(cat.enjoys).to eq('updated testing attribute for enjoys')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1577023311546-cdc07a8454d9?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(response).to have_http_status(200)
    end
    it 'returns an http status error for an invalid cat' do
      post cats_path, params: {
    cat: {
      name: 'Test cat for patch',
      age: 5,
      enjoys: 'updated testing attribute for enjoys',
      image: 'https://images.unsplash.com/photo-1577023311546-cdc07a8454d9?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    }
  }

    cat = Cat.where(name: 'Test cat for patch').first
    expect(cat).not_to be_nil

      patch cat_path(cat.id), params: {
        cat: {
          name: nil,
          age: nil,
          enjoys: nil,
          image: nil
        }
      }
      cat = Cat.where(name: 'Test cat for patch').first
      expect(cat.name).to eq('Test cat for patch')
      expect(cat.age).to eq(5)
      expect(cat.enjoys).to eq('updated testing attribute for enjoys')
      expect(cat.image).to eq('https://images.unsplash.com/photo-1577023311546-cdc07a8454d9?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
      expect(response).to have_http_status(422)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'deletes the cat' do
      cat = Cat.create(
        name: 'Test Cat for delete request', 
        age: 5, 
        enjoys: 'Test for enjoys attribute', 
        image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
      )
      delete cat_path(cat)
      cat = Cat.where(name: 'Test Cat for delete request').first
      expect(cat).to eq(nil)
    end
  end

  # it "doesn't create a cat without a name" do
  #   cat_params = {
  #     cat: {
  #       age: 2,
  #       enjoys: 'walking in the park',
  #       image: 'https://media.istockphoto.com/id/1290233518/photo/ginger-cat-portrait.webp?b=1&s=170667a&w=0&k=20&c=D2ObzKSLDeuKyD5as2m_4UcdaPimE_uosgqWhVdt5n0='
  #     }
  #   }

  #   post '/cats', params: cat_params
  #   expect(response.status).to eq 422
  #   json = JSON.parse(response.body)
  #   expect(json['name'].first).to include "can't be blank"
  # end
end
