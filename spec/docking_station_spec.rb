require 'docking_station'

# As a person,
# So that I can use a bike,
# I'd like to get a bike from a docking station.

describe DockingStation do
  subject(:docking_station) { described_class.new }

  let(:station) { described_class.new(50)}
  let(:bike) { double :bike }
  let(:bike2) { double :bike }

  before do
    allow(bike2).to receive(:report_broken).and_return(true)
    allow(bike2).to receive(:broken?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
  end

  describe '#release_bike' do
    it 'releases a bike' do
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'raises an error when no bikes are available' do
      expect { docking_station.release_bike }.to raise_error 'Bike Unavailable'
    end

    it 'raises an error when releasing a bike that is broken' do
      docking_station.dock(bike2)
      expect { docking_station.release_bike }.to raise_error 'Bike Unavailable'
    end
  end

  describe '#dock(bike)' do
    it 'should dock' do
      expect(docking_station.dock(bike)).to include bike
    end

    it 'should dock a bike even if it is broken' do
      expect(docking_station.dock(bike2)).to include bike2
    end

    it 'raises an error when docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock bike }
      expect { docking_station.dock(bike) }.to raise_error 'Station Full'
    end
  end

  describe '#capacity' do
    it 'should have a default capacity' do
      expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it 'allows a variable capacity upon instantiation' do
      expect(station.capacity).to eq 50
    end

    it 'raises an error if varied capacity breached' do
      station.capacity.times { station.dock bike }
      expect { station.dock bike }.to raise_error 'Station Full'
    end
  end
end