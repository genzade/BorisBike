require 'docking_station'

# As a person,
# So that I can use a bike,
# I'd like to get a bike from a docking station.

describe DockingStation do
  subject(:docking_station) { described_class.new }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a working bike' do
      bike = Bike.new
      expect(bike).to be_working
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'should dock' do
      bike = Bike.new
      expect(docking_station.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.bike).to eq bike
    end
  end

  describe '#bike' do
    it { is_expected.to respond_to(:bike)}
  end
end