require 'gds_api/test_helpers/common_responses'

module WorldLocationStubbingMethods
  include GdsApi::TestHelpers::CommonResponses

  def stub_world_location(location_slug)
    location = stub.quacks_like(WorldLocation.new({}))
    location.stubs(:slug).returns(location_slug)
    name = titleize_slug(location_slug, title_case: true)
    location.stubs(:name).returns(name)
    location.stubs(:fco_organisation).returns(nil)
    WorldLocation.stubs(:find).with(location_slug).returns(location)
    location
  end

  def stub_world_locations(location_slugs)
    locations = location_slugs.map do |slug|
      stub_world_location(slug)
    end
    WorldLocation.stubs(:all).returns(locations)
  end
end