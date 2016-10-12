require_relative 'pet'
require_relative 'store'
require 'pry-byebug'

store1 = Store.new({'address' => "1 Castle Terrace", 'type' => 'dog'})

puts "store1 added!"

store1.save()

store2 = Store.new({'address' => "3 Lady Lawson Street", 'type' => "Monkeys"})

store2.save
store1.address = "2 London Road"
store1.update 

 

pet1 = Pet.new({'name' => "Tony the Tiger", 'type' => "St Bernard", 'store_id' => store1.id})
pet1.save

pet2 = Pet.new({'name' => "Danny the Dolphin", 'type' =>"Great Dane", 'store_id' => store1.id})

pet2.save

pet2.name = "The Great Dane of the North"
pet2.update

pet3 = Pet.new({'name' => "Bob", 'type' => "cockapoodle", 'store_id' => store1.id})
pet3.save
pet3.delete

puts store1.pets
binding.pry
nil