require "spec_helper"

describe WeeklyMeetingsController do
  describe "routing" do

    it "routes to #index" do
      get("/weekly_meetings").should route_to("weekly_meetings#index")
    end

    it "routes to #new" do
      get("/weekly_meetings/new").should route_to("weekly_meetings#new")
    end

    it "routes to #show" do
      get("/weekly_meetings/1").should route_to("weekly_meetings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/weekly_meetings/1/edit").should route_to("weekly_meetings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/weekly_meetings").should route_to("weekly_meetings#create")
    end

    it "routes to #update" do
      put("/weekly_meetings/1").should route_to("weekly_meetings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/weekly_meetings/1").should route_to("weekly_meetings#destroy", :id => "1")
    end

  end
end
