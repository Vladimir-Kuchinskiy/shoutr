class HomesController < ApplicationController
  def show
  end

  private

  def redirects_to_dashboard_if_signed_in
    redirect_to dashboard_path if signed_in?
  end
end
