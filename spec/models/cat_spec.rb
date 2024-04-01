require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'Is not valid without a name' do
    leif = Cat.create(
      age:5,
      enjoys:"Enjoys chasing mice",
      image:"Img-Url"
    )
    expect(leif.errors[:name]).to_not be_empty
  end
  it 'Is not valid without a age' do
    leif = Cat.create(
      name:"Meowsciles",
      enjoys:"Enjoys chasing mice",
      image:"Img-Url"
    )
    expect(leif.errors[:age]).to_not be_empty
  end
  it 'Is not valid without a enjoys' do
    leif = Cat.create(
      age:5,
      name:"Meowsciles",
      image:"Img-Url"
    )
    expect(leif.errors[:enjoys]).to_not be_empty
  end
  it 'Is not valid without a image' do
    leif = Cat.create(
      age:5,
      enjoys:"Enjoys chasing mice",
      name:"Meowsciles",
    )
    expect(leif.errors[:image]).to_not be_empty
  end
  it 'Enjoys must be more tha 10 characters long.' do
    leif = Cat.create(
      age:9,
      enjoys:"fish",
      name:"Tom",
      image:"Img Url"
    )
    expect(leif.errors[:enjoys]).to_not be_empty
  end

end

