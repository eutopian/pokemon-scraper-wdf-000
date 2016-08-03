class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id, name, type, hp = 60, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
  end

  def self.alter_hp(id, hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
  end

end
