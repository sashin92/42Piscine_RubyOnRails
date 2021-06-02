class FtQueryController < ApplicationController
	def index

	end

	def create_db
		if File.exists?("ft_sql.sqlite3")
			$db = SQLite3::Database.open("ft_sql.sqlite3")
		else
			$db = SQLite3::Database.new("ft_sql.sqlite3")
		end
	end

	def create_table
		create_db();
		$db.execute('create table if not exists clock_watch(ts_id INTEGER PRIMARY KEY AUTOINCREMENT, day INTEGER, month INTEGER, year INTEGER, hour INTEGER, min INTEGER, sec INTEGER, race INTEGER, name VARCHAR(50), lap INTEGER);')
		$db.execute('create table if not exists race(r_id INTEGER PRIMARY KEY AUTOINCREMENT, start VARCHAR(50));')
	end

	def drop_table
		create_db();
		$db.execute('drop table if exists clock_watch;')
		$db.execute('drop table if exists race;')
	end

	def start_race

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