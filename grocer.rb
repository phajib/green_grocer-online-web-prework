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
  #return cart if coupons == []
  cart_update = cart
  coupons.each do |coupon|
    name = coupon[:item]
    no_coupons = coupon[:num]
    if  cart.include?(name) && cart[name][:count] >= no_coupons
     cart_update[name][:count] -= no_coupons
     if cart_update["#{name} W/COUPON"]
       cart_update["#{name} W/COUPON"][:count] += 1
     else
       cart_update["#{name} W/COUPON"] = {
         :price => coupon[:cost],
         :clearance => cart_update[name][:clearance],
         :count => 1
       }
     end
   end
 end
 cart_update
end

def apply_clearance(cart)
  cart.each do |item, hash|
    if hash[:clearance] == true
      hash[:price] = (hash[:price] * 0.8).round(2)
    end
  end
  cart
end

def checkout(cart, coupons)
  cart_update = consolidate_cart(cart)
  apply_coupons(cart_update, coupons)
  apply_clearance(cart_update)
  total_cost = 0

  cart_update.each do |name, hash|
    total_cost += (hash[:price] * hash[:count])
  end
  if total_cost >= 100
    total_cost *= 0.9
  end
  total_cost
end
