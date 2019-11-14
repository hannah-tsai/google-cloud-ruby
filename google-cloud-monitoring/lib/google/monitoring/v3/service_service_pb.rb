# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/monitoring/v3/service_service.proto


require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/monitored_resource_pb'
require 'google/monitoring/v3/service_pb'
require 'google/protobuf/empty_pb'
require 'google/protobuf/field_mask_pb'
require 'google/api/client_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "google.monitoring.v3.CreateServiceRequest" do
    optional :parent, :string, 1
    optional :service_id, :string, 3
    optional :service, :message, 2, "google.monitoring.v3.Service"
  end
  add_message "google.monitoring.v3.GetServiceRequest" do
    optional :name, :string, 1
  end
  add_message "google.monitoring.v3.ListServicesRequest" do
    optional :parent, :string, 1
    optional :filter, :string, 2
    optional :page_size, :int32, 3
    optional :page_token, :string, 4
  end
  add_message "google.monitoring.v3.ListServicesResponse" do
    repeated :services, :message, 1, "google.monitoring.v3.Service"
    optional :next_page_token, :string, 2
  end
  add_message "google.monitoring.v3.UpdateServiceRequest" do
    optional :service, :message, 1, "google.monitoring.v3.Service"
    optional :update_mask, :message, 2, "google.protobuf.FieldMask"
  end
  add_message "google.monitoring.v3.DeleteServiceRequest" do
    optional :name, :string, 1
  end
  add_message "google.monitoring.v3.CreateServiceLevelObjectiveRequest" do
    optional :parent, :string, 1
    optional :service_level_objective_id, :string, 3
    optional :service_level_objective, :message, 2, "google.monitoring.v3.ServiceLevelObjective"
  end
  add_message "google.monitoring.v3.GetServiceLevelObjectiveRequest" do
    optional :name, :string, 1
    optional :view, :enum, 2, "google.monitoring.v3.ServiceLevelObjective.View"
  end
  add_message "google.monitoring.v3.ListServiceLevelObjectivesRequest" do
    optional :parent, :string, 1
    optional :filter, :string, 2
    optional :page_size, :int32, 3
    optional :page_token, :string, 4
    optional :view, :enum, 5, "google.monitoring.v3.ServiceLevelObjective.View"
  end
  add_message "google.monitoring.v3.ListServiceLevelObjectivesResponse" do
    repeated :service_level_objectives, :message, 1, "google.monitoring.v3.ServiceLevelObjective"
    optional :next_page_token, :string, 2
  end
  add_message "google.monitoring.v3.UpdateServiceLevelObjectiveRequest" do
    optional :service_level_objective, :message, 1, "google.monitoring.v3.ServiceLevelObjective"
    optional :update_mask, :message, 2, "google.protobuf.FieldMask"
  end
  add_message "google.monitoring.v3.DeleteServiceLevelObjectiveRequest" do
    optional :name, :string, 1
  end
end

module Google
  module Monitoring
    module V3
      CreateServiceRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.CreateServiceRequest").msgclass
      GetServiceRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.GetServiceRequest").msgclass
      ListServicesRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.ListServicesRequest").msgclass
      ListServicesResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.ListServicesResponse").msgclass
      UpdateServiceRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UpdateServiceRequest").msgclass
      DeleteServiceRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.DeleteServiceRequest").msgclass
      CreateServiceLevelObjectiveRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.CreateServiceLevelObjectiveRequest").msgclass
      GetServiceLevelObjectiveRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.GetServiceLevelObjectiveRequest").msgclass
      ListServiceLevelObjectivesRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.ListServiceLevelObjectivesRequest").msgclass
      ListServiceLevelObjectivesResponse = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.ListServiceLevelObjectivesResponse").msgclass
      UpdateServiceLevelObjectiveRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.UpdateServiceLevelObjectiveRequest").msgclass
      DeleteServiceLevelObjectiveRequest = Google::Protobuf::DescriptorPool.generated_pool.lookup("google.monitoring.v3.DeleteServiceLevelObjectiveRequest").msgclass
    end
  end
end
