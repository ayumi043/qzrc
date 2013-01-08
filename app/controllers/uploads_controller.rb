# encoding: utf-8

class UploadsController < ApplicationController
  def index
    
  end

  def upload

    # "xxx".force_encoding("ISO-8859-1").encode("UTF-8")    

    # uploaded_io = params[:person][:picture]  
    uploaded_io = params[:picture]
    if uploaded_io != nil
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|  
        file.write(uploaded_io.read)  
      end  
    end
    redirect_to upload_path
  end

end
