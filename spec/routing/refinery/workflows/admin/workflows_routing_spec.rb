require "spec_helper"

describe "workflows admin routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to new" do
    expect( :get => "/refinery/workflows/new" ).to route_to(
      :controller => "refinery/workflows/admin/workflows",
      :action => "new",
      :locale => :en
    )

  end

  it "can route to create" do
    expect( :post => "/refinery/workflows" ).to be_routable
  end

  it "can route to show" do
    expect( :get => "/refinery/workflows/1" ).to route_to(
      :controller => "refinery/workflows/admin/workflows",
      :action => "show",
      :id => '1',
      :locale => :en
    )
  end

  it "can route to edit" do
    expect( :get => "/refinery/workflows/1/edit" ).to route_to(
      :controller => "refinery/workflows/admin/workflows",
      :action => "edit",
      :id => "1",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/refinery/workflows/1" ).not_to be_routable
  end

  it "does route to delete" do
    expect( :delete => "/refinery/workflows/1" ).to route_to(
      :controller => "refinery/workflows/admin/workflows",
      :action => "destroy",
      :id => '1',
      :locale => :en
    )
  end

end
