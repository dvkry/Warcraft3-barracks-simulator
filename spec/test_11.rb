require_relative 'spec_helper'

describe Barracks do
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its HP (health points)" do
    expect(@barracks.health_points).to eq(500)
  end
  
  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @barracks.damage(4)
      expect(@barracks.health_points).to eq(496) # starts at 500
    end
    it "takes half damage from footman" do
      footman = Footman.new
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  end

end