class Unit
  attr_accessor :attack_power
  attr_reader :health_points

  def initialize(health_points = 60, attack_power = 10)
    @health_points = health_points
    @attack_power = attack_power   
  end

  def damage(damage)
    @health_points -= damage
  end

  def attack!(enemy)
    enemy.damage @attack_power unless (dead? || enemy.dead?)
  end

  def dead?
    @health_points <= 0
  end
end