# Copyright (c) 2009-2013 VMware, Inc.
# Copyright (c) 2012 Piston Cloud Computing, Inc.

require "spec_helper"

describe Bosh::OpenStackCloud::Cloud do

  it "deletes stemcell" do
    image = double("image", :id => "i-foo", :name => "i-foo", :properties => {})

    cloud = mock_glance do |glance|
      allow(glance.images).to receive(:find_by_id).with("i-foo").and_return(image)
    end

    expect(image).to receive(:destroy)

    cloud.delete_stemcell("i-foo")
  end

end
