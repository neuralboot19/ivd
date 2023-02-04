class QueriesController < ApplicationController
  before_action :protect_pages_to_admin_or_super_admin

  def index
  end

  private
    def protect_pages_to_admin_or_super_admin
      redirect_to root_path, alert: t('common.not_authorized') unless Current.user&.super_admin? || Current.user&.admin?
    end
end
