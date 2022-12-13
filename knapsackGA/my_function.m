function price = my_function(chroms)

    weight_set = [2.5,1,6,2.5,1.5,3,5];
    price_set = [750,500,2750,950,1850,3250,3950];
    limitWeight = 10;
    for i= 1:size(chroms,1)
        sum_of_prices=sum(chroms(i,:).* price_set);
        sum_of_weights=sum(chroms(i,:).* weight_set);

        if sum_of_weights <= limitWeight
            price(i)= sum_of_prices;
        else
            price(i) = 0;
        end
        
    end
