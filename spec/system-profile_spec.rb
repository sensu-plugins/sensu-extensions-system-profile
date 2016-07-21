require File.join(File.dirname(__FILE__), "helpers")
require "sensu/extensions/system-profile"

describe "Sensu::Extension::SystemProfile" do
  include Helpers

  before do
    @extension = Sensu::Extension::SystemProfile.new
    @extension.logger = logger
    @extension.settings = settings
  end

  it "can collect local linux system metrics" do
    async_wrapper do
      @extension.safe_run do |output, status|
        expect(output).to be_kind_of(String)
        expect(output).to_not be_empty
        async_done
      end
    end
  end
end
