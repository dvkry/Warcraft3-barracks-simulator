require_relative 'spec_helper'

describe Unit do
  before :each do
    @unit = Unit.new
  end
  
  it "Dead unit will not attack" do
    enemy_unit = Unit.new
    @unit.damage(63)
    expect(@unit.attack!(enemy_unit)).to be_falsey
    expect(@unit.health_points).to eq(-3)
  end

  it "unit will not attack another dead unit" do
    enemy_unit = Unit.new
    enemy_unit.damage(63)
    expect(@unit.attack!(enemy_unit)).to be_falsey
    expect(enemy_unit.health_points).to eq(-3)
  end

end