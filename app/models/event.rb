class Event < ActiveRecord::Base
  #acts_as_votable
  belongs_to :bucket
  has_many :whenoptions

  def completed?
  	!completed_at.blank?
  end

  def toggle_completion
  	if completed?
  	update_attribute(:completed_at, nil)
  	else
  	update_attribute(:completed_at, Time.now)
  	end
	end
  	
end
