require_relative 'spec_helper'

describe Unit do
  before :each do
    @unit = Unit.new
  end

  it "knows if it is alive" do
    expect(@unit.dead?).to be_falsey
  end

  it "knows if it is dead" do
    @unit.damage(63)
    expect(@unit.dead?).to be_truthy
  end

end