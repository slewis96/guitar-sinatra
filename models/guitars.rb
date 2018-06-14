class Guitars
  attr_accessor :id, :name, :price, :img, :description

  def self.open_connection
    conn = PG.connect(dbname: "guitars")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM guitars ORDER BY id"
    results = conn.exec(sql)
    guitars = results.map do |tuple|
      self.hydrate(tuple)
    end
    return guitars
  end

  def self.hydrate(guitar_data)
    guitar = Guitars.new
    guitar.id = guitar_data['id']
    guitar.name = guitar_data['name']
    guitar.price = guitar_data['price']
    guitar.img = guitar_data['img']
    guitar.description = guitar_data['description']
    return guitar
  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM guitars WHERE id = #{id}"
    results = conn.exec(sql)
    guitar = self.hydrate(results[0])
    return guitar
  end

  def save
    conn = Guitars.open_connection
    if(!self.id)
      sql = "INSERT INTO guitars(name, price, img, description) VALUES('#{self.name}', #{self.price} ,'#{self.img}','#{self.description}')"
    else
      sql = "UPDATE guitars SET name = '#{self.name}', price = #{self.price}, img = '#{self.img}', description = '#{self.description}' WHERE id = #{self.id}"
    end
    conn.exec(sql)
  end

  def self.destroy(id)
    conn = Guitars.open_connection
    sql = "DELETE FROM guitars WHERE id = #{id}"
    conn.exec(sql)
  end

end
