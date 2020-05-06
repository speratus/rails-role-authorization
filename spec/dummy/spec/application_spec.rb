# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

include RoleAuthorization::Models

RSpec.describe "general tests" do
    context "extended models" do
        it "has a Role model" do
            expect(Role).to be_a(Class)
        end

        it "has a Permission model" do
            expect(Permission).to be_a(Class)
        end

        it "has a Scope model" do
            expect(Scope).to be_a(Class)
        end

        it "has a ModelScope model" do
            expect(ModelScope).to be_a(Class)
        end

        it "has a RoleMember model" do
            expect(RoleMember).to be_a(Class)
        end
        
        it 'has a RolePermission model' do
            expect(RolePermission).to be_a(Class)
        end
    end

    context 'extended models can be saved' do
        
        it 'can create a Permission' do
            perm = Permission.new(name: "name", record_name: "Demo")
            expect{ perm.save }.not_to raise_error
        end

        it 'can create a Scope' do
            scope = Scope.new(name: 'test')
            expect {scope.save}.not_to raise_error
        end

        it 'can create a role' do
            scope = Scope.create(name: 'test')
            role = Role.new(name: 'demo', scope: scope)
            expect {role.save}.not_to raise_error
        end
    end
end