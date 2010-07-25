class TimelineController < ApplicationController
  def index
    txt = File.read('public/timeline_data.js')
    respond_to do |wants|
      wants.js do 
        render :text => txt
      end
    end
  end
end