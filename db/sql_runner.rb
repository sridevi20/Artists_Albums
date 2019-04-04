require('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])
    # Connect to database
    begin
      db = PG.connect({host: 'localhost', dbname: 'Artists'})
      # prepare the statement
      db.prepare("query", sql)
      # execute the statement
      results = db.exec_prepared("query", values)
      # wheather code works / not but db must be close
      # close the db connection
    ensure
      db.close() if db != nil
    end
    # return the results
    return results
  end
end
