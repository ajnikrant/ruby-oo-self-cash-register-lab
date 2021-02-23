require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction_amount

    def initialize (discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity=1)
        if quantity >1
            i=0
            while i<quantity
             @items << item
             i+=1
            end
        else
            @items << item
          end
        @total += price*quantity
        @last_transaction_amount = price*quantity
    end

    def apply_discount ()
        if @discount > 0
            @discount= @discount/100.to_f
            @total = @total - (@total * @discount).round
                        # binding.pry

            return "After the discount, the total comes to $#{total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @last_transaction_amount
        if items.length == 0
           @total== 0
        end
        # binding.pry
        return @total
    end


end