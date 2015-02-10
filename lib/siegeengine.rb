class SiegeEngine < Unit

  def initialize
    super(400, 50)
  end

  def attack!(enemy)
    if enemy.is_a? Barracks
      2.times { super(enemy) } # call twice for double damage
    elsif enemy.is_a? SiegeEngine
      super(enemy) # normal call against another SiegeEngine
    end
  end
end
