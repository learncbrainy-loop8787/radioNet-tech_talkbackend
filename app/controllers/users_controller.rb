class UsersController < ApplicationController


    def show 
        user = User.find_by(id: params[:id])
        if user 
            
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
        else 
            render json: {message: "Who?"}
        end 
    end 

    def create 
        
        user = User.find_or_create_by(email: params[:email]) 
        user.name = params[:name]
        user.save
            if user.units.length == 0
                 unit = Unit.create(user_id: user.id) if user.units.length == 0   
                 user.units << unit
            end 
        
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

    def user_params
        params.require(:user).permit(:name, :email)
    end 
end
