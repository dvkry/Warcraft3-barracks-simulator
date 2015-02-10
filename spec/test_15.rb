require_relative 'spec_helper'

describe SiegeEngine do
  before :each do
    @siegeengine = SiegeEngine.new
  end

  it "SiegeEngine starts with AP: 50, HP:400" do
    expect(@siegeengine.attack_power).to eq(50)
    expect(@siegeengine.health_points).to eq(400)
  end

  it "Should do double damage to Barracks" do
    barracks = Barracks.new
    @siegeengine.attack!(barracks)
    expect(barracks.health_points).to eq(400)
  end

  it "Should not attack footmen" do
    enemy_footman = Footman.new
    expect(@siegeengine.attack!(enemy_footman)).to be_falsey
    expect(enemy_footman.health_points).to eq(60)
  end

  it "should be able to attack other SiegeEngines" do
    enemy_siegeengine = SiegeEngine.new
    @siegeengine.attack!(enemy_siegeengine)
    expect(enemy_siegeengine.health_points).to eq(350)
  end

end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siegeengine" do

    it "costs 200 gold" do
      @barracks.train_siegeengine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.train_siegeengine
      expect(@barracks.food).to eq(77) # starts at 80
    end
    
    it "cost 60 lumber" do
      @barracks.train_siegeengine
      expect(@barracks.lumber).to eq(440) #starts at 500
    end

    it "produces a siegeengine" do
      siegeengine = @barracks.train_siegeengine
      expect(siegeengine).to be_an_instance_of(SiegeEngine)
    end

  end
    describe "#can_train_siegeengine?" do
    it "returns true if there are enough resources to train a siegeengine" do
    expect(@barracks.can_train_siegeengine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      @barracks.should_receive(:food).and_return(1)
      expect(@barracks.can_train_siegeengine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      @barracks.should_receive(:gold).and_return(134)
      expect(@barracks.can_train_siegeengine?).to be_falsey
    end
  end

  describe "#train_siegeengine" do
    it "does not train a siegeengine if there aren't enough resources" do
      @barracks.should_receive(:can_train_siegeengine?).and_return(false)
      expect(@barracks.train_siegeengine).to be_nil
    end
    it "trains a siegeengine if there are enough resources" do
      @barracks.should_receive(:can_train_siegeengine?).and_return(true)
      expect(@barracks.train_siegeengine).to be_a(SiegeEngine)
    end
  end

end