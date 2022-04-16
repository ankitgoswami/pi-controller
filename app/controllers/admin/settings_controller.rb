module Admin
    class SettingsController < ApplicationController
      def show
        @errors = ActiveModel::Errors.new
        render :show
      end

      def create
        @errors = ActiveModel::Errors.new
        setting_params.keys.each do |key|
          next if setting_params[key].nil?
  
          setting = Setting.new(var: key)
          setting.value = setting_params[key].strip
          unless setting.valid?
            @errors.merge!(setting.errors)
          end
        end
  
        if @errors.any?
          render :new
        end
  
        setting_params.keys.each do |key|
          Setting.send("#{key}=", setting_params[key].strip) unless setting_params[key].nil?
        end
  
        redirect_to admin_settings_path, notice: "Setting was successfully updated."
      end
  
      private
        def setting_params
          params.require(:setting).permit(:captcha_enable, :family_members)
        end
    end
  end