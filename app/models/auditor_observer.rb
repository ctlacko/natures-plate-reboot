class AuditorObserver < ActiveRecord::Observer
  observe :user

  def after_create(record)
  end
end
