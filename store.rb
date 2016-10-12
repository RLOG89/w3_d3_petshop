require_relative('db/sql_runner')

class Store

  attr_reader :id
  attr_accessor  :address, :type

  def initialize(options)
    @id = options['id'].to_i if options['id'] != nil
    @address = options['address']
    @type = options['type']
  end

  def save
    sql = "INSERT INTO stores( 
    address,
    type
    )
    VALUES(
    '#{@address}',
    '#{@type}'
    ) RETURNING * "
    store = SqlRunner.run( sql ).first
    @id = store['id']
  end

  def update
    sql = "UPDATE stores SET address = '#{@address}' , type = '#{@type}' WHERE id = #{@id} "
    SqlRunner.run( sql )
    puts "Edited store: #{@id}"
  end

  def delete
    sql = "DELETE FROM stores WHERE id = #{@id}"
    SqlRunner.run( sql )
    puts "Delete store: #{@id}"
  end

  def pets
    sql = "SELECT * FROM pets WHERE store_id = #{@id}"
    pets = SqlRunner.run( sql ).map { |pet| Pet.new(pet) }
    return pets
  end

  def self.all
    sql = "SELECT * FROM stores"
    stores = SqlRunner.run( sql ).map{ |store| Store.new(store) }
    return stores
  end
end