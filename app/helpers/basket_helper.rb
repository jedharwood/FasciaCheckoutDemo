# frozen_string_literal: true

module BasketHelper
    def calculate_material_cost(price, length)
      price * length
    end

    def calculate_basket_total(basket_materials)
        total = 0
        basket_materials.each do |basket_material|
            total += basket_material.material.price * basket_material.length 
        end
        total
    end
  end
  