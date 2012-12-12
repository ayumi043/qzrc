#!/bin/env ruby
# encoding: utf-8

namespace :dev do

  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", :setup ]

  desc "Setup system data"
  task :setup => :environment do
    puts "Create system user"
    u = User.new( :login => "root", :password => "password", :email => "root@example.com", :name => "管理員")
    u.is_admin = true
    u.save!
  end

  desc "add companys data to database "   #rake dev:addcompany
  task :addcompany => :environment do  
	  #require 'v8'
		cxt = V8::Context.new
		puts cxt.eval('7 * 6')

		cxt.load("m_1_0.js")
		puts cxt.eval('_c[3].item.length')  #442
		companys = cxt.eval('_c[3].item').each_with_index do |item,index|
			if index % 2 == 0
				c = Company.new(:sid => item.to_s.force_encoding('utf-8'),:from => "www.qzrc.com")
				puts c.save!
			end			
		end

		
		companys1 =[]
		companys = cxt.eval('_c[3].item').each_with_index do |item,index|
			if index % 2 == 1
				companys1 << item				
			end			
		end		
		companys1.each_with_index do |item,index|
			@company = Company.find(index+1)
			c = @company.update_attributes(:name => item.to_s.force_encoding('utf-8'))
		end
  end

  task :addjob => :environment do
    # encoding: utf-8
	  require 'nokogiri'
		require 'open-uri'

    # Company.find(12,13).each do |company|
		Company.find(:all).each do |company|
      begin
  			@doc = Nokogiri::HTML(open("http://www.qzrc.com/CompanyDetail.aspx?id=#{company.sid}"),nil,"utf-8")
  			#a_name = @doc.css(".a333 a").first.attr('href').delete "#"
  			@doc.css(".a333 a").each do |item|
  				a_name = item.attr('href').delete "#"
  				puts a_name +"  #{company.id}"
  				description = @doc.css("a[name='#{a_name}'] ~ div[class='sm'] ~ div").first.text()
  				job = Job.new(:name => item.text(),:description => description,:company_id => company.id)
  				puts job.save!
  				puts description.force_encoding('utf-8')
  				puts a_name
  			end	
          
      rescue Exception => e
          
      end
		end	
  end	

end

#usage rake dev:build