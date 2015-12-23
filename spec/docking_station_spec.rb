require 'docking_station'

# As a person,
# So that I can use a bike,
# I'd like to get a bike from a docking station.

describe DockingStation do
  subject(:docking_station) { described_class.new }

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }
    it 'releases a working bike' do
      bike = docking_station.release_bike
      expect(bike).to be_working
    end
  end
end