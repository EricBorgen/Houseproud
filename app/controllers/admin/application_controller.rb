# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_filters.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Admin
  class ApplicationController < Administrate::ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user!
    before_action :authenticate_admin

#    def authenticate_admin
#      unless user.has_role? :admin
#        redirect_to :root
#      end
#    end

  def authenticate_admin
    #redirect_to '/', alert: 'Not authorized.' unless current_user && access_whitelist
  end

  private
      def access_whitelist
        #current_user.try(:admin?)
        #user.has_role? :admin
      end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
