class BeneficiariesController < ApplicationController
  before_action :protect_pages_to_admin_or_super_admin
  before_action :set_beneficiary, only: %i[ edit update destroy ]

  def index
    @beneficiaries = Beneficiary.order(created_at: :desc).load_async
  end

  def new
    @beneficiary = Beneficiary.new
  end

  def edit
  end

  def create
    @beneficiary = Beneficiary.new(beneficiary_params)

    if @beneficiary.save
      redirect_to beneficiaries_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @beneficiary.update(beneficiary_params)
      redirect_to beneficiaries_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_beneficiary.destroy
    redirect_to beneficiaries_url, notice: t('.destroyed'), status: :see_other
  end

  private
    def set_beneficiary
      @beneficiary ||= Beneficiary.find(params[:id])
    end

    def beneficiary_params
      # params.fetch(:beneficiary, {})
      params.require(:beneficiary).permit(:names, :email, :first_surname, :second_surname, :cel_phone, :born, :other_address, :expiration_date_document, :status_document, :family_unit, :terms_conditions)
    end

    def protect_pages_to_admin_or_super_admin
      redirect_to root_path, alert: t('common.not_authorized') unless Current.user&.super_admin? || Current.user&.admin?
    end
end
