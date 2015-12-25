require 'docking_station'

# As a person,
# So that I can use a bike,
# I'd like to get a bike from a docking station.

describe DockingStation do
  subject(:docking_station) { described_class.new }
  let(:bike) { Bike.new }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when no bikes are available' do
      expect { docking_station.release_bike }.to raise_error 'Bike Unavailable'
    end

    it 'raises an error when releasing a bike that is broken' do
      bike2 = Bike.new
      bike2.report_broken
      docking_station.dock(bike2)
      expect { docking_station.release_bike }.to raise_error 'Bike Unavailable'
    end
  end

  describe '#dock(bike)' do
    it { is_expected.to respond_to(:dock).with(1).argument }
    it 'should dock' do
      expect(docking_station.dock(bike)).to include bike
    end

    it 'should dock a bike even if it is broken' do
      bike2 = Bike.new
      bike2.report_broken
      expect(docking_station.dock(bike2)).to include bike2
    end

    it 'raises an error when docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock bike }
      expect { docking_station.dock(bike) }.to raise_error 'Station Full'
    end
  end

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }
    it 'should have a default capacity' do
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'allows a variable capacity upon instantiation' do
      station = DockingStation.new(50)
      expect(station.capacity).to eq 50
    end

    it 'raises an error if varied capacity breached' do
      station = DockingStation.new(50)
      50.times { station.dock bike }
      expect { station.dock bike }.to raise_error 'Station Full'
    end
  end
end