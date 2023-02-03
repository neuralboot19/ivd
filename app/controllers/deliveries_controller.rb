class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ edit update destroy ]
  before_action :set_beneficiaries_search, only: %i[ new edit ]

  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to deliveries_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if set_delivery.update(delivery_params)
      # set_delivery.broadcast
      redirect_to deliveries_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    set_delivery.destroy
    redirect_to deliveries_url, notice: t('.destroyed'), status: :see_other
  end

  private
    def set_delivery
      @delivery ||= Delivery.find(params[:id])
    end

    def set_beneficiaries_search
      @beneficiaries ||= Beneficiary.where(status_document: true, terms_conditions: true).order(created_at: :desc)
    end

    def delivery_params
      params.require(:delivery).permit(:kg, :beneficiary_id)
    end
end
