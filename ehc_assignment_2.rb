#! user/bin/ruby
require 'net/http'
require "uri"
require "logger"
require "json"

class EhcAssignment
  @@log = Logger.new('logger.log')
  @@uri = URI('https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php')
  def crawl
    begin
      response=Net::HTTP.post_form(@@uri,{"action_code"=>"pulishedCauselist","causelist_dt"=>"29-12-2021","state_code"=>"1","dist_code"=>"1","court_code"=>"2"})
      rescue Timeout::Error=> error
      @@log.info("time out ") 
    else
      case response  
      when Net::HTTPOK
        file = File.open("./result.html", "w")
        file.write(response.body)
        file.close()
        path= File.expand_path('../', __FILE__)
        @@log.info("current path of save file :#{path}") 
        return  response.body
      when Net::HTTPClientError,
        Net::HTTPInternalServerError,URI::Error
        @@log.info("please use currect url")
      end
    end 
  end  
  def parse(data)
    begin 
      raise  data=data.gsub(/\s+/,"") 
    rescue  Exception =>e        
        @@log.info("no data avilabe in response") 
    end
        row=[]
        row_split=data.split("^#")
      for i in row_split
        row=row.append(i)
      end
      col=[]  
      for i in 0 .. (row_split.length-1)
        col_split=row[i].split("~")
        col[i]={'serial_number '=>col_split[0],
               'bench '=>col_split[1],
               'casuse_list '=>col_split[2], 
               'Date '=>col_split[3],
               'link '=>"https://services.ecourts.gov.in/ecourtindiaHC/cases/ display_causelist.php?filename="+col_split[4]}
        @@log.info(col[i])
      
     end
    end
  end
instance=EhcAssignment.new
data=instance.crawl
instance.parse(data)
