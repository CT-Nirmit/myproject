#! user/bin/ruby
require 'net/http'
require "uri"
class EhcAssignment
  def crawl(uri)
    begin
      response=Net::HTTP.post_form(uri,{"action_code"=>"pulishedCauselist","causelist_dt"=>"29-12-2021","state_code"=>"1","dist_code"=>"1","court_code"=>"2"})
    rescue Timeout::Error=> error
      puts response.massage
      puts error
    else
      case response  
      when Net::HTTPOK
        file = File.open("./result.html", "w")
        file.write(response.body)
        file.close()
        path= File.expand_path('../', __FILE__)
        puts "current path of save file :  #{path}" 
        return  response.body
      when Net::HTTPClientError,
        Net::HTTPInternalServerError,URI::Error
        puts "check the url"
      end
    end 
  end  
  def parse(data)
    begin 
      if  data == nil
         puts "data is not avialable in parse file"
      else 
      data=data.gsub(/\s+/,"")        
      row=[]
      row_split=data.split("^#")
      for i in row_split
        row=row.append(i)
      end
      col=[]  
      for i in 0 .. (row_split.length-1)
        col_split=row[i].split("~")
        col[i]={'serial_number' =>col_split[0],
               'bench'=>col_split[1],
               'casuse_list'=>col_split[2], 
               'Date'=>col_split[3],
               'link'=>"https://services.ecourts.gov.in/ecourtindiaHC/cases/ display_causelist.php?filename="+col_split[4]}
      end 
        return col
      end
    end
  end
end
uri = URI('https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php') 
instance=EhcAssignment.new
data=instance.crawl(uri)
result= instance.parse(data)
puts result
