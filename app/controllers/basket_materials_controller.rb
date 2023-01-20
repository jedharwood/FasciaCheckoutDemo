# frozen_string_literal: true

class BasketMaterialsController < ApplicationController
  def create
    BasketMaterial.create!(basket_material_params)

    render turbo_stream: turbo_stream.replace('trolley_counter', partial: 'layouts/trolley_counter',
                                                                 locals: { count: BasketMaterial.count })
  end

  def update_total_price
    length = params[:length].to_i
    price = params[:price].to_i
    render turbo_stream: turbo_stream.replace('total_price_info', partial: 'material/total_info',
                                                                  locals: { length:, price: })
  end

  private

  def basket_material_params
    params.required(:basket_material).permit(:material_id, :length)
  end
end
