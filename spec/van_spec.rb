require 'van'

# As a maintainer of the system,
# So that I can manage broken bikes and not disappoint users,
# I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

describe Van do
  subject(:van) { described_class.new }

  let(:station) { double :docking_station }
  let(:bike) { double(:bike, :broken => true) }

  before do
    allow(station).to receive(:collect_broken).and_return([bike])
  end

  it 'recieves broken bikes from a docking station' do
    van.collect_bikes_from(station)
    expect(van.bikes).to include bike
  end
end

# allow(dock_stat).to receive(:collect_broken).and_return([bike])