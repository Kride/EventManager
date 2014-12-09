module EventsHelper
  def users_registration event
    if user_signed_in?
      registration = event.registrations.where(user: current_user)
      unless registration.blank?
        return registration.first
      end
    end
    return nil
  end
end
