require 'van'

# As a maintainer of the system,
# So that I can manage broken bikes and not disappoint users,
# I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

describe Van do
  subject(:van) { described_class.new }

  let(:station) { double :docking_station }

  it 'recieves broken bikes from a docking station' do
    expect { van.recieve_bikes }.not_to raise_error
  end
end