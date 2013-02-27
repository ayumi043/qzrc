require 'sqlite3'

db = SQLite3::Database.new( "development.sqlite3" )
#rows = db.execute( "select * from test" )
#db.execute("create table company(name varchar2(20),content object)")
#db.execute("insert into test values('1','haha')")
#2.upto(100){ |i| db.execute("insert into test values('#{i}','haha')") }
db.execute( "select * from test" ) do |row|
  #puts row
end


columns, *rows = db.execute2( "select * from test" )
puts columns
puts "=========================="
puts *rows
# or use a block:

=begin
columns = nil
db.execute2( "select * from test" ) do |row|
  if columns.nil?
    #puts columns = row
  else
    # process row
  end
end
=end

row = db.get_first_row( "select * from test" )
#puts row

db.prepare( "select * from test" ) do |stmt|
    15.times do
      stmt.execute do |result|
        #puts result
      end
    end
end

