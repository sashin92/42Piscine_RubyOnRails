class FtQueryController < ApplicationController
  def index
   
  end

  def create_db
    $db = SQLite3::Database.new("ft_sql.sqlite3")
    redirect_to controller: 'ft_query', action: 'index'
  end

  def create_table
    $db = SQLite3::Database.open("ft_sql.sqlite3")
    $db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS 'clock_watch'(
      ts_id INTEGER PRIMARY KEY AUTOINCREMENT, 
      day INTEGER, month INTEGER, year INTEGER, 
      hour INTEGER, min INTEGER, sec INTEGER, 
      race INTEGER, name VARCHAR(50), lap INTEGER
    );
    SQL
    $db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS 'race'(
      r_id INTEGER PRIMARY KEY AUTOINCREMENT,
      start VARCHAR(50)
    );
    SQL
    redirect_to controller: 'ft_query', action: 'index'
  end

  def drop_table
    $db = SQLite3::Database.open("ft_sql.sqlite3")
    $db.execute <<-SQL
    DROP TABLE IF EXISTS 'race';
    SQL
    $db.execute <<-SQL
    DROP TABLE IF EXISTS 'clock_watch';
    SQL
    redirect_to controller: 'ft_query', action: 'index'
  end

  def start_race
    $db = SQLite3::Database.open("ft_sql.sqlite3")
    $runner_1 = params[:name_1]
    $runner_2 = params[:name_2]
    $runner_3 = params[:name_3]
    $runner_4 = params[:name_4]
    $db.execute <<-SQL
    INSERT INTO clock_watch(day, month, year, hour, min, sec, race, name, lap)
    VALUES(1, 6, 2021, 16, 38, 2, 1, '#{params[:name_1]}', 1)
    SQL
    $db.execute <<-SQL
    INSERT INTO clock_watch(day, month, year, hour, min, sec, race, name, lap)
    VALUES(1, 6, 2021, 16, 38, 2, 1, '#{params[:name_2]}', 1)
    SQL
    $db.execute <<-SQL
    INSERT INTO clock_watch(day, month, year, hour, min, sec, race, name, lap)
    VALUES(1, 6, 2021, 16, 38, 2, 1, '#{params[:name_3]}', 1)
    SQL
    $db.execute <<-SQL
    INSERT INTO clock_watch(day, month, year, hour, min, sec, race, name, lap)
    VALUES(1, 6, 2021, 16, 38, 2, 1, '#{params[:name_4]}', 1)
    SQL
    redirect_to controller: 'ft_query', action: 'index'
  end

  def insert_time_stamp
  
  end

  def delete_last

  end

  def destroy_all
   
  end

  def all_by_name
 
  end

  def all_by_race
   
  end

  def update_time_stamp
  
  end

  private


end
