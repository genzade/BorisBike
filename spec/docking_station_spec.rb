require 'docking_station'

# As a person,
# So that I can use a bike,
# I'd like to get a bike from a docking station.

describe DockingStation do
  subject(:docking_station) { described_class.new }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when no bikes are available' do
      expect { docking_station.release_bike }.to raise_error 'Bikes Unavailable'
    end
  end

  describe '#dock' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'should dock' do
      bike = Bike.new
      expect(docking_station.dock(bike)).to include bike
    end

    it 'raises an error when docking station is full' do
      20.times { docking_station.dock Bike.new }
      expect { docking_station.dock(Bike.new) }.to raise_error 'Station Full'
    end

    it 'returns docked bikes' do
      bike = Bike.new
      docking_station.dock(bike)
      expect(docking_station.bikes).to include bike
    end
  end

  describe '#bikes' do
    it { is_expected.to respond_to(:bikes)}
  end
end