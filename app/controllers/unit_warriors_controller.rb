class UnitWarriorsController < ApplicationController

    def index
        unit_warrior = UnitWarrior.all 
        
        render json: unit_warriors, except: [:created_at, :updated_at]
    end 

    def create 
        unit_warrior = UnitWarrior.create(unit_warrior_params)
        unit = Unit.find(unit_warrior_params[:unit_id])
        user = unit.user
        
        render json: user, :include => {
            units: {
                except: [:created_at, :updated_at], 
                methods: :total, 
                include: {
                    unit_warriors:{ 
                        include: :warrior
                }},
            }
        }, except: [:created_at, :updated_at]
    end 
   
    def destroy 
        unit_warrior = UnitWarrior.find(params[:id])
        user = unit_warrior.unit.user
        unit_warrior.destroy
        
        render json: user, :include => {
            units: {
                except: [:created_at, :updated_at], 
                methods: :total, 
                include: {
                    unit_warriors:{ 
                        include: :warrior
                }},
            }
        }, except: [:created_at, :updated_at]
    end 

    private
    
    def unit_warrior_params
        params.require(:unit_warrior).permit(:unit_id, :warrior_id)
    end 
end
