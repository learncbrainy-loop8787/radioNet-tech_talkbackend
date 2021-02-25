class WarriorsController < ApplicationController

    def index 
        warriors = Warrior.all 
        
        render json: warriors, except: [:created_at, :updated_at]
    end 

    def show
        warrior = Warrior.find_by(id: params[:id])
        if plant 
            render json: warriors, except: [:created_at, :updated_at]
        else 
            render json: {message: "no warrior."}
        end 
    end 

    def sort_kills_asc
        sorted = Warrior.all.sort_by{|warrior| warrior.kills }
        render json: sorted
    end 

    def sort_kills_desc
        sorted = Warrior.all.sort_by{|warrior| warrior.kills}.reverse
        render json: sorted
    end 

    def find_single
        mini = Warrior.all.select{|warrior| warrior. == "Single"}
        render json: mini
    end 

    def find_thousands
        small = Warrior.all.select{|warrior| warrior.troops == "Thousands"}
        render json: small
    end

    def find_millions
        medium = Warrior.all.select{|warrior| warrior.troops == "Millions"}
        render json: medium
    end 

  

    def find_master
        beginner = Warrior.all.select{|warrior| warrior.exp_level == "Master"}
        render json: beginner
    end 

    def find_legend
        intermediate = Warrior.all.select{|warrior| warrior.exp_level == "Legend"}
        render json: intermediate
    end 

    def find_god
        advanced = Warrior.all.select{|warrior| warrior.exp_level == "God"}
        render json: advanced
    end 

end
