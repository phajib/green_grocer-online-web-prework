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
  return cart if coupons == []
#set new_cart = cart so we don't have to push all the values, just change them
  cart_update = cart
  coupons.each do |coupon|
    name = coupon[:item] #avocado, cheese,...
    num_of_c = coupon[:num]
  #if the cart has the same item in coupon and has larger amount than in coupon
    if cart[name][:count] && cart.include?(name) >= num_of_c
     #remove number of the new_cart's count
     cart_update[name][:count] -= num_of_c
     #increase the count when there is more items than the coupon allows
     if cart_update["#{name} W/COUPON"]
       cart_update["#{name} W/COUPON"][:count] += 1
     #set the name with coupon with new value
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
  # code here
end

def checkout(cart, coupons)
  # code here
end
