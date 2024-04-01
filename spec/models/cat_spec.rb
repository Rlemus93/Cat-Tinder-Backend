require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'is valid with valid attributes' do
    cat = Cat.create(
      name: 'Test Cat', 
      age: 5, 
      enjoys: 'Test for enjoys attribute', 
      image: 'https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
    )
    expect(cat).to be_valid
  end

  it 'Is not valid without a name' do
    cat = Cat.create(
      age:5,
      enjoys:"Enjoys chasing mice",
      image:"Img-Url"
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:name].first).to eq("can't be blank")
  end

  it 'Is not valid without a age' do
    cat = Cat.create(
      name:"Meowsciles",
      enjoys:"Enjoys chasing mice",
      image:"Img-Url"
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:age].first).to eq("can't be blank")
  end

  it 'Is not valid without a enjoys' do
    cat = Cat.create(
      age:5,
      name:"Meowsciles",
      image:"Img-Url"
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:enjoys].first).to eq("can't be blank")
  end

  it 'Is not valid without a image' do
    cat = Cat.create(
      age:5,
      enjoys:"Enjoys chasing mice",
      name:"Meowsciles",
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:image].first).to eq("can't be blank")
  end
  
  it 'Enjoys must be more tha 10 characters long.' do
    cat = Cat.create(
      age:9,
      enjoys:"fish",
      name:"Tom",
      image:"Img Url"
    )
    expect(cat).not_to be_valid
    expect(cat.errors[:enjoys].first).to eq("is too short (minimum is 10 characters)")
  end

end

