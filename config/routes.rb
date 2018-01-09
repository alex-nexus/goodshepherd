GoodShepherd::Application.routes.draw do
  #comment
  resources :events
  resources :churches do
    get :members, :on => :member
    resources :weekly_meetings
    resources :meetings do
      resources :attendances, :only => [:create]
    end
    get 'upload_directory', :on => :member
    post 'upload_directory', :on => :member    
  end
  
  match '/weekly_calendar' => 'churches#calendar', :as => :weekly_calendar
  match '/weekly_calendar/meetings' => 'churches#calendar_meetings', :as => :weekly_calendar_meetings

  match '/meetings/:meeting_id/users/:user_id/attendance' => 'attendances#destroy', :method => :DELETE, :as => :delete_meeting_attedance

  devise_for :users
  root :to => 'churches#index'
end
