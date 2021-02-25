class UnitsController < ApplicationController

    def index 
        units = Unit.all 
        
        render json: units, :except => [:created_at, :updated_at]
        render json: units(:include => {
            :user => {:only => [:name]},
        }), :except => [:created_at, :updated_at]
    end 

    def show 
        unit = Unit.find_by(id: params[:id])
        if unit
           
            render json: cart(:include => {
                user: {:only => [:name]},
            }), except: [:created_at, :updated_at]
        else
            render json: {message: " not found."}
        end 
    end 

    def dday
        unit = Unit.find(params[:id])
        unit.dday = true 
        unit.save
        user = unit.user 
        
        new_unit = Unit.create(user_id: user.id)
        
        render json: user, :include => {
            units: {
                except: [:created_at, :updated_at], 
                methods: :total, 
                include: {
                    unit_warriors:{ 
                        include: :warrior
                    }
                },
            },
        }, except: [:created_at, :updated_at]
    end 

    private 

   
end
