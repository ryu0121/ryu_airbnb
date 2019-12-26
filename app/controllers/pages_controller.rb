class PagesController < ApplicationController
  def home
    @rooms = Room.where(active: true).limit(3)
  end

  def search
    #assign session here
    if params[:search].present?
      #create session
      session[:loc_search] = params[:search]
    end

    if session[:loc_search]
      #Grab all the cities and nearby cities
      @room_address = Room.where(active: true).near(session[:loc_search], 5, order: 'distance')
    else
      #Grab all the places here
      @room_address = Room.where(active: true).all
    end

    #For ransack usage
    @search = @room_address.ransack(params[:q])
    @rooms = @search.result
    @arrRooms = @rooms.to_a

    #For Checking date avarability
    if (!params[:start_date].empty? && !params[:end_date].empty?)
      @start_date = Date.parse(params[:start_date])
      @end_date = Date.parse(params[:end_date])
      @rooms.each do |room|
        taken_room = room.reservation.where("? <= start_date AND start_date <=? OR (? <= end_date AND end_date <= ?)",
        @start_date, @end_date,
        @start_date, @end_date).limit(1)

        if taken_room.any?
          @arrRooms.delete(room)
        end
      end
    end
  end
end