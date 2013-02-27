# xml.item :foo => 'bar' do
#   xml.title "my job"
# end

xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "泉州IT职位"
    xml.description "职位列表"
    # xml.link formatted_articles_url(:rss)
    
    for job in @jobs
      xml.item do
        xml.title job.name
        xml.description job.description
        xml.pubDate job.updated_at.to_s(:updated_time)
        xml.link job_path(job)
        # xml.link formatted_article_url(article, :rss)
        xml.guid ob_path(job)
      end
    end
  end
end