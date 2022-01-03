#! user/bin/ruby
#https://yukimotopress.github.io/http


require 'net/http'
require "uri"
class EhcAssignment
   def crawl
        cases=[]
        uri = URI.parse('https://services.ecourts.gov.in/ecourtindiaHC/cases/highcourt_causelist_qry.php')
        response=Net::HTTP.post_form(uri,{"action_code"=>"pulishedCauselist","causelist_dt"=>"29-12-2021","state_code"=>"1","dist_code"=>"1","court_code"=>"2"})
        file = File.open("/home/ubuntu/Documents/tester/result.html", "w")
        file.write(response.body)
      #puts response.body
        row=[]
        row_split=response.body.split("^#")
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
instance.crawl

