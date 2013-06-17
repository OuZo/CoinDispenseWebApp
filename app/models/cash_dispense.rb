class CashDispense < ActiveRecord::Base
  attr_accessible :amount_due, :captured_amount, :user_id

  DENOMINATIONS = [100,50,20,10,5,2,1,0.5,0.2,0.1,0.05]

  def subtract_while_dom(dom,val)
  	arr = []
  	while (val >= dom)
  		val -= dom
  		arr << dom
  	end # while 
  	[arr, val]
  end # subtract_while_dom

  def calculate_break_down
  	val = self.captured_amount

  	break_down = []

  	arr = subtract_while_dom(100,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(50,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(20,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(10,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(5,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(2,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(1,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(0.5,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(0.2,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(0.1,val)
  	val = arr[1]
  	break_down << arr[0]

  	arr = subtract_while_dom(0.05,val)
  	val = arr[1]
  	break_down << arr[0]
 
	puts "VAL = #{val}"
  	break_down
  end # calculate_break_down

end
