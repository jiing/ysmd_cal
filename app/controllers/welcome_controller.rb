class WelcomeController < ApplicationController
  def index

     if (!params[:p].blank?)
       p = params[:p].to_f
     end

     if (!params[:w].blank?)
       w = params[:w].to_f
     end

     if(!params[:h].blank?)
       h = params[:h].to_f
     end

     if(!params[:i].blank?)
       i = params[:i].to_f
     end

     if(!params[:sigma_max].blank?)
       sigma_max = params[:sigma_max].to_f
     end

     e= 7*10**5

     @ans = 0
     if( p && w && h && i && e)
        sigma_max = BigDecimal.new("0");
        sigma_max = (p*w*h**4) / (1920.0*e*i) *(5.0-(w/h)**2)**2
        @ans = sigma_max
     elsif( sigma_max && w && h && i && e)
          p =  BigDecimal.new("0");
         p = sigma_max * (1920.0*e*i) *(5.0-(w/h)**2)**2 /w/(h**4)
         @ans = p
      elsif( sigma_max && w && h && p && e)
           i =  BigDecimal.new("0");
           i = p / sigma_max *w *(h**4)/((5.0-(w/h)**2)**2)/1920.0/e
           @ans = i
      end


  end

end
