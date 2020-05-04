# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

RSpec.describe "general tests" do
    context "extended models" do
        it "has a Role model" do
            expect(RoleAuthorization::Models::Role).to be_a(Class)
        end

        it "has a Permission model" do
            expect(RoleAuthorization::Models::Permission).to be_a(Class)
        end

        it "has a Scope model" do
            expect(RoleAuthorization::Models::Scope).to be_a(Class)
        end

        it "has a ModelScope model" do
            expect(RoleAuthorization::Models::ModelScope).to be_a(Class)
        end

        it "has a RoleMember model" do
            expect(RoleAuthorization::Models::RoleMember).to be_a(Class)
        end
        
        it 'has a RolePermission model' do
            expect(RoleAuthorization::Models::RolePermission).to be_a(Class)
        end
    end
end