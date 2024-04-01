cats = [
  {
    name: 'Leif',
    age: 2,
    enjoys: 'loves the ice machine on the fridge.',
    image: 'https://media.istockphoto.com/id/1370365587/photo/big-eyed-naughty-obese-cat-looking-at-the-target.webp?b=1&s=170667a&w=0&k=20&c=468okwKwMosVm_DxsNTfe5ms9h5_8w0ETSk51Ys6I5k='
  },

  {
    name: 'Kopi',
    age: 13,
    enjoys: 'likes to sleep and scratch people',
    image: 'https://media.istockphoto.com/id/611312482/photo/portrait-of-attentive-resting-on-the-sofa-white-grey-cat.webp?b=1&s=170667a&w=0&k=20&c=RUcLIzZYHLI--F2npa9Gi8HcAtScXaSjGTFPzDbbUg0='
  },

  {
    name: 'Cali',
    age: 1,
    enjoys: 'loved going on long walks to the store',
    image: 'https://media.istockphoto.com/id/1428651837/photo/staring-cat.jpg?s=1024x1024&w=is&k=20&c=cJhplE9ye-SqudOMJZ3dLMqGqmKZKKeNNEP-RwDEw2E='
  }
]

cats.each do |cat|
  Cat.create(cat)
  puts "Creating cat: #{cat}"
end
