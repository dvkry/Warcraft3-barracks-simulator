class Barracks
  attr_accessor :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def train_siegeengine
    if can_train_siegeengine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    end
  end

  def can_train_footman?
    (self.gold >= 135) && (self.food >= 2)
  end

  def can_train_peasant?
    (self.gold >= 90) && (self.food >= 5)
  end

  def can_train_siegeengine?
    (self.gold >= 200) && (self.food >= 3) && (self.lumber >= 60)
  end

  # def is_a_building?
  #   true
  # end

  def dead?
    @health_points <= 0
  end

  def damage(damage)
    @health_points -= damage
  end
end
