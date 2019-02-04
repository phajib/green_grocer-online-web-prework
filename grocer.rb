def consolidate_cart(cart)
  cart_update = {}
  cart.each do |hash_array|
    hash_array.each do |item, data|
      if cart_update[item]
        cart_update[item][:count] += 1
      else
        cart_update[item] = data
        cart_update[item][:count] = 1
      end
    end
  end
  cart_update
end

def apply_coupons(cart, coupons)
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
