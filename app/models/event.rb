class Event < ActiveRecord::Base
  belongs_to :bucket

  def completed?
  	!completed_at.blank?
  end
  	
end
