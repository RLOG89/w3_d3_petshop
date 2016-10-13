require_relative('db/sql_runner')

class Pet

  attr_reader :id
  attr_accessor  :name, :type, :store_id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @store_id = options['store_id'].to_i
  end

  def save
    sql = "INSERT INTO pets( 
    name,
    type,
    store_id
    )
    VALUES(
    '#{@name}',
    '#{@type}',
    #{@store_id}
    ) RETURNING * "
    pet = SqlRunner.run( sql ).first
    @id = pet['id']
    puts "Pet #{@id} added"
  end

  def update
    sql = "UPDATE pets SET name = '#{@name}' , type = '#{@type}' WHERE id = #{@id} "
    SqlRunner.run( sql )
    puts "Edited pet: #{@id}"
  end

  def delete
    sql = "DELETE FROM pets Where id = #{@id}"
    SqlRunner.run( sql )
    puts "Delete pet: #{@id}"
  end

  def self.all
    sql = "select * from pets"
    pets = SqlRunner.run( sql ).map{ |pet| Pet.new(pet) }
    return pets
  end

end