#! user/bin/ruby

require 'net/http'
require "uri"
class EhcAssignment
  def crawl
     uri = URI.parse('https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php')
     response=Net::HTTP.post_form(uri,{"action_code"=>"pulishedCauselist","causelist_dt"=>"29-12-2021","state_code"=>"1","dist_code"=>"1","court_code"=>"2"})
     file = File.open("./result.html", "w")
     file.write(response.body)
     file.close()
       return  response.body
  end
  def parse(data)
    row=[]
    cases={}
    row_split=data.split("^#")
    for i in row_split
      row=row.append(i)
    end
    col=[]  
    for i in 0 .. (row_split.length-1)
       col_split=row[i].split("~")
        col[i]={'serial_number' =>col_split[0],
               'bench'=>col_split[1],
               'casuse_list'=>col_split[2].gsub(/\s+/,""), 
               'Date'=>col_split[3],
               'link'=>"https://services.ecourts.gov.in/ecourtindiaHC/cases/display_causelist.php?filename="+col_split[4]}
    end     
      puts col
  end
end  
instance=EhcAssignment.new
data=instance.crawl
instance.parse(data)
