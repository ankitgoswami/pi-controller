module Admin
    class SettingsController < ApplicationController
      def new
      end

      def create
        @errors = ActiveModel::Errors.new(self)
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
          Setting.send("#{key}=", YAML.load(setting_params[key].strip)) unless setting_params[key].nil?
        end
  
        redirect_to new_admin_settings_path, notice: "Setting was successfully updated."
      end
  
      private
        def setting_params
          params.require(:setting).permit(:captcha_enable, :family_members)
        end
    end
  end