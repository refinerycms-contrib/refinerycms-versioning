require "spec_helper"

describe "Workflows front-end routing", type: :routing do

  routes { Refinery::Core::Engine.routes }

  it "can route to index" do
    expect( :get => "/workflows" ).to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "index",
      :locale => :en
    )
  end

  it "can route to new" do
    expect( :get => "/workflows/new" ).to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "new",
      :locale => :en
    )
  end

  it "can route to create" do
    expect( :post => "/workflows" ).to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "create",
      :locale => :en
    )
  end

  it "routes to thank_you" do
    expect( :get => "/workflows/thank_you" ).to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "thank_you",
      :locale => :en
    )
  end

  it "does not route to show" do
    expect( :get => "/workflows/1" ).not_to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "show",
      :locale => :en
    )
  end

  it "does not route to edit" do
    expect( :get => "/workflows/1/edit" ).not_to route_to(
      :controller => "refinery/workflows/workflows",
      :action => "edit",
      :locale => :en
    )
  end

  it "does not route to update" do
    expect( :update => "/workflows/1" ).not_to be_routable
  end

  it "does not route to delete" do
    expect( :delete => "/workflows/1" ).not_to be_routable
  end

end
